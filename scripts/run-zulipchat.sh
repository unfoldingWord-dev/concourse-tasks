#!/bin/bash

set -xe

# read content file
content=$(<$content_file)

# post notification
$http_code

code=$(curl -o /dev/null -s -w "%{http_code}" -X POST https://${org}.zulipchat.com/api/v1/messages \
-u ${user}@zulipchat.com:${token} \
-d "type=stream" \
-d "to=${to}" \
-d "subject=${subject}" \
-d "content=${content}")

# check response code
if [ "$code" -ne "200" ]; then
  exit 1
fi
