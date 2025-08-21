# Enable Group Policy Editor (gpedit.msc) on Windows 10 Home 
Author : 0xFrPr

##  Overview
By default, **Windows 10 Home** does not include the Local Group Policy Editor (`gpedit.msc`).  
This script enables the hidden Group Policy packages using **DISM**, so that you can use `gpedit.msc` on Home editions.

---

##  Features
- Installs **Group Policy Client Tools** and **Client Extensions** packages.
- Runs `DISM /restorehealth` to fix component store issues.
- Runs `sfc /scannow` to verify system files.
- Fully automated — just run it as Administrator.

---

## Usage
1. Download the script:
2. Right-click → **Run as Administrator**.
3. Wait until it finishes (may take several minutes).
4. Restart your computer.
5. Press **Win + R**, type:
6. then press Enter.

---

## Notes
- Works only on **Windows 10 Home (64-bit)**.
- Must be executed with **Administrator privileges**.
- Package names may vary depending on your **Windows build**.  
The script uses `*.mum` wildcards to automatically detect the correct files.
- If DISM fails, run manually:
```cmd
dism /online /cleanup-image /restorehealth
sfc /scannow



