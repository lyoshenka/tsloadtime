#!/bin/bash

# Download data from pingboxes

set -euo pipefail

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
SCRIPT_DIR="$DIR/lftp-scripts"

#lftp -c "open -u USER,PASSWORD -e 'set ssl:verify-certificate false' HOST; mirror --only-newer --include-glob '*.csv' tsloadtime pingboxlv"

for script in $SCRIPT_DIR/*; do
  echo "Pulling $(basename $script)"
  lftp -f "$script"
done

echo "Done"
