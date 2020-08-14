### Create and configure the Azure resources

# Declare local variables
$ResourceGroupName = 'demo-rg'
$Location = 'westus'


## Create a new resource group
$DemoRG = New-AzResourceGroup -Name $ResourceGroupName -Location $Location 


## Create a new storage account
$SAName = "sa" + -join ((0x30..0x39) + ( 0x61..0x7A) | Get-Random -Count 8 | ForEach-Object { [char]$_ })   # Generate a random sa account name
$DemoSA = New-AzStorageAccount -ResourceGroupName $ResourceGroupName -Location $Location -Name $SAName -SkuName Standard_LRS


## Create a new network security group with RDP and Web allow security rules
$NSGName = 'demo-nsg'
$RDPRule = New-AzNetworkSecurityRuleConfig -Name allow-3389 -Priority 1000 -Protocol Tcp -Direction Inbound -Access Allow -SourcePortRange * -DestinationPortRange 3389 -SourceAddressPrefix * -DestinationAddressPrefix * 
$WebRule = New-AzNetworkSecurityRuleConfig -Name allow-80 -Priority 1010 -Protocol Tcp -Direction Inbound -Access Allow -SourcePortRange * -DestinationPortRange 80 -SourceAddressPrefix * -DestinationAddressPrefix * 
$DemoNSG = New-AzNetworkSecurityGroup -ResourceGroupName $ResourceGroupName -Location $Location -Name $NSGName -SecurityRules $RDPRule, $WebRule

# Remove a security rule from the existing NSG
Remove-AzNetworkSecurityRuleConfig -Name allow-80 -NetworkSecurityGroup $DemoNSG
$DemoNSG | Set-AzNetworkSecurityGroup

# Add a new a security rule from the existing NSG
Add-AzNetworkSecurityRuleConfig -Name allow-8080 -Priority 1010 -Protocol Tcp -Direction Inbound -Access Allow -SourcePortRange * -DestinationPortRange 8080 -SourceAddressPrefix * -DestinationAddressPrefix * -NetworkSecurityGroup $DemoNSG
$DemoNSG | Set-AzNetworkSecurityGroup


## Create a new virtual network
$VNetName = 'demo-vnet'
$VNetAddressPrefix = '192.168.0.0/16'
$SubnetName = 'subnet'
$SubnetAddressPrefix = '192.168.1.0/24'
$Subnet = New-AzVirtualNetworkSubnetConfig -Name $SubnetName -AddressPrefix $SubnetAddressPrefix -NetworkSecurityGroupId $DemoNSG.Id
$DemoVNet = New-AzVirtualNetwork -ResourceGroupName $ResourceGroupName -Location $Location -Name $VNetName -AddressPrefix $VNetAddressPrefix -Subnet $Subnet

# Change address prefix of a subnet in the vnet
$SubnetAddressPrefix = '192.168.0.0/24'
$DemoVNet.Subnets.Where({ $_.Name -eq $SubnetName }).AddressPrefix = $SubnetAddressPrefix
$DemoVNet | Set-AzVirtualNetwork

# Add a new subnet to an existing vnet
$SubnetName2 = 'subnet2'
$SubnetAddressPrefix2 = '192.168.1.0/24'
Add-AzVirtualNetworkSubnetConfig -Name $SubnetName2 -AddressPrefix $SubnetAddressPrefix2 -NetworkSecurityGroupId $DemoNSG.Id -VirtualNetwork $DemoVNet
$DemoVNet | Set-AzVirtualNetwork


## Create a pubblic ip address
$PIPName = 'demo-pip'
$DemoPIP = New-AzPublicIpAddress -ResourceGroupName $ResourceGroupName -Location $Location -Name $PIPName -AllocationMethod Dynamic


## Create a new network interface card
$NICName = 'demo-nic'
$DemoNIC = New-AzNetworkInterface -ResourceGroupName $ResourceGroupName -Location $Location -Name $NICName -SubnetId $DemoVNet.Subnets[0].Id -PublicIpAddressId $DemoPIP.Id 
