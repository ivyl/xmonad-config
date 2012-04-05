#!/bin/sh
/usr/bin/acpi -t | awk '{printf "%sC ", $4}; END {print ""}'
