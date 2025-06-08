# Create resource group
az group create \
  --name RG-VM-DEMO \
  --location eastus

# Create VNet
az network vnet create \
  --resource-group RG-VM-DEMO \
  --name MyVNet \
  --address-prefix 10.0.0.0/16 \
  --subnet-name MySubnet \
  --subnet-prefix 10.0.1.0/24

# Create VM
az vm create \
  --resource-group RG-VM-DEMO \
  --name MyVM \
  --image UbuntuLTS \
  --vnet-name MyVNet \
  --subnet MySubnet \
  --admin-username azureuser \
  --admin-password 'StrongPassword123!' \
  --authentication-type password \
  --public-ip-sku Standard \
  --output json