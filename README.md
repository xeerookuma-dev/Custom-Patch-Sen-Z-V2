# Custom-Patch-Sen-Z-V2

[🇹🇭 ภาษาไทย](#ภาษาไทย) | [🇬🇧 English](#english)

---

## ภาษาไทย

แพทช์ข้อความกำหนดเองสำหรับ Zenless Zone Zero พร้อมระบบฝังข้อความแบบง่ายดาย

### ✨ ฟีเจอร์

✅ **แก้ไขข้อความกำหนดเองได้ง่าย**
- โหลดข้อความจากไฟล์ `src/custom` ตอน build
- แก้ไขข้อความเป็น plain text พร้อมรองรับ Rich Text formatting
- rebuild ง่ายๆ เพื่ออัพเดทข้อความ
- ไม่มีการเข้ารหัสที่ซับซ้อนหรือ hardcoded strings

✅ **เรียบง่าย & สะอาด**
- แก้ไขโค้ดน้อยที่สุด
- ดูแลรักษาง่าย
- เสถียรและน่าเชื่อถือ

### 🆕 การเปลี่ยนแปลงล่าสุด (v2.0)

#### ✨ ระบบข้อความที่เรียบง่ายขึ้น
**ก่อนหน้า**: array ที่เข้ารหัสซับซ้อนพร้อม manual encoding
```zig
// เก่า: Hardcoded encrypted array
var d: [39]u16 = @splat(0);
for ([_]u16{ 27818, 40348, ... }, 0..d.len - 1) |v, i| {
    // Complex decryption logic
}
```

**ตอนนี้**: ฝังไฟล์โดยตรงด้วย `@embedFile`
```zig
// ใหม่: Simple file embedding
const custom_message = @embedFile("custom");
```

#### 🎯 ประโยชน์
- ✅ **แก้ไขง่ายขึ้น**: แค่แก้ไขไฟล์ `src/custom`
- ✅ **โค้ดสะอาดขึ้น**: ลบโค้ดเข้ารหัสที่ซับซ้อน 7 บรรทัด
- ✅ **build เร็วขึ้น**: ไม่ต้องถอดรหัสตอน runtime
- ✅ **ดูแลง่ายขึ้น**: plain text แทน encrypted arrays

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
- `zig-out/bin/xeekuma.dll` → Game folder
- `src/custom` → Game folder (วางไว้ข้างๆ DLL)

#### 4. รัน Injector
รัน injector เพื่อโหลด DLL เข้าเกม

#### 5. เห็นข้อความของคุณ
ข้อความกำหนดเองจะปรากฏในเกมทันที!

### 🔄 การอัพเดทข้อความ

**ตัวเลือก 1: แก้ไขไฟล์ในเกม (ไม่แนะนำ)**
- แก้ไขไฟล์ `custom` ใน game folder
- ⚠️ ข้อความจะไม่อัพเดททันที (เกม cache ไว้)
- ต้องเปลี่ยนภาษาในเกม (EN → 中文 → EN) เพื่อ refresh UI

**ตัวเลือก 2: Rebuild (แนะนำ)**
1. แก้ไข `src/custom` ในโปรเจค
2. รัน `zig build`
3. คัดลอก `xeekuma.dll` ใหม่ไปแทนที่ของเดิม
4. รีสตาร์ทเกม

### 🛠️ รายละเอียดทางเทคนิค

- **ภาษา**: Zig 0.15.1+
- **เป้าหมาย**: Zenless Zone Zero (Il2Cpp Unity game)
- **วิธีการ**: DLL injection พร้อม function hooking
- **การเก็บข้อความ**: Build-time embedding ผ่าน `@embedFile("custom")`
- **Dependencies**: zigzag (hooking framework)

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

- **ผู้พัฒนา**: xeeroookuma
- **Framework**: Zig + zigzag
- **เกม**: Zenless Zone Zero โดย miHoYo

### 📜 ลิขสิทธิ์

เพื่อการศึกษาเท่านั้น

---

## English

Custom message patch for Zenless Zone Zero with simplified build-time message embedding.

### ✨ Features

✅ **Easy Custom Message Editing**
- Message loaded from `src/custom` file at build time
- Edit message in plain text with Rich Text formatting support
- Simple rebuild process to update message
- No complex encryption or hardcoded strings

✅ **Simple & Clean**
- Minimal code changes
- Easy to maintain
- Stable and reliable

```

#### 🎯 Benefits
- ✅ **Easier to modify**: Just edit `src/custom` file
- ✅ **Cleaner code**: Removed 7 lines of complex encryption logic
- ✅ **Faster builds**: No runtime decryption needed
- ✅ **Better maintainability**: Plain text instead of encrypted arrays

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
- `zig-out/bin/xeekuma.dll` → Game folder
- `src/custom` → Game folder (place next to DLL)

#### 4. Run Injector
Run the injector to load the DLL into the game.

#### 5. See Your Message
Your custom message will appear in the game immediately!

### 🔄 Updating Messages

**Option 1: Edit in-game file (Not Recommended)**
- Edit the `custom` file in game folder
- ⚠️ Message won't update immediately (game caches it)
- Must change language in-game (EN → 中文 → EN) to refresh UI

**Option 2: Rebuild (Recommended)**
1. Edit `src/custom` in project
2. Run `zig build`
3. Copy new `xeekuma.dll` to replace the old one
4. Restart game

### 🛠️ Technical Details

- **Language**: Zig 0.15.1+
- **Target**: Zenless Zone Zero (Il2Cpp Unity game)
- **Method**: DLL injection with function hooking
- **Message Storage**: Build-time embedding via `@embedFile("custom")`
- **Dependencies**: zigzag (hooking framework)

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

- **Developer**: xeeroookuma
- **Framework**: Zig + zigzag
- **Game**: Zenless Zone Zero by miHoYo

### 📜 License

For educational purposes only.
