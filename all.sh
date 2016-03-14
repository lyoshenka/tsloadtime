#!/bin/bash

## Get all lines from CSV files in $1, where the first column is a unix timestamp and the time is at least $2

set -euo pipefail

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
TIMESTRING="${1:-"-7 days"}"

if [ -z "$TIMESTRING" ]; then
  echo "Usage: $0 TIME"
  exit 1
fi

for dir in odin pingboxlv pingboxau; do
  echo $dir
  echo ""
  ./getlines.sh $dir "$TIMESTRING" | cut -d',' -f14 | ./stat.sh
  echo ""
  echo ""
done
