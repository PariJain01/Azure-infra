#!/bin/bash

RG="RG-VM-DEMO"
VM_NAME="MyVM"
ALERT_NAME="HighCPUAlert"
AG_ID="/actionGroups/eastus/resourceGroups/RG-VM-DEMO/providers/microsoft.insights/actionGroups/AG-NotifyEmail01"

VM_ID=$(az vm show --resource-group $RG --name $VM_NAME --query id -o tsv)

az monitor metrics alert create \
  --name $ALERT_NAME \
  --resource-group $RG \
  --scopes $VM_ID \
  --condition "avg Percentage CPU > 80" \
  --description "Alert when CPU usage is more than 80%" \
  --action-groups $AG_ID \
  --severity 2
```