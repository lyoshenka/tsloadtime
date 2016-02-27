#!/bin/bash

set -euo pipefail

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

$DIR/loadtime.sh http://ultimatecentral.com >> $DIR/$(date -u '+%F').csv
