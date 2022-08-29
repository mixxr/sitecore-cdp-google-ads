#!/bin/bash
url="https://googleads.googleapis.com/v${API_VERSION}/customers/${CUSTOMER_ID}/offlineUserDataJobs:create"
echo "** CREATE JOB:" "USER_LIST_ID=" ${USER_LIST_ID} ${url} 
echo "Authorization: Bearer ${OAUTH2_ACCESS_TOKEN}"

curl -f -i --request POST ${url} \
--header "Content-Type: application/json" \
--header "developer-token: ${DEVELOPER_TOKEN}" \
--header "login-customer-id: ${MANAGER_CUSTOMER_ID}" \
--header "Authorization: Bearer ${OAUTH2_ACCESS_TOKEN}" \
--data "{
  'job': {
    'type':'CUSTOMER_MATCH_USER_LIST',
    'customerMatchUserListMetadata':{
      'userList': 'customers/${CUSTOMER_ID}/userLists/${USER_LIST_ID}'
    }
  }
}"