#!/bin/bash
curl \
  --data "grant_type=refresh_token" \
  --data "client_id=${CLIENT_ID}" \
  --data "client_secret=${CLIENT_SECRET}" \
  --data "refresh_token=${REFRESH_TOKEN}" \
  https://www.googleapis.com/oauth2/v3/token