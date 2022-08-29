#!/bin/bash
echo "https://googleads.googleapis.com/v${API_VERSION}/customers/${CUSTOMER_ID}/googleAds:search"
echo "Authorization: Bearer ${OAUTH2_ACCESS_TOKEN}"

curl -f -i -v --request POST "https://googleads.googleapis.com/v${API_VERSION}/customers/${CUSTOMER_ID}/googleAds:search" \
--header "Content-Type: application/json" \
--header "developer-token: ${DEVELOPER_TOKEN}" \
--header "login-customer-id: ${MANAGER_CUSTOMER_ID}" \
--header "Authorization: Bearer ${OAUTH2_ACCESS_TOKEN}" \
--data '{
"pageSize": 10,
"query": "
  SELECT campaign.name,
    campaign_budget.amount_micros,
    campaign.status,
    campaign.optimization_score,
    campaign.advertising_channel_type,
    metrics.clicks,
    metrics.impressions,
    metrics.ctr,
    metrics.average_cpc,
    metrics.cost_micros,
    campaign.bidding_strategy_type
  FROM campaign
  WHERE segments.date DURING LAST_7_DAYS
    AND campaign.status != 'REMOVED'
"
}'