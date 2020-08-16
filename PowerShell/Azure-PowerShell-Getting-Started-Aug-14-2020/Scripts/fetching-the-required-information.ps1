## Login to Azure
# Login-AzAccount

# Get the current subscription
Get-AzContext

# Get all the subscriptions in the current context
Get-AzContext -ListAvailable

# List all the subscriptions
Get-AzSubscription | Select-Object -Property Name, State

# To Switch between the subscriptions 
# Get-AzSubscription -SubscriptionId '<subscription name>' | Set-AzContext
Get-AzSubscription -SubscriptionName '<subscription name>' | Select-AzSubscription # Set-AzContext
Get-AzContext -Name '<context name>' | Select-AzContext
Set-AzContext -SubscriptionName '<subscription name>'


## Fetching the required information from Azure
# Get all the resources in the current context
Get-AzResource
Get-AzResource -Name '<resource name>'
Get-AzResource -ResourceId '<resource id>'
Get-AzResource -ResourceType '<resource type>' # Microsoft.Compute/virtualMachines, Microsoft.Storage/storageAccounts, Microsoft.Network/publicIPAddresses
Get-AzResource -Tag '<tag ht>' # -TagName, -Tag Value

# Get all the resource groups in the current context
Get-AzResourceGroup

# Get virtual machines
Get-AzVM
Get-AzVM -ResourceGroupName test-rg 
Get-AzVM -Location westus
Get-AzVM -ResourceGroupName test-rg -Name TestVM

# Get storage accounts
Get-AzStorageAccount -Name '<sa name>'
Get-AzStorageAccount

# Get virtual networks
Get-AzVirtualNetwork -Name '<vnet name>'
Get-AzVirtualNetwork -ResourceGroupName '<rg name>' -Name '<vnet name>'
Get-AzVirtualNetwork 

# Get network security group
Get-AzNetworkSecurityGroup -ResourceGroupName '<rg name>' -Name '<vnet name>'
Get-AzNetworkSecurityGroup

# Get network interface 
Get-AzNetworkInterface -ResourceId '<resource id>'
Get-AzNetworkInterface -ResourceGroupName '<rg name>' -Name '<nic name>'
Get-AzNetworkInterface

# Get azure locations
Get-AzLocation | ForEach-Object Location # DisplayName

# Get virtual machine sizes
Get-AzVMSize -Location southindia

## Finding the right OS image
# Get image publishers
Get-AzVMImagePublisher -Location westus     # MicrosoftWindowsServer, Canonical

# Get image offerings from the specified publisher
Get-AzVMImageOffer -Location southindia -PublisherName Canonical    # UbuntuServer, Ubuntu_Core # WindowsServer

# Get the image sku
Get-AzVMImageSku -Location southindia -PublisherName Canonical -Offer UbuntuServer  # 18.04-LTS, 18.10

# List security rules of a network security group
$NSG = Get-AzNetworkSecurityGroup -ResourceGroupName security-rg -Name nsg1
$NSG.SecurityRules
# or
Get-AzNetworkSecurityGroup -ResourceGroupName security-rg -Name nsg1 | Get-AzNetworkSecurityRuleConfig
# or
Get-AzNetworkSecurityRuleConfig -NetworkSecurityGroup $NSG

# Fetch public ip address of a VM
$VM = Get-AzVM -ResourceGroupName test-rg -Name TestVM
$VM 
<#
ResourceGroupName  : test-rg
Id                 : /subscriptions/1b7eaa76-c64f-4a0f-b56f-10b25b056be3/resourceGroups/test-rg/providers/Microsoft.Compute/virtualMachines/SimpleVM
VmId               : 51c723bb-93d0-404e-be83-c32123f9d07d
Name               : SimpleVM
Type               : Microsoft.Compute/virtualMachines
Location           : eastus
Tags               : {}
DiagnosticsProfile : {BootDiagnostics}
HardwareProfile    : {VmSize}
NetworkProfile     : {NetworkInterfaces}
OSProfile          : {ComputerName, AdminUsername, LinuxConfiguration, Secrets, AllowExtensionOperations, RequireGuestProvisionSignal}
ProvisioningState  : Succeeded
StorageProfile     : {ImageReference, OsDisk, DataDisks}
#>
$NICId = $VM.NetworkProfile.NetworkInterfaces.id
$NIC = Get-AzNetworkInterface -ResourceId $NICId
# Private IP Address
$NIC.IpConfigurations.PrivateIpAddress

$PIPId = $NIC.IpConfigurations.PublicIpAddress.id
$PIP = Get-AzResource -ResourceId $PIPId
# Public IP Address
$PIP.Properties.ipAddress

## Working with the objects and formating the output
Get-AzResource | Select-Object -Property ResourceName, ResourceType, ResourceGroupName
Get-AzResource | Where-Object { $_.ResourceType -eq 'Microsoft.Compute/virtualMachines/extensions' }
Get-AzResource | Select-Object -Property ResourceName, ResourceGroupName | Sort-Object -Property ResourceGroupName

$Tag = @{crit = 4}
Get-AzResource | Where-Object { $null -eq $_.Tags } | ForEach-Object { New-AzTag -ResourceId $_.ResourceId -Tag $Tag }

# Format the output
Get-AzResource | Format-Table
Get-AzResource | Format-Table -Property ResourceName, ResourceGroupName
Get-AzResource | Select-Object -Property ResourceName, ResourceGroupName | Format-List