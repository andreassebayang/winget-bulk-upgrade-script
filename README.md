# Winget Bulk Upgrade Script

This PowerShell script allows you to **upgrade multiple Windows applications** at once using the `winget` package manager.  
You can **exclude specific packages** from being upgraded, and track start/finish times for each application update.

---

## 📦 Features

- ✅ Batch upgrade all available packages via `winget`
- ❌ Skip specific packages by their ID (e.g., PowerShell, Winbox)
- 🕐 Logs start and finish time of each upgrade
- 💬 Clean CLI output for easier monitoring

---

## 🚀 Usage

1. Clone the repository or download the script:
   ```bash
   git clone https://github.com/aspitsme/winget-bulk-upgrade-script.git
   ```

2. Open PowerShell as Administrator
   ```
   cd path\to\winget-bulk-upgrade-script
   ```
3. Navigate to the script folder:
   ```
   cd path\to\winget-bulk-upgrade-script
   ```
4. Run the script
   ```
   .\upgrade-winget.ps1
   ```
   if you get an execution policy error, run:
   ```
   Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
   ```

⚙️ Customize
Edit the following part of the script to exclude apps by PackageIdentifier:
```
$excludedPackages = @(
    "Microsoft.PowerShell",
    "Postman.Postman"
)
```
You can find the exact PackageIdentifier using:
```
winget list
```
