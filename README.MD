# 💼 Azure Infrastructure Internship – Assignment Submission

This repository contains solutions for Tasks 1 to 6 of the Azure Infrastructure internship assignment. All tasks were performed using Azure CLI, PowerShell, and portal tools as required. Each task includes automation scripts, screenshots, and step-by-step documentation.

---

## ✅ Task 1 – Azure Entra ID and RBAC

### 🔹 Subtasks:
- Observed assigned subscription and Azure Entra ID
- Created test users and groups in Azure Entra ID
- Assigned built-in RBAC role to a user and verified access
- Created a custom role and assigned to a user

📂 Folder: `Task-1-Entra-RBAC/`  
📄 Files:  
- `create-user-group.sh`  
- `assign-rbac.sh`  
- `custom-role.json`  


---

## ✅ Task 2 – Create Virtual Machine and VNet via Azure CLI

### 🔹 Actions:
- Provisioned VM and Virtual Network from CLI
- Assigned NIC, public IP, subnet, and NSG

📂 Folder: `Task-2-VM-VNet-CLI/`  
📄 Files:
- `create-vm.sh` (automated script)

---

## ✅ Task 3 – Azure Policy at Subscription Level

### 🔹 Actions:
- Assigned built-in Azure Policy (`Not allowed resource types`)
- Verified compliance and restrictions

📂 Folder: `Task-3-Policy-Assignment/`  
📄 Files:
- `assign-policy.sh`

---

## ✅ Task 4 – Azure Key Vault Secrets and Access

### 🔹 Actions:
- Created Azure Key Vault
- Added and retrieved secrets using CLI
- Configured access policies for user

📂 Folder: `Task-4-KeyVault-Secrets/`  
📄 Files:
- `create-keyvault.sh`  
- `read-secret.sh` 
---

## ✅ Task 5 – Create Azure VM using PowerShell

### 🔹 Actions:
- Provisioned a Windows Server VM using PowerShell with full network setup
- Verified provisioning via Portal

📂 Folder: `Task-5-VM-PowerShell/`  
📄 Files:
- `create-vm.ps1`

---

## ✅ Task 6 – Schedule Backup and Configure Alerts

### 🔹 Part A: Backup using Recovery Services Vault
- Created vault and backup policy (daily at 3 AM)
- Enabled protection for VM
- Configured retention for 30 days

### 🔹 Part B: CPU Alert
- Created alert rule to notify when CPU > 80%
- Action group with email notification

📂 Folder: `Task-6-Backup-and-Alerts/`  
📄 Files:
- `schedule-backup.sh`  
- `create-alert-rule.sh`  

---

## 👨‍💻 Author
Pari Jain
Internship Submission – 2025  
