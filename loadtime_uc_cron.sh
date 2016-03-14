#!/bin/bash

set -euo pipefail

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
HOST=$(hostname)

$DIR/loadtime.sh http://ultimatecentral.com >> $DIR/$HOST/$(date -u '+%F').csv
