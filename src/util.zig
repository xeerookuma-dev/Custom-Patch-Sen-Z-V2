const root = @import("root");
const std = @import("std");

pub fn readCSharpString(data: usize) []u16 {
    const len = @as(*const u32, @ptrFromInt(data + 16)).*;
    const ptr = @as([*]u16, @ptrFromInt(data + 20));
    return ptr[0..len];
}

pub fn csharpStringReplace(object: usize, pattern: []const u16, replacement: []const u16, startIndex: usize) void {
    const str = readCSharpString(object);

    @memcpy(str[startIndex .. startIndex + replacement.len], replacement);
    @memmove(str[startIndex + replacement.len .. str.len - (pattern.len - replacement.len)], str[startIndex + pattern.len .. str.len]);
    // str[@intCast(str.len - (pattern.len - replacement.len))] = 0;
    @as(*u32, @ptrFromInt(object + 16)).* = @intCast(str.len - (pattern.len - replacement.len));
}

pub fn ptrToStringAnsi(str: []const u8) usize {
    return @as(*const fn ([*]const u8) callconv(.c) usize, @ptrFromInt(root.base + root.offsets.unwrapOffset(.PTR_TO_STRING_ANSI)))(str.ptr);
}

pub fn updateCSharpString(object: usize, new_content: []const u8) void {
    const len_ptr = @as(*u32, @ptrFromInt(object + 16));
    const data_ptr = @as([*]u16, @ptrFromInt(object + 20));

    var utf16_len: usize = 0;
    var it = std.unicode.Utf8View.init(new_content) catch return;
    var iter = it.iterator();
    while (iter.nextCodepoint()) |cp| {
        if (cp < 0x10000) {
            data_ptr[utf16_len] = @intCast(cp);
            utf16_len += 1;
        } else {
            const high = @as(u16, @intCast((cp - 0x10000) >> 10)) + 0xD800;
            const low = @as(u16, @intCast((cp - 0x10000) & 0x3FF)) + 0xDC00;
            data_ptr[utf16_len] = high;
            data_ptr[utf16_len + 1] = low;
            utf16_len += 2;
        }
    }
    len_ptr.* = @intCast(utf16_len);
    data_ptr[utf16_len] = 0; // Null terminator for compatibility
}
