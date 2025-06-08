#!/bin/bash
4d1741c7-a110-4fa0-8cab-b741dc4030c9
# Set variables
SUBSCRIPTION_ID="<4d1741c7-a110-4fa0-8cab-b741dc4030c9>"
POLICY_NAME="AllowOnlyEastUS"
ASSIGNMENT_NAME="EnforceEastUS"

# Create policy definition
az policy definition create \
  --name $POLICY_NAME \
  --display-name "Allow Only East US Region" \
  --description "Prevents resource creation outside eastus" \
  --rules policy-definition.json \
  --mode All \
  --subscription $SUBSCRIPTION_ID

# Assign the policy
az policy assignment create \
  --name $ASSIGNMENT_NAME \
  --policy $POLICY_NAME \
  --scope /subscriptions/$SUBSCRIPTION_ID

echo "✅ Policy assigned successfully at subscription level."