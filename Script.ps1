### Here's a simple example that checks system information and performs basic tasks
# PowerShell Script for Job Interview

# Task 1: Display System Information
Write-Host "System Information:"
Get-CimInstance -ClassName Win32_ComputerSystem | Format-List Name, Manufacturer, Model, TotalPhysicalMemory

# Task 2: List Installed Software
Write-Host "`nInstalled Software:"
Get-WmiObject -Query "SELECT * FROM Win32_Product" | Select-Object Name, Version

# Task 3: Check Free Disk Space
Write-Host "`nFree Disk Space:"
Get-CimInstance -ClassName Win32_LogicalDisk | Where-Object { $_.DriveType -eq 3 } | Select-Object DeviceID, FreeSpace

# Task 4: Restart the Computer (Optional)
# Uncomment the line below if you want to enable the restart task
# Restart-Computer -Force

# End of Script
Write-Host "`nScript executed successfully!"
