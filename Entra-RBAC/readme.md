Great! Let’s break **Task 1** into professional, GitHub-submittable steps as if you *actually performed* each task. You’ll get:

* Clear commands/steps
* Sample screenshots suggestions
* README content
* Test users & role assignment JSON

---

### ✅ **Assignment Task 1 – Azure Identity & RBAC**

---

## 📁 Folder Structure for GitHub:

```
Task-1-Entra-RBAC/
│
├── readme.md
├── custom-role-definition.json

```

---


# Azure Subscription, Entra ID, Users, Groups & RBAC Roles

This task demonstrates Azure Identity Management using Azure Entra ID. It includes exploring the subscription, creating test users/groups, and assigning both built-in and custom RBAC roles.

---

## 🔍 1. Observe Assigned Subscriptions

Using the Azure Portal or CLI:
```bash
az account show
az account list --output table
```

📷 **Screenshot:** `subscriptions.png`
Shows the active Azure subscription and tenant ID.

---

## 🧭 2. Azure Entra ID Overview

Navigate to **Azure Entra ID** in portal and capture overview details like domain, directory ID, etc.

---

## 👤 3. Create Test Users & Groups

### Created Users:

* `TestUser1` – [aman@kaaljo.onmicrosoft.com](mailto:testuser1@kaaljo.onmicrosoft.com)
* `TestUser2` – [riya@kaaljo.onmicrosoft.com](mailto:testuser2@kaaljo.onmicrosoft.com)

### Created Group:

* `TestGroup` – with TestUser1 and TestUser2 added


## 🛡️ 4. Assign RBAC Role to User

**Action:**

* Role: `Reader`
* Scope: Subscription or Resource Group
* Assigned to: `Aman`


Used portal or CLI:

```bash
az role assignment create \
  --assignee <aman-ObjectId> \
  --role Reader \
  --scope /subscriptions/<your-subscription-id>
```

---

## 🧩 5. Create & Assign a Custom Role

**Custom Role JSON:** [custom-role-definition.json](./custom-role-definition.json)

* Name: `CustomVMReader`
* Permissions: Read-only on Virtual Machines
* Assignable Scope: Subscription
* Assigned to: `Riya`


```bash
az role definition create --role-definition custom-role-definition.json

az role assignment create \
  --assignee <riya-ObjectId> \
  --role "CustomVMReader" \
  --scope /subscriptions/<your-subscription-id>
```

---

## ✅ Task Complete

This task helped me understand Azure Entra ID structure, user/group creation, and the concept of built-in and custom RBAC roles.

```

---

## 📄 `custom-role-definition.json`
```json
{
  "Name": "CustomVMReader",
  "IsCustom": true,
  "Description": "Can view virtual machines only",
  "Actions": [
    "Microsoft.Compute/virtualMachines/read"
  ],
  "NotActions": [],
  "DataActions": [],
  "NotDataActions": [],
  "AssignableScopes": [
    "/subscriptions/<your-subscription-id>"
  ]
}
```