#!/bin/bash

RG="RG-VM-DEMO"
VAULT="MyRecoveryVault"
VM_NAME="MyVM"
POLICY_NAME="Daily3AMPolicy"

# Create Recovery Vault
az backup vault create \
  --name $VAULT \
  --resource-group $RG \
  --location eastus

# Set backup storage redundancy (optional)
az backup vault backup-properties set \
  --name $VAULT \
  --resource-group $RG \
  --backup-storage-redundancy LocallyRedundant

# Create custom daily policy at 3:00 AM, retain for 30 days
az backup policy create \
  --resource-group $RG \
  --vault-name $VAULT \
  --name $POLICY_NAME \
  --policy '{"properties":{"schedulePolicy":{"schedulePolicyType":"SimpleSchedulePolicy","scheduleRunFrequency":"Daily","scheduleRunTimes":["03:00"]},"retentionPolicy":{"retentionPolicyType":"LongTermRetentionPolicy","dailySchedule":{"retentionTimes":["03:00"],"retentionDuration":{"count":30,"durationType":"Days"}}}}}'

# Enable protection
az backup protection enable-for-vm \
  --resource-group $RG \
  --vault-name $VAULT \
  --vm $VM_NAME \
  --policy-name $POLICY_NAME