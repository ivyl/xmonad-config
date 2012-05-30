#!/bin/sh
echo $(iwconfig wlan0 | grep -o 'ESSID:".*"' | sed s/ESSID:\"// | sed s/\"//) '[<fc=#3399FF>'$(iwconfig wlan0 | grep -o 'Quality=[^ ]*' | sed s/Quality=//)'</fc>]'
