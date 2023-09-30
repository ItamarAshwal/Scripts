# PowerShell Automation Script: Azure VM Deployment

# Set Azure subscription and resource group details
$subscriptionId = "your_subscription_id"
$resourceGroupName = "YourResourceGroup"
$location = "East US"

# Set VM details
$vmName = "YourVMName"
$vmSize = "Standard_B2s"
$adminUsername = "youradminuser"
$adminPassword = "youradminpassword"

# Set ARM template path
$templatePath = "C:\Path\To\Your\VMTemplate.json"

# Authenticate to Azure
Connect-AzAccount -Subscription $subscriptionId

# Create a new resource group
New-AzResourceGroup -Name $resourceGroupName -Location $location

# This script performs the following tasks:

# Authenticates to Azure using Azure PowerShell.
# Creates a new resource group in the specified location.
# Deploys a VM using an ARM template, passing parameters like VM name, size, and admin credentials. 

# Deploy the VM using the ARM template
New-AzResourceGroupDeployment -ResourceGroupName $resourceGroupName `
    -TemplateFile $templatePath `
    -TemplateParameterObject @{
        "vmName" = $vmName
        "vmSize" = $vmSize
        "adminUsername" = $adminUsername
        "adminPassword" = $adminPassword
    }

Write-Host "Azure VM deployment completed successfully."
