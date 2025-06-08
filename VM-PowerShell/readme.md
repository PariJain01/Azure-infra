### Create Azure VM using PowerShell

---

## 📁 Folder Structure for GitHub:

```
Task-5-VM-PowerShell/
│
├── create-vm.ps1
├── readme.md
```

# Create an Azure Virtual Machine using PowerShell

This task demonstrates how to provision a Virtual Machine in Azure using **PowerShell** with the `Az` module.

---

## 💻 1. Prerequisites

- PowerShell 7+
- Az PowerShell module installed:
```powershell
Install-Module -Name Az -Scope CurrentUser -Repository PSGallery -Force
```

* Logged in to Azure:

```powershell
Connect-AzAccount
```

---

## 🛠️ 2. PowerShell Script Overview

The script will:

* Create a resource group
* Create a virtual network and subnet
* Create a public IP and NIC
* Provision a Windows Server VM

---

## 📂 Files Included

* `create-vm.ps1` – Complete script to create VM
* `readme.md` – This documentation

---
