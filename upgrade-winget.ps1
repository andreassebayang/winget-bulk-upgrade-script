# Daftar ID aplikasi yang ingin dikecualikan dari upgrade
$excludedPackages = @(
    "Microsoft.PowerShell",
    "Cisco.Webex"
    #Tambahkan listnya seperti pola diatas jika masih ada
    #"Postman.Postman"
)

# Ambil daftar aplikasi upgradable
$upgradableAppsRaw = winget upgrade
$appsToUpgrade = @()
$lines = $upgradableAppsRaw | Select-Object -Skip 3

foreach ($line in $lines) {
    if ([string]::IsNullOrWhiteSpace($line)) { continue }

    $columns = $line -split '\s{2,}'
    if ($columns.Count -lt 2) { continue }

    $pkgId = $columns[1].Trim()

    # Skip jika ID adalah "Id" atau tidak valid
    if ($pkgId -eq "Id" -or $pkgId -notmatch '^[A-Za-z0-9.]+$') { continue }

    if ($excludedPackages -notcontains $pkgId) {
        $appsToUpgrade += $pkgId
    }
}

Write-Host "`nDaftar paket yang akan di-upgrade (kecuali yang dikecualikan):" -ForegroundColor Yellow
$appsToUpgrade | ForEach-Object { Write-Host "- $_" }

foreach ($pkg in $appsToUpgrade) {
    $startTime = Get-Date -Format "HH:mm:ss"
    Write-Host ""
    Write-Host "Memulai upgrade untuk: $pkg ($startTime)" -ForegroundColor Cyan
    Write-Host "Sedang memproses $pkg..."

    # Jalankan upgrade
    winget upgrade --id $pkg --silent | Out-Null

    $endTime = Get-Date -Format "HH:mm:ss"
    Write-Host "Selesai upgrade $pkg ✔ ($endTime)" -ForegroundColor Green
}
