# PowerShell Automation Script: Windows Update

# Check for pending updates
$updateSession = New-Object -ComObject Microsoft.Update.Session
$updateSearcher = $updateSession.CreateUpdateSearcher()
$updates = $updateSearcher.Search("IsInstalled=0")

# If updates are available, install them
if ($updates.Updates.Count -gt 0) {
    Write-Host "Pending updates found. Installing..."
    $updateInstaller = New-Object -ComObject Microsoft.Update.UpdateInstaller
    $updateInstaller.Updates = $updates.Updates
    $installationResult = $updateInstaller.Install()

    # Check the installation result
    if ($installationResult.ResultCode -eq 2) {
        Write-Host "Updates installed successfully."
    } else {
        Write-Host "Failed to install updates. Result code: $($installationResult.ResultCode)"
    }
} else {
    Write-Host "No pending updates found."

    ### Running this script may require elevated permissions, so make sure to run it as an administrator ###
}
