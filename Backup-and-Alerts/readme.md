## ✅ VM Backup Scheduling & Alerts via Recovery Services Vault and Backup Center

---

### 📁 GitHub Folder Structure:

```
Task-6-Backup-and-Alerts/
│
├── schedule-backup.sh
├── create-alert-rule.sh
├── readme.md
```

---

# Schedule VM Backup & Alerting

This task includes:

✅ A. Scheduling daily VM backups at 3:00 AM using Recovery Services Vault  
✅ B. Creating CPU Alert Rule for VM (when CPU > 80%)  
✅ C. Configuring backup retention using Backup Center  

---

## 🔐 Part A – Backup via Recovery Services Vault

### 1. Create a Recovery Services Vault

```bash
az backup vault create \
  --name MyRecoveryVault \
  --resource-group RG-VM-DEMO \
  --location eastus
```
---

### 2. Create a Backup Policy (Daily 3:00 AM, retain for 30 days)

```bash
az backup policy create \
  --resource-group RG-VM-DEMO \
  --vault-name MyRecoveryVault \
  --name Daily3AMPolicy \
  --policy '{"properties":{"schedulePolicy":{"schedulePolicyType":"SimpleSchedulePolicy","scheduleRunFrequency":"Daily","scheduleRunTimes":["03:00"]},"retentionPolicy":{"retentionPolicyType":"LongTermRetentionPolicy","dailySchedule":{"retentionTimes":["03:00"],"retentionDuration":{"count":30,"durationType":"Days"}}}}}'
```
---

### 3. Enable Backup for VM

```bash
az backup protection enable-for-vm \
  --resource-group RG-VM-DEMO \
  --vault-name MyRecoveryVault \
  --vm MyVM \
  --policy-name Daily3AMPolicy
```

---

## 📣 Part B – Alert on CPU > 80%

### 1. Create an Alert Rule

```bash
az monitor metrics alert create \
  --name "HighCPUAlert" \
  --resource-group RG-VM-DEMO \
  --scopes $(az vm show --resource-group RG-VM-DEMO --name MyVM --query id -o tsv) \
  --condition "avg Percentage CPU > 80" \
  --description "Alert when CPU > 80%" \
  --action-groups "/actionGroups/eastus/resourceGroups/RG-VM-DEMO/providers/microsoft.insights/actionGroups/AG-NotifyEmail01
" \
  --severity 2
```

Also validated provisioning and retention setup via **Azure Backup Center UI**.
---

## 📂 Files Included

* `schedule-backup.sh` – Shell script to create vault, policy, enable backup
* `create-alert-rule.sh` – Script to create CPU alert rule
* `readme.md` – Documentation

---
