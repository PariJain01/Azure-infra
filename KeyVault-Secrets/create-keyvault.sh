#!/bin/bash

RESOURCE_GROUP="RG-VM-DEMO"
LOCATION="eastus"
VAULT_NAME="MyKeyVaultDemo"
SECRET_NAME="MyPass123"
SECRET_VALUE="P@ssw0rd123"
USER_EMAIL=jainpari0102@gmail.com

# Create Key Vault
az keyvault create \
  --name $VAULT_NAME \
  --resource-group $RESOURCE_GROUP \
  --location $LOCATION

# Add a secret
az keyvault secret set \
  --vault-name $VAULT_NAME \
  --name $SECRET_NAME \
  --value $SECRET_VALUE

# Set access policy for user
az keyvault set-policy \
  --name $VAULT_NAME \
  --upn $USER_EMAIL \
  --secret-permissions get list set delete

echo "✅ Key Vault created, secret added, and access policy assigned."

