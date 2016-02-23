#!/bin/bash

set -euo pipefail

if [ -z "$1" ]; then
  echo "Usage: $0 URL"
  exit 1
fi

CURL_FORMAT="%{http_code},%{num_connects},%{num_redirects},%{size_download},%{size_header},%{speed_download},%{time_namelookup},"\
"%{time_connect},%{time_appconnect},%{time_pretransfer},%{time_redirect},%{time_starttransfer},%{time_total}"

CURL="curl --write-out $CURL_FORMAT --output /dev/null --silent --location"

echo "$(date '+%s'),$($CURL $1)"
