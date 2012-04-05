#!/bin/sh
echo $(iwconfig wlan0 | grep -o 'ESSID:".*"') $(iwconfig wlan0 | grep -o 'Quality=[^ ]*' | sed s/Quality=//) '  ' 
