function Start-VS {
    $cd = (get-item .)

    do {
        $slnFiles = $cd.GetFiles("*.sln")
        if ($null -ne $slnFiles -and $slnFiles.Length -ne 0) {
            Start-Process $slnFiles[0].FullName
            return;
        }
        $cd = $cd.Parent
    } while ($null -ne $cd)

    # try again with subdirectories
    foreach ($cd in (get-childItem -Directory) ) {
        $slnFiles = $cd.GetFiles("*.sln")
        if ($null -ne $slnFiles -and $slnFiles.Length -ne 0) {
            Start-Process $slnFiles[0].FullName
            return;
        }
    }
}
 
function cn { code -n $(if ($args.Count -eq 0) { "." } else { $args }) }

function Prompt {
    $ESC = [char]27
    $_BRIGHT_GREEN_ = "$ESC[92m"
    $_BRIGHT_RED_ = "$ESC[91m"
    $_YELLOW_ = "$ESC[33m"
    $_RESET_COLOR = "$ESC[0m"
    $_CYAN_ = "$ESC[36m"
    $lastExitCodeBeforePrompt = $global:LASTEXITCODE
    $new = 0
    $modified = 0
    $deleted = 0
    $prompt = ""
    $statusList = (git status -s)
    if ($global:LASTEXITCODE -eq 0) {
        git status -s | 
        foreach { $_.Trim().Split(" ")[0] } | 
        foreach { 
            if ($_ -eq "??") {
                $new = $new + 1
            }
            else {
                if ($_ -eq "D") { $deleted = $deleted + 1 }
                else { $modified = $modified + 1 }
            }
        }
        $currentBranch = (git branch --list | Where { $_.StartsWith("*") }).Split(" ", 2)[1]
        if ($new -ne 0 -or $modified -ne 0 -or $deleted -ne 0) {
            $prompt = " $_BRIGHT_GREEN_($_BRIGHT_RED_$currentBranch $_YELLOW_✱ $_BRIGHT_GREEN_)$_RESET_COLOR"
        }
        else {
            $prompt = " $_BRIGHT_GREEN_($_YELLOW_$currentBranch$_BRIGHT_GREEN_)$_RESET_COLOR"
        }
    }
    $global:LASTEXITCODE = $lastExitCodeBeforePrompt
    "[ $_BRIGHT_GREEN_$(get-location)$prompt $_RESET_COLOR]`r`n$($_CYAN_)PWSH>$_RESET_COLOR "
}




