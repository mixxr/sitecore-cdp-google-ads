#!/bin/bash
url="https://googleads.googleapis.com/v${API_VERSION}/customers/${CUSTOMER_ID}/offlineUserDataJobs/${JOB_ID}:addOperations"
echo "*** ADD MEMBERS:" ${url}
echo "Authorization: Bearer ${OAUTH2_ACCESS_TOKEN}"

file="emails.txt"
s=""
while read -r line; do
    hashed=$(echo -n $line|openssl dgst -sha256)
    s="$s {'hashedEmail':'${hashed}'},"
done <$file 

echo $s

curl -f -i -X POST ${url} \
--header "Content-Type: application/json" \
--header "developer-token: ${DEVELOPER_TOKEN}" \
--header "login-customer-id: ${MANAGER_CUSTOMER_ID}" \
--header "Authorization: Bearer ${OAUTH2_ACCESS_TOKEN}" \
--data "{
    'enablePartialFailure': true,
    'validateOnly':false,
    'enableWarnings':true,
    'operations': [
      { 'create': {
            'userIdentifiers': [
              ${s}
            ]
          }
      }]
}"