#!/bin/sh
# shell script to prepend i3status with more stuff

i3status --config ~/.i3/i3status.config | while :
do
       read line
       echo `acpi` "| $line" || exit 1
done
