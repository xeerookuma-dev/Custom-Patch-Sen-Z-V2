const std = @import("std");
const root = @import("root");
const zz = @import("zigzag");
const util = @import("util.zig");
const offsets = root.offsets;

const sdk_public_key = @embedFile("sdk_public_key.xml");
const server_public_key = @embedFile("server_public_key.xml");
const custom_message_default = @embedFile("custom"); // Fallback default

var msg_buffer: [4096]u8 = undefined;

fn readCustomMessage() ![]const u8 {
    // Static buffer for path operations
    var path_buf: [std.fs.max_path_bytes]u8 = undefined;
    var fba = std.heap.FixedBufferAllocator.init(&path_buf);
    const allocator = fba.allocator();

    // Get executable directory
    var exe_buf: [std.fs.max_path_bytes]u8 = undefined;
    const exe_path = try std.fs.selfExePath(&exe_buf);
    const exe_dir = std.fs.path.dirname(exe_path) orelse ".";

    // Build path to custom file
    const custom_path = try std.fs.path.join(allocator, &[_][]const u8{ exe_dir, "custom" });

    // Read the custom file into static buffer
    const file = try std.fs.cwd().openFile(custom_path, .{});
    defer file.close();

    const bytes_read = try file.readAll(&msg_buffer);

    // Ensure null termination for C-string compatibility
    if (bytes_read < msg_buffer.len) {
        msg_buffer[bytes_read] = 0;
    } else {
        msg_buffer[msg_buffer.len - 1] = 0;
    }

    return msg_buffer[0..bytes_read];
}

pub fn monitorCustomMessage() void {
    while (true) {
        std.Thread.sleep(std.time.ns_per_s * 2);

        const msg = readCustomMessage() catch continue;
        const base = root.base;
        @as(*usize, @ptrFromInt(base + offsets.unwrapOffset(.CRYPTO_STR_2))).* = util.ptrToStringAnsi(msg);
    }
}

pub fn init(allocator: zz.ChunkAllocator) void {
    const base = root.base;

    @as(*usize, @ptrFromInt(base + offsets.unwrapOffset(.CRYPTO_STR_1))).* = util.ptrToStringAnsi(sdk_public_key);

    // Initial read
    const custom_msg = readCustomMessage() catch |err| blk: {
        std.log.warn("Failed to read custom file: {}, using default message", .{err});
        break :blk custom_message_default;
    };

    @as(*usize, @ptrFromInt(base + offsets.unwrapOffset(.CRYPTO_STR_2))).* = util.ptrToStringAnsi(custom_msg);

    // Spawn monitor thread
    const thread = std.Thread.spawn(.{}, monitorCustomMessage, .{}) catch |err| {
        std.log.err("Failed to spawn monitor thread: {}", .{err});
        return; // Continue without monitoring if spawn fails
    };
    thread.detach();

    initializeRsaCryptoServiceProvider();

    _ = root.intercept(allocator, base + offsets.unwrapOffset(.SDK_RSA_ENCRYPT), SdkRsaEncryptHook);
    _ = root.intercept(allocator, base + offsets.unwrapOffset(.NETWORK_STATE_CHANGE), NetworkStateHook);
}

const SdkRsaEncryptHook = struct {
    pub var originalFn: *const fn (usize, usize) callconv(.c) usize = undefined;

    pub fn callback(_: usize, a2: usize) callconv(.c) usize {
        std.log.debug("Replacing SDK RSA key", .{});
        return @This().originalFn(
            util.ptrToStringAnsi(sdk_public_key),
            a2,
        );
    }
};

const NetworkStateHook = struct {
    pub var originalFn: *const fn (usize, usize) callconv(.c) usize = undefined;

    pub fn callback(state: usize, a2: usize) callconv(.c) usize {
        if (state == 15) initializeRsaCryptoServiceProvider();
        return @This().originalFn(state, a2);
    }
};

pub fn initializeRsaCryptoServiceProvider() void {
    const base = root.base;

    const statics = @as(*usize, @ptrFromInt(base + offsets.unwrapOffset(.RSA_STATICS))).*;
    const rcsp_field: *usize = @ptrFromInt(statics + offsets.unwrapOffset(.RSA_STATIC_ID));

    const rsaCreate: *const fn () callconv(.c) usize = @ptrFromInt(base + offsets.unwrapOffset(.RSA_CREATE));
    const rsaFromXmlString: *const fn (usize, usize) callconv(.c) void = @ptrFromInt(base + offsets.unwrapOffset(.RSA_FROM_XML_STRING));

    const instance = rsaCreate();
    rsaFromXmlString(instance, util.ptrToStringAnsi(server_public_key));

    rcsp_field.* = instance;
}
