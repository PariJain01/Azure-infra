#!/bin/bash

VAULT_NAME="MyKeyVaultDemo"
SECRET_NAME="MyPass123"

# Retrieve secret value
az keyvault secret show \
  --vault-name $VAULT_NAME \
  --name $SECRET_NAME \
  --query value \
  --output tsv
```
