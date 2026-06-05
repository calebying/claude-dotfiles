# Run this AFTER closing Claude Code
# It replaces ~/.claude with a junction pointing to OneDrive

$claudeDir = "$env:USERPROFILE\.claude"
$oneDriveDir = "$env:USERPROFILE\OneDrive\claude-dotfiles"

# Verify OneDrive copy exists
if (-not (Test-Path $oneDriveDir)) {
    Write-Error "OneDrive folder not found: $oneDriveDir"
    exit 1
}

# Remove original .claude
Write-Host "Removing $claudeDir ..."
cmd /c "rd /s /q `"$claudeDir`""

# Create junction
Write-Host "Creating junction $claudeDir -> $oneDriveDir ..."
New-Item -ItemType Junction -Path $claudeDir -Target $oneDriveDir

Write-Host "Done. ~/.claude now points to OneDrive\claude-dotfiles"
Write-Host "Reopen Claude Code."
