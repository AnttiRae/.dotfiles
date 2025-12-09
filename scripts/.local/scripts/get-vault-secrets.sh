#!/bin/bash
SECRETS="$(vault kv get -format=json "terraform/${TF_PROJECT_ID}")"
DATA=$(echo "$SECRETS" | jq -r '.data.data | @base64')
KEYS=$(echo "$DATA" | base64 -d | jq -r 'keys_unsorted[]')
for KEY in $KEYS; do
 echo "Fetching secret \"${KEY}\"..."
 echo "${DATA}" | base64 -d | jq -r ".[\"$KEY\"]" >"${SECRETS_DIR}/${KEY}"
done
