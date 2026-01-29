# Custom-Patch-Sen-Z-V2

[🇹🇭 ภาษาไทย](#ภาษาไทย) | [🇬🇧 English](#english)

---

## ภาษาไทย

แพทช์ข้อความกำหนดเองสำหรับ Zenless Zone Zero พร้อมระบบฝังข้อความแบบง่ายดาย

### ✨ ฟีเจอร์

✅ **แก้ไขข้อความกำหนดเองได้ง่าย**
- โหลดข้อความจากไฟล์ `src/custom` ตอน build
- แก้ไขข้อความเป็น plain text พร้อมรองรับ Rich Text formatting

### 🆕 การเปลี่ยนแปลงล่าสุด (v2.4)

#### ✨ ระบบ Runtime Update
**ก่อนหน้า**: อ่านไฟล์ครั้งเดียวตอนเปิดเกม หรือฝังมากับ DLL
**ตอนนี้**: 
- 🔄 **Runtime Monitoring**: โปรแกรมจะคอยตรวจจับการแก้ไขไฟล์ `custom` ทุก 2 วินาที
- ✅ **แก้ไขได้โดยไม่ต้องเปิดปิดเกมใหม่**: เพียงแค่สลับภาษาเพื่อ Refresh UI

### 📖 วิธีใช้งาน

#### 1. ติดตั้ง
1. แตกไฟล์ zip ลงใน folder เกม Zenless Zone Zero
2. ตรวจสอบว่ามีไฟล์ `xeroxua.dll`, `xeroxuakuma.exe`, และ `custom` อยู่ด้วยกัน

#### 2. รัน Injector
รัน `xeroxuakuma.exe` เพื่อโหลด DLL เข้าเกม (รันเป็น Admin)

#### 3. แก้ไขข้อความ
1. เปิดไฟล์ `custom` ใน folder เกมด้วย Notepad
2. แก้ไขข้อความตามต้องการ (รองรับ Rich Text)
3. กด Save (Ctrl+S)
4. **เปลี่ยนภาษาในเกม** (เช่น EN → 中文 → EN) เพื่อให้ข้อความอัพเดท
   *(จำเป็นต้องเปลี่ยนภาษาเพื่อให้เกมโหลดข้อความใหม่)*

### 📖 วิธีใช้งาน

#### 1. แก้ไขข้อความของคุณ
แก้ไขไฟล์ `src/custom` ด้วยข้อความที่ต้องการ:
```
<color=#ff0000>ข้อความกำหนดเองของคุณ</color> <color=#00ff00>Zenless Zone Zero</color>
```

รองรับ Unity Rich Text tags:
- `<color=#RRGGBB>text</color>` - ข้อความสี
- `<b>text</b>` - ตัวหนา
- `<i>text</i>` - ตัวเอียง

#### 2. Build โปรเจค
```powershell
zig build
```

#### 3. Deploy ไฟล์
คัดลอกไฟล์ทั้งสองนี้ไปที่ folder เกม:
- `zig-out/bin/xeroxua.dll` → Game folder
- `src/custom` → Game folder (วางไว้ข้างๆ DLL)

#### 4. รัน Injector
รัน injector เพื่อโหลด DLL เข้าเกม

#### 5. เห็นข้อความของคุณ
ข้อความกำหนดเองจะปรากฏในเกมทันที!

### 🔄 การอัพเดทข้อความ

**วิธีที่แนะนำ (Runtime Edit)**
- แก้ไขไฟล์ `custom` ใน game folder ได้เลย
- **เปลี่ยนภาษาในเกม** เพื่อ Refresh หน้าจอ
- ไม่ต้องปิดเกม!

### 🛠️ รายละเอียดทางเทคนิค

- **ภาษา**: Zig 0.15.1+
- **เป้าหมาย**: Zenless Zone Zero (Il2Cpp Unity game)
- **วิธีการ**: DLL injection + Function Hooking + Background Thread
- **การโหลดข้อความ**: Runtime file reading + Polling (2s interval)
- **Path Finding**: `std.fs.selfExePath` (Robust resolution)

### 📁 โครงสร้างไฟล์

```
Custom-Patch-Sen-Z-V2/
├── src/
│   ├── root.zig          # จุดเริ่มต้นหลัก
│   ├── crypto.zig        # RSA crypto hooks & message loading
│   ├── network.zig       # Network request hooks
│   ├── util.zig          # ฟังก์ชันเสริม
│   └── custom            # 📝 ไฟล์ข้อความกำหนดเอง (แก้ไขที่นี่!)
├── assets/
│   ├── offsets           # Memory offsets
│   ├── sdk_public_key.xml
│   └── server_public_key.xml
├── injector.zig          # DLL injector
├── build.zig             # Build configuration
└── build.zig.zon         # Package dependencies
```

### 👤 เครดิต

- **ผู้พัฒนา**: [xeerookuma](https://github.com/xeerookuma)
- **Discord**: [Join Server](https://discord.gg/QwfTnEdAtN)
- **Framework**: Zig + zigzag
- **เกม**: Zenless Zone Zero โดย miHoYo

### 📜 ลิขสิทธิ์

เพื่อการศึกษาเท่านั้น

---

## English

Custom message patch for Zenless Zone Zero with simplified build-time message embedding.

### ✨ Features


✅ **Runtime Custom Message Editing**
- Message loaded from `src/custom` file
- **Runtime Updates**: Edit file and switch language to see changes

### 🆕 Recent Changes (v2.4)

#### ✨ Runtime Update System
**Previously**: Loaded file once at startup or embedded in DLL.
**Now**:
- 🔄 **Runtime Monitoring**: Automatically detects changes to `custom` file every 2 seconds.
- ✅ **No Restart Needed**: Just switch language to refresh the UI.

### 📖 How to Use

#### 1. Installation
1. Extract zip to Zenless Zone Zero game folder.
2. Ensure `xeroxua.dll`, `xeroxuakuma.exe`, and `custom` are present.

#### 2. Run Injector
Run `xeroxuakuma.exe` to inject the DLL. (Run as Admin)

#### 3. Edit Message
1. Open `custom` file in game folder with Notepad.
2. Edit message (Rich Text supported).
3. Save (Ctrl+S).
4. **Change Game Language** (e.g., EN → 中文 → EN) to refresh the UI.
   *(Required to force the game to reload the text)*

### 📖 How to Use

#### 1. Edit Your Message
Edit `src/custom` file with your custom message:
```
<color=#ff0000>Your custom text here</color> <color=#00ff00>Zenless Zone Zero</color>
```

Supports Unity Rich Text tags:
- `<color=#RRGGBB>text</color>` - Colored text
- `<b>text</b>` - Bold text
- `<i>text</i>` - Italic text

#### 2. Build Project
```powershell
zig build
```

#### 3. Deploy Files
Copy both files to your game folder:
- `zig-out/bin/xeroxua.dll` → Game folder
- `src/custom` → Game folder (place next to DLL)

#### 4. Run Injector
Run the injector to load the DLL into the game.

#### 5. See Your Message
Your custom message will appear in the game immediately!

### 🔄 Updating Messages

**Recommended Method (Runtime Edit)**
- Simply edit the `custom` file in the game folder.
- **Switch Language** in-game to see the update.
- No game restart required!

### 🛠️ Technical Details

- **Language**: Zig 0.15.1+
- **Target**: Zenless Zone Zero (Il2Cpp Unity game)
- **Method**: DLL injection + Function Hooking + Background Thread
- **Message Loading**: Runtime file reading + Polling (2s interval)
- **Path Finding**: `std.fs.selfExePath` (Robust resolution)

### 📁 File Structure

```
Custom-Patch-Sen-Z-V2/
├── src/
│   ├── root.zig          # Main entry point
│   ├── crypto.zig        # RSA crypto hooks & message loading
│   ├── network.zig       # Network request hooks
│   ├── util.zig          # Utility functions
│   └── custom            # 📝 Your custom message file (edit this!)
├── assets/
│   ├── offsets           # Memory offsets
│   ├── sdk_public_key.xml
│   └── server_public_key.xml
├── injector.zig          # DLL injector
├── build.zig             # Build configuration
└── build.zig.zon         # Package dependencies
```

### 👤 Credits

- **Developer**: [xeerookuma](https://github.com/xeerookuma)
- **Discord**: [Join Server](https://discord.gg/QwfTnEdAtN)
- **Framework**: Zig + zigzag
- **Game**: Zenless Zone Zero by miHoYo

### 📜 License

For educational purposes only.
