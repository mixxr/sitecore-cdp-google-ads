#!/bin/bash
echo "https://googleads.googleapis.com/v${API_VERSION}/customers:listAccessibleCustomers"
echo "Authorization: Bearer ${OAUTH2_ACCESS_TOKEN}"

curl -f -i -v "https://googleads.googleapis.com/v${API_VERSION}/customers:listAccessibleCustomers" \
--header "Content-Type: application/json" \
--header "developer-token: ${DEVELOPER_TOKEN}" \
--header "login-customer-id: ${MANAGER_CUSTOMER_ID}" \
--header "Authorization: Bearer ${OAUTH2_ACCESS_TOKEN}" 