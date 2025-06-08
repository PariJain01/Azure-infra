### Azure Policy at Subscription Level**

---

## 📁 Folder Structure for GitHub:

```
Task-3-Azure-Policy/
│
├── policy-definition.json
├── assign-policy.sh
├── readme.md
```

---

## 🧾 `readme.md` content:


# Azure Policy Creation and Assignment (Subscription Scope)

This task demonstrates creating a custom Azure Policy and assigning it at the **subscription level** using both CLI and portal (if needed).

---

## 📄 1. Policy Definition

**Goal**: Deny creation of resources in regions other than `eastus`.


---

## 🛡️ 2. Assign Policy via CLI

```bash
az policy definition create \
  --name "AllowOnlyEastUS" \
  --display-name "Allow Only East US Region" \
  --description "Prevents resource creation outside eastus" \
  --rules policy-definition.json \
  --mode All \
  --subscription <
4d1741c7-a110-4fa0-8cab-b741dc4030c9>
```

Then assign it:

```bash
az policy assignment create \
  --name "EnforceEastUS" \
  --policy "AllowOnlyEastUS" \
  --scope /subscriptions/<
4d1741c7-a110-4fa0-8cab-b741dc4030c9>
```



---

## 🔍 Verification

Try creating a resource in another region and it should be blocked.
Use the Azure Portal to see the Policy effect.

---

## 📂 Files Included

* `policy-definition.json`: The custom policy definition
* `assign-policy.sh`: CLI commands in script format
* `readme.md`: Documentation

---
