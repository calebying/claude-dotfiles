param([string]$Type)

$claudeDir = "$env:USERPROFILE\.claude"
Push-Location $claudeDir

$date = Get-Date

function Prune-Branches($pattern, $keepCount) {
    $branches = git branch -r --list "origin/$pattern*" 2>$null |
        ForEach-Object { $_.Trim() -replace "^origin/", "" } | Sort-Object
    if ($branches.Count -gt $keepCount) {
        $branches | Select-Object -First ($branches.Count - $keepCount) | ForEach-Object {
            git push origin --delete $_ --quiet 2>$null | Out-Null
        }
    }
}

function Push-Branch($branchName) {
    git fetch origin main --quiet 2>$null | Out-Null
    git push origin "refs/remotes/origin/main:refs/heads/$branchName" --force --quiet 2>$null | Out-Null
}

switch ($Type) {
    "weekly" {
        $week = Get-Date -UFormat "%V"
        Push-Branch "backup/weekly/$($date.Year)-W$week"
        Prune-Branches "backup/weekly/" 4
    }
    "monthly" {
        Push-Branch "backup/monthly/$($date.ToString('yyyy-MM'))"
        Prune-Branches "backup/monthly/" 1
    }
    "quarterly" {
        $q = [math]::Ceiling($date.Month / 3)
        Push-Branch "backup/quarterly/$($date.Year)-Q$q"
        Prune-Branches "backup/quarterly/" 1
    }
    "yearly" {
        Push-Branch "backup/yearly/$($date.Year)"
        Prune-Branches "backup/yearly/" 1
    }
}

Pop-Location
