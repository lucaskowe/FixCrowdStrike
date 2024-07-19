#Command/Script to fix the crowdstrike update that effected the world on 19/7/24 run in SAFEMODE as ADMIN
#Author: Lucas Kowe
#Remove problematic driver file (update(?))) thoroughly
try {
    if (-not (Test-Path "C:\Windows\System32\drivers\CrowdStrike\C-00000291*.sys")) {
        Write-Host "Crowdstrike Fix Not Required. File Does Not Exist."
        exit
    }
    Remove-Item -Path "C:\Windows\System32\drivers\CrowdStrike\C-00000291*.sys" -Force -Recurse -ErrorAction Stop -Confirm:$false
    # Verify file no longer exists and is removed
    if (-not (Test-Path "C:\Windows\System32\drivers\CrowdStrike\C-00000291*.sys")) {
        Write-Host "Crowdstrike Fix Applied Successfully. Good Luck!"
    } else {
        Write-Host "Crowdstrike Fix Failed. Something Went Wrong.."
    }
} catch {
    Write-Host "An error occurred while removing the file: $_"
}
