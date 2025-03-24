# Ensure script runs with admin privileges
if (-not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
    Write-Host "Please run this script as Administrator." -ForegroundColor Red
    exit
}

# Install Oh My Posh
Write-Host "⬇ Installing Oh My Posh..." -ForegroundColor Cyan
winget install JanDeDobbeleer.OhMyPosh -s winget -e

# Install required modules
$modules = @("posh-git", "Terminal-Icons", "PSReadLine")
foreach ($module in $modules) {
    if (-not (Get-Module -ListAvailable -Name $module)) {
        Write-Host "⬇ Installing $module..." -ForegroundColor Cyan
        Install-Module $module -Scope CurrentUser -Force -AllowClobber
    } else {
        Write-Host "✔ $module is already installed." -ForegroundColor Green
    }
}

# Path to theme config
$ompConfig = "$HOME\Documents\PowerShell\amro.omp.json"

# Download theme if not found
if (-not (Test-Path $ompConfig)) {
    Write-Host "⬇ Downloading amro.omp.json theme..." -ForegroundColor Cyan
    Invoke-WebRequest -Uri "https://raw.githubusercontent.com/HZDigital/Scripts/refs/heads/main/amro.omp.json" -OutFile $ompConfig
} else {
    Write-Host "✔ Theme file already exists at $ompConfig." -ForegroundColor Green
}

# Ensure PowerShell profile exists
if (-not (Test-Path -Path $PROFILE)) {
    New-Item -ItemType File -Path $PROFILE -Force
}

# Append configuration to profile
Write-Host "🛠️ Configuring PowerShell profile..." -ForegroundColor Cyan

@"
Import-Module -Name posh-git
Import-Module -Name Terminal-Icons
Import-Module -Name PSReadLine

Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -PredictionViewStyle ListView
Set-PSReadLineOption -EditMode Windows

try {
    oh-my-posh init pwsh --config '$ompConfig' | Invoke-Expression
} finally {
}

# Ensure fnm is in path and env hook works
if (Get-Command fnm -ErrorAction SilentlyContinue) {
    fnm env --use-on-cd | Out-String | Invoke-Expression
}

Set-Alias -Name "ls -al" -Value "ls"
"@ | Out-File -FilePath $PROFILE -Encoding utf8 -Append

Write-Host "✅ Setup complete. Restart PowerShell to see the changes." -ForegroundColor Green
