### Below is a brief example of a PowerShell script for automating the backup of a directory

# PowerShell Automation Script: Directory Backup

# Set the source and destination paths
$sourcePath = "C:\Path\To\Your\SourceDirectory"
$destinationPath = "C:\Path\To\Your\BackupDirectory"

# Set the timestamp for the backup folder
$timestamp = Get-Date -Format "yyyyMMdd_HHmmss"
$backupFolder = "Backup_$timestamp"

# Create the backup folder
$backupFolderPath = Join-Path -Path $destinationPath -ChildPath $backupFolder
New-Item -ItemType Directory -Path $backupFolderPath | Out-Null

# Copy files from source to destination
Copy-Item -Path $sourcePath\* -Destination $backupFolderPath -Recurse -Force

Write-Host "Backup completed successfully. Files are backed up to: $backupFolderPath"
