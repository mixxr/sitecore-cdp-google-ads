#!/bin/bash
url="https://googleads.googleapis.com/v${API_VERSION}/customers/${CUSTOMER_ID}/userLists:mutate"
echo "* CREATE USER LIST:" ${url}
echo "Authorization: Bearer ${OAUTH2_ACCESS_TOKEN}"

 # Sets the membership life span to 30 days.

curl -f -i --request POST ${url} \
--header "Content-Type: application/json" \
--header "developer-token: ${DEVELOPER_TOKEN}" \
--header "login-customer-id: ${MANAGER_CUSTOMER_ID}" \
--header "Authorization: Bearer ${OAUTH2_ACCESS_TOKEN}" \
--data "{
  'operations': [
    {
      'create': {
        'name': 'My User List #${RANDOM}',
        'description': 'My user list created via REST API with some random data ${RANDOM}',
        'membershipLifeSpan': 30,
        'crmBasedUserList': {
          'uploadKeyType':'CONTACT_INFO',

        }
    }
    }
  ],
  'partialFailure': false,
  'validateOnly': false
}"