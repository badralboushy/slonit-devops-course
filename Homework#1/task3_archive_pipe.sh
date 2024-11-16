#!/usr/bin/bash

# create the pipe 
#mkfifo my_pipe

echo "/var/log/messages" > my_pipe &

# this command will archive the file name sended by the pipe, and it will remain the directory tree of the file.
tar -cf archive.tar -T my_pipe 

echo "archive.tar file was created"

# to decompress the archive with the directory tree
# to remove the directory tree of the file we add --strip-components=<number of nested directories>
# tar -xf archive.tar
