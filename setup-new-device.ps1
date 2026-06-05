# Run this on any new Windows device after OneDrive has synced
# Creates the ~/.claude junction and sets up backup scheduled tasks

$claudeDir = "$env:USERPROFILE\.claude"
$oneDriveDir = "$env:USERPROFILE\OneDrive\claude-dotfiles"

if (-not (Test-Path $oneDriveDir)) {
    Write-Error "OneDrive not synced yet. Wait for OneDrive\claude-dotfiles to appear."
    exit 1
}

# Remove existing .claude if present
if (Test-Path $claudeDir) {
    Write-Host "Backing up existing $claudeDir to $claudeDir.bak ..."
    Rename-Item $claudeDir "$claudeDir.bak" -Force
}

# Create junction
New-Item -ItemType Junction -Path $claudeDir -Target $oneDriveDir
Write-Host "Created junction: $claudeDir -> $oneDriveDir"

# Register backup scheduled tasks
$ps = "$oneDriveDir\backup.ps1"
schtasks /create /tn "ClaudeDotfiles-Weekly"   /tr "powershell -NonInteractive -File `"$ps`" -Type weekly"    /sc WEEKLY  /d SUN /st 02:00 /f | Out-Null
schtasks /create /tn "ClaudeDotfiles-Monthly"  /tr "powershell -NonInteractive -File `"$ps`" -Type monthly"   /sc MONTHLY /d 1   /st 02:00 /f | Out-Null
schtasks /create /tn "ClaudeDotfiles-Quarterly"/tr "powershell -NonInteractive -File `"$ps`" -Type quarterly" /sc MONTHLY /d 1 /m JAN,APR,JUL,OCT /st 02:00 /f | Out-Null
schtasks /create /tn "ClaudeDotfiles-Yearly"   /tr "powershell -NonInteractive -File `"$ps`" -Type yearly"    /sc MONTHLY /d 1 /m JAN /st 02:00 /f | Out-Null
Write-Host "Scheduled backup tasks created."

Write-Host "`nAll done. Open Claude Code."
