#### This is in continuation to create-configure-the-azure-resources.ps1
## In the previous script, we have already created ResourceGroup, NSG, VNet, StorageAccount, NIC with public ip

# Declare local variables
$RGName = 'demo-rg'
$Location = 'westus'
$VMName = 'demo-vm'
$ComputerName = 'demo-vm'
$VMSize = 'Standard_D2_v2'
$PublisherName = 'MicrosoftWindowsServer' 
$Offer = 'WindowsServer' 
$Sku = '2019-Datacenter' 
$AdminCredential = Get-Credential -UserName sysadmin

# Create VM configuration
$VMConfig = New-AzVMConfig -VMName $VMName -VMSize $VMSize

# Operating System configuration
$VMConfig | Set-AzVMOperatingSystem -Windows -ComputerName $ComputerName -Credential $AdminCredential

# VM Source Image Referance
$VMConfig | Set-AzVMOSDisk -CreateOption FromImage
$VMConfig | Set-AzVMSourceImage -PublisherName $PublisherName -Offer $Offer -Skus $Sku -Version latest

# Add NIC
$VMConfig | Add-AzVMNetworkInterface -Id $DemoNIC.Id -Primary

# Add Data Disk
$VMConfig | Add-AzVMDataDisk -DiskSizeInGB 1023 -Lun 0 -CreateOption Empty

# Enable Boot Diagnostics
$VMConfig | Set-AzVMBootDiagnostic -ResourceGroupName $RGName -Enable -StorageAccountName $DemoSA.Name

# Create Virtual Machine
New-AzVM -ResourceGroupName $RGName -Location $Location -VM $VMConfig