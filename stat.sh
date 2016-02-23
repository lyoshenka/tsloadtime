#!/bin/bash

set -euo pipefail

[ -n "${1:-}" -a -f "${1:-}" ] && INPUT="$1" || INPUT="-"

cat $INPUT | sort -n | awk '
  BEGIN {
    count = 0;
    sum = 0;
    oldM = newM = oldS = newS = 0;
  }

  $1 ~ /^[0-9]+(\.[0-9]*)?$/ {
    a[count++] = $1;
    sum += $1;

    if (count == 1) {
      oldM = newM = $1;
    } else {
      newM = oldM + (($1 - oldM) / count);
      newS = oldS + (($1 - oldM) * ($1 - newM));
      oldM = newM;
      oldS = newS;
    }
  }

  END {
    mean = count > 0 ? sum / count : 0;

    # this is the sample std dev, not the population std dev
    # http://www.johndcook.com/blog/standard_deviation/
    stdev = count > 1 ? sqrt(newS/(count-1)) : 0;

    if( (count % 2) == 1 ) {
      median = a[ int(count/2) ];
    } else {
      median = (a[count/2] + a[count/2-1]) / 2;
    }

    print "sum\t"    sum;
    print "count\t"  count;
    print "min\t"    a[0];
    print "median\t" median;
    print "mean\t"   sprintf("%.3f",mean);
    print "stdev\t"  stdev;
    print "90%\t"    a[int(count*0.90-0.5)];
    print "95%\t"    a[int(count*0.95-0.5)];
    print "99%\t"    a[int(count*0.99-0.5)];
    print "max\t"    a[count-1];
  }
'
