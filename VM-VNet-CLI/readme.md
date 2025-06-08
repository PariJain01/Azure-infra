### Create Virtual Machine & VNet via Azure CLI

---

## 📁 Folder Structure for GitHub:

```
Task-2-VM-VNet-CLI/
│
├── screenshots/
│   ├── vnet-created.png
│   ├── vm-created.png
│
├── vm-create.sh
├── readme.md
```

---


# Task 2 – Create Virtual Machine and Virtual Network using Azure CLI

This task demonstrates creating an Azure Virtual Network and a Virtual Machine using Azure CLI in a professional, reproducible manner.

---

## 🌐 1. Create a Resource Group

```bash
az group create \
  --name RG-VM-DEMO \
  --location eastus
```

---

## 🕸️ 2. Create Virtual Network and Subnet

```bash
az network vnet create \
  --resource-group RG-VM-DEMO \
  --name MyVNet \
  --address-prefix 10.0.0.0/16 \
  --subnet-name MySubnet \
  --subnet-prefix 10.0.1.0/24
```

---

## 🖥️ 3. Create Virtual Machine

```bash
az vm create \
  --resource-group RG-VM-DEMO \
  --name MyVM \
  --image UbuntuLTS \
  --vnet-name MyVNet \
  --subnet MySubnet \
  --admin-username azureuser \
  --admin-password 'mypass-123!' \
  --authentication-type password \
  --public-ip-sku Standard \
  --output json
```


✅ This command creates:

* A VM named `MyVM`
* Inside the custom VNet and subnet
* With a public IP and login credentials

---

## 📂 Files Included

* `vm-create.sh`: Shell script with all CLI commands
* `readme.md`: This documentation

---

## 🧪 Verification

Run:

```bash
az vm show \
  --name MyVM \
  --resource-group RG-VM-DEMO \
  --output table
```

This confirms successful VM provisioning and IP assignment.

---

