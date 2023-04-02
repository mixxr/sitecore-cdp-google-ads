#!/bin/bash
echo "https://googleads.googleapis.com/v${API_VERSION}/customers:listAccessibleCustomers"
echo "Authorization: Bearer ${OAUTH2_ACCESS_TOKEN}"

# https://developers.google.com/google-ads/api/reference/rpc/v13/UploadClickConversionsRequest
curl -f -i -v "https://googleads.googleapis.com/v${API_VERSION}/customers/${CUSTOMER_ID}:uploadCallConversions" \
--header "Content-Type: application/json" \
--header "developer-token: ${DEVELOPER_TOKEN}" \
--header "login-customer-id: ${MANAGER_CUSTOMER_ID}" \
--header "Authorization: Bearer ${OAUTH2_ACCESS_TOKEN}" https://googleads.googleapis.com/v13/customers/7529408212:uploadCallConversions \
--data "{
    'conversions': [
        {
            'conversionAction': 'customers/${CUSTOMER_ID}/conversionActions/${ACTION_CONVERSION_ID}',
            'gclid': 'EJr-AYWtJ7ICFQzazAod22kB9w',
            'conversionDateTime': '2023-03-30 20:05:10+01:00',
            'conversionValue': 10,
            'currencyCode': 'EUR'
        }
    ],
    'partialFailure': true
}"