#!/bin/bash
url="https://googleads.googleapis.com/v${API_VERSION}/customers/${CUSTOMER_ID}/operations/${OP_ID}"
echo "***** CHECK OPERATION:" ${url}
echo "Authorization: Bearer ${OAUTH2_ACCESS_TOKEN}"

curl -f -i -X GET ${url} \
--header "Content-Type: application/json" \
--header "developer-token: ${DEVELOPER_TOKEN}" \
--header "login-customer-id: ${MANAGER_CUSTOMER_ID}" \
--header "Authorization: Bearer ${OAUTH2_ACCESS_TOKEN}" 