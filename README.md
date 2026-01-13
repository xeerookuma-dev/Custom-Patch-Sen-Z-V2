# Custom-Patch Sen-Z V2 (Windows)

A powerful and lightweight custom patch injector and network utility for game optimization and feature enhancement on Windows. Specifically designed for compatibility with "Sen Z" related projects.

## 🚀 Features

- **Real-time Patching**: Apply changes to the game without full restarts (experimental).
- **Network Optimization**: Enhanced network handling via custom crypto and network modules.
- **Discord Integration**: Automatic commit and event notifications to Discord webhooks (Bash & PowerShell support).
- **Zig Powered**: Built with Zig for high performance and native Windows compatibility.

## 🛠️ Windows Requirements

- **Zig**: Version `0.13.0` or later (Recommended: `1.15.0`). Download from [ziglang.org](https://ziglang.org/download/).
- **Git for Windows**: Required for version control and commit tracking.
- **PowerShell 7+**: Recommended for running automation scripts.

## 📦 Installation (Windows)

1. **Clone the repository**:
   Open PowerShell and run:
   ```powershell
   git clone https://github.com/xeerookuma-dev/Custom-Patch-Sen-Z-V2.git
   cd Custom-Patch-Sen-Z-V2
   ```

2. **Configure Discord Notifications**:
   - For PowerShell users, edit `discord-notify.ps1` and add your Webhook URL.
   - For Bash/Git Bash users, edit `discord-notify.sh`.

## 🔨 Build Instructions

To build the project on Windows:

```powershell
# Build in Debug mode
zig build

# Build in ReleaseSafe mode (optimized)
zig build -Doptimize=ReleaseSafe
```

The output executables will be located in the `zig-out\bin` directory.

## 🔗 Configuration

### Discord Webhook (PowerShell)

You can use the native PowerShell script to send notifications:

```powershell
.\discord-notify.ps1
```

It automatically captures your Git committer info, GitHub avatar, and commit details.

---

*Note: This project is for educational and development purposes on Windows systems.* 