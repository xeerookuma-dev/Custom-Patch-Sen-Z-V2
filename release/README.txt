# 📦 Custom-Patch-Sen-Z-V2 Release Notes

## [v2.4] - 2026-01-22

### 🔥 Main Features (ฟีเจอร์หลัก)
- **Runtime Updates**: แก้ไขไฟล์ `custom` แล้วสลับภาษาในเกมเพื่อดูผลทันที!
- **Robust Path Finding**: ใช้ระบบหาไฟล์แบบใหม่ ลบปัญหา "Still the same" หรือหาไฟล์ไม่เจอ
- **Background Monitor**: ตรวจสอบการแก้ไขไฟล์ทุกๆ 2 วินาที

---

## 🇹🇭 คำอธิบาย (Thai)

### 📋 ไฟล์ในแพ็คเกจนี้

- **xeroxua.dll** - ไฟล์ DLL หลักที่ใช้ inject เข้าเกม
- **xeroxuakuma.exe** - Injector สำหรับโหลด DLL เข้าเกม
- **custom** - ไฟล์ข้อความกำหนดเอง (แก้ไขได้)
- **README.txt** - คู่มือการใช้งาน

### 🚀 วิธีติดตั้ง

1. **แตกไฟล์ zip** ไปที่ folder เกม Zenless Zone Zero
   - ตัวอย่าง: `E:\Program Files\.PSClients\Sen-Z_PS\CNBetaWin2.6.x\`
   
2. **ตรวจสอบไฟล์** ให้แน่ใจว่ามีไฟล์ทั้ง 3 อยู่ใน folder เกม:
   - ✅ `xeroxua.dll`
   - ✅ `xeroxuakuma.exe`
   - ✅ `custom`

3. **รัน Injector**
   - เปิดเกม Zenless Zone Zero ก่อน
   - รัน `xeroxuakuma.exe`
   - รอจนกว่าจะเห็นข้อความ "Injection successful"

4. **เช็คข้อความ**
   - กลับไปที่เกม
   - คุณจะเห็นข้อความกำหนดเองปรากฏในเกม

### ✏️ การแก้ไขข้อความ (v2.4)

#### วิธีที่ 1: Runtime Edit (แนะนำ!)
1. เปิดไฟล์ `custom` ด้วย Notepad
2. แก้ไขข้อความ และ Save (Ctrl+S)
3. **เปลี่ยนภาษาในเกม** เพื่อ Refresh UI
   *(เกมจำเป็นต้องโหลด Text ใหม่ถึงจะเห็นความเปลี่ยนแปลง)*

#### วิธีที่ 2: Rebuild (สำหรับนักพัฒนา)
1. แก้ไข code ใน `src/custom` หรือ `crypto.zig`
2. รัน `zig build`
3. ก๊อปปี้ `xeroxua.dll` ไปลงทับ

### 🎨 การใช้ Rich Text

ไฟล์ `custom` รองรับ Unity Rich Text tags:

```
<color=#ff0000>ข้อความสีแดง</color>
<color=#00ff00>ข้อความสีเขียว</color>
<color=#0000ff>ข้อความสีน้ำเงิน</color>
<b>ตัวหนา</b>
<i>ตัวเอียง</i>
```

**ตัวอย่าง:**
```
<color=#ff0000>นี่คือเวอร์ชั่นทดสอบ</color> <color=#00ff00>Zenless Zone Zero</color> | <color=#FFFFFF>xeeroookuma</color>
```

### - ⚠️ ใช้เพื่อการศึกษาเท่านั้น

**ปัญหา: ข้อความไม่แสดง**
- ✅ ตรวจสอบว่าไฟล์ `custom` อยู่ใน folder เกม
- ✅ ลองเปลี่ยนภาษาในเกม

---

## 🇬🇧 Description (English)

### 📋 Files in this Package

- **xeroxua.dll** - Main DLL file to inject into the game
- **xeroxuakuma.exe** - Injector to load DLL into the game
- **custom** - Custom message file (editable)
- **README.txt** - User guide

### 🚀 Installation

1. **Extract zip** to your Zenless Zone Zero game folder
   - Example: `E:\Program Files\.PSClients\Sen-Z_PS\CNBetaWin2.6.x\`
   
2. **Verify files** - Make sure all 3 files are in the game folder:
   - ✅ `xeroxua.dll`
   - ✅ `xeroxuakuma.exe`
   - ✅ `custom`

3. **Run Injector**
   - Open Zenless Zone Zero first
   - Run `xeroxuakuma.exe`
   - Wait for "Injection successful" message

4. **Check Message**
   - Return to the game
   - You'll see your custom message appear

### ✏️ Editing Messages (v2.4)

#### Method 1: Runtime Edit (Recommended!)
1. Open `custom` file with Notepad.
2. Edit message and Save (Ctrl+S).
3. **Change Game Language** to Refresh UI.
   *(Required to force the game to reload the text)*

#### Method 2: Rebuild (Devs)
1. Modify source code.
2. Run `zig build`.
3. Replace `xeroxua.dll`.

### 🎨 Using Rich Text

The `custom` file supports Unity Rich Text tags:

```
<color=#ff0000>Red text</color>
<color=#00ff00>Green text</color>
<color=#0000ff>Blue text</color>
<b>Bold text</b>
<i>Italic text</i>
```

**Example:**
```
<color=#ff0000>This is a test version</color> <color=#00ff00>Zenless Zone Zero</color> | <color=#FFFFFF>xeeroookuma</color>
```

### ⚠️ Warnings

- ⚠️ For educational purposes only
- ⚠️ May be detected by anti-cheat (use at your own risk)
- ⚠️ Backup your data before use
- ⚠️ Not responsible for any damages

### 🔧 Troubleshooting

**Problem: Injector doesn't work**
- ✅ Check if game is running
- ✅ Run injector as Administrator
- ✅ Temporarily disable antivirus

**Problem: Message doesn't show**
- ✅ Verify `custom` file is in game folder
- ✅ Try changing language in-game
- ✅ Restart game and inject again

**Problem: Game crashes**
- ✅ Check if using correct DLL version
- ✅ Remove DLL and restart game

---

## 📞 Support

- **GitHub**: https://github.com/xeerookuma/Custom-Patch-Sen-Z-V2
- **Developer**: xeerookuma
- **Discord**: https://discord.gg/QwfTnEdAtN
- **Version**: 2.4

## 📜 License

For educational purposes only. Use at your own risk.
