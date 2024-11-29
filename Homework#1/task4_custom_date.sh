#!/usr/bin/bash

format="%Y-%m-%d %H:%M:%S"
echo "Custom Format: $format"

echo "Date in Unix time with the custom format and the format is served via pipe :"
echo $format | date +"$(cat -) (Unix Time: %s)"
