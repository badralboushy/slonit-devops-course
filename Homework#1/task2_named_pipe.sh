#!/usr/bin/bash

# create a pipe 
mkfifo my_pipe

# send the output of ss -plnt through the pipe
ss -plnt > my_pipe & 

# write the data inside the named pip into a file 

cat my_pipe > ss_output.txt
