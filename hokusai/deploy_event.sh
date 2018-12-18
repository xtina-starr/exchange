#!/bin/sh
# ./deploy_event app env
# eg:
# ./deploy_event exchange production
# Must have DD_API_KEY set to datadog api key.

curl -X POST -H "Content-type: application/json" \
-d "{
      \"title\": \"test API key\",
      \"text\": \"does this work with curl?\",
      \"priority\": \"normal\",
      \"tags\": [\"service:$1\", \"env:$2\"],
      \"alert_type\": \"info\"
}" \
"https://api.datadoghq.com/api/v1/events?api_key=$DD_API_KEY"
