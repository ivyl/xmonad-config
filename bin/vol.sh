#!/bin/bash
/usr/bin/amixer | awk 'NR == 6 || NR == 7 {printf "%s ", $5}; END {print ""}'
