#!/usr/bin/bash

# create the pipe
# mkfifo my_pipe

# send the format using the pipe
echo "Custom Format: %Y-%m-%d %H:%M:%S" | date +"$(cat -)"

