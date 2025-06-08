### ✅ Azure Key Vault with Secrets & Access Policies

---

## 📁 Folder Structure for GitHub:

```
Task-4-KeyVault-Secrets/
│
├── create-keyvault.sh
├── read-secret.sh
├── readme.md
```

---
# Azure Key Vault: Secrets Management and Access Policies

This task demonstrates how to:
- Create a Key Vault
- Add secrets
- Configure access policies
- Retrieve secrets via Azure CLI

---

## 🗝️ 1. Create Key Vault

```bash
az keyvault create \
  --name MyKeyVaultDemo \
  --resource-group RG-VM-DEMO \
  --location eastus
```
---

## 🔐 2. Add a Secret to Key Vault

```bash
az keyvault secret set \
  --vault-name MyKeyVaultDemo \
  --name "MyPass123" \
  --value "P@ssw0rd123"
```

---

## 👤 3. Configure Access Policy for Current User

```bash
az keyvault set-policy \
  --name MyKeyVaultDemo \
  --upn jainpari0102@gmail.com \
  --secret-permissions get list set delete
```

---

## 📥 4. Retrieve the Secret via Azure CLI

```bash
az keyvault secret show \
  --vault-name MyKeyVaultDemo \
  --name MyPass123 \
  --query value \
  --output tsv
```
---

## 📂 Files Included

* `create-keyvault.sh`: Script to create vault and store secret
* `read-secret.sh`: Script to retrieve secret
* `readme.md`: Documentation

---
