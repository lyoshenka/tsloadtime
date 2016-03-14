#!/bin/bash

## Get all lines from CSV files in $1, where the first column is a unix timestamp and the time is at least $2

set -euo pipefail

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
DATADIR=${1:-}

if [ -z "$DATADIR" ]; then
  echo "Usage: $0 DIR [TIME]"
  exit 1
fi

TIMESTRING="${2:-"-7 days"}"
TIME=$(date +%s -d "$TIMESTRING")

for file in $DATADIR/*.csv; do
  if [[ "$(tail $file -n 1 | cut -d',' -f1)" -ge $TIME ]]; then
    cat $file | awk -F, '$1 > '"$TIME"' { print $0 }'
  fi
done
