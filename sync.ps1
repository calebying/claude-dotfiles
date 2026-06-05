$rawInput = [Console]::In.ReadToEnd()
try { $json = $rawInput | ConvertFrom-Json } catch { exit 0 }

$filePath = $json.tool_input.file_path
if (-not $filePath) { exit 0 }

$claudeDir = "$env:USERPROFILE\.claude"
if (-not $filePath.StartsWith($claudeDir)) { exit 0 }

Push-Location $claudeDir
git add -A 2>$null | Out-Null
$status = git status --porcelain 2>$null
if ($status) {
    $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm"
    git commit -m "auto-sync: $timestamp" 2>$null | Out-Null
    git push origin main 2>$null | Out-Null
}
Pop-Location
