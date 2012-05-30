#!/bin/bash
/usr/bin/amixer | awk 'NR == 6 {gsub(/\[/, ""); gsub(/\]/, ""); gsub(/%/, ""); printf "%s", $5}; END {print ""}'
