# Variables
$resourceGroup = "RG-PowerShell-VM"
$location = "EastUS"
$vnetName = "PSVNet"
$subnetName = "PSSubnet"
$ipName = "PSPublicIP"
$nicName = "PSNIC"
$vmName = "PSVM"
$adminUsername = "azureuser"
$adminPassword = ConvertTo-SecureString "P@ssword123!" -AsPlainText -Force

# Create resource group
New-AzResourceGroup -Name $resourceGroup -Location $location

# Create virtual network and subnet
$vnet = New-AzVirtualNetwork `
  -ResourceGroupName $resourceGroup `
  -Location $location `
  -Name $vnetName `
  -AddressPrefix "10.0.0.0/16" `
  -Subnet @(@{Name = $subnetName; AddressPrefix = "10.0.1.0/24"})

# Create public IP
$publicIP = New-AzPublicIpAddress `
  -ResourceGroupName $resourceGroup `
  -Location $location `
  -Name $ipName `
  -AllocationMethod Dynamic

# Create NIC
$subnet = $vnet.Subnets[0]
$nic = New-AzNetworkInterface `
  -ResourceGroupName $resourceGroup `
  -Location $location `
  -Name $nicName `
  -SubnetId $subnet.Id `
  -PublicIpAddressId $publicIP.Id

# Create VM config
$vmConfig = New-AzVMConfig -VMName $vmName -VMSize "Standard_B1s" |
  Set-AzVMOperatingSystem -Windows -ComputerName $vmName -Credential (New-Object PSCredential($adminUsername, $adminPassword)) -ProvisionVMAgent -EnableAutoUpdate |
  Set-AzVMSourceImage -PublisherName "MicrosoftWindowsServer" -Offer "WindowsServer" -Skus "2019-Datacenter" -Version "latest" |
  Add-AzVMNetworkInterface -Id $nic.Id

# Create the VM
New-AzVM -ResourceGroupName $resourceGroup -Location $location -VM $vmConfig

Write-Host "✅ VM created successfully!"
