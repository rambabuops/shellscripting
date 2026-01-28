#!/bin/bash

#### special variables

echo "all aregs passed to script: $@"

echo "Number of vars passed to script:$#"

echo "script name: $0"

echo "present working directory:$PWD"

echo "who is running:$USER"

echo "home dir of current user: $HOME"

echo "PID of the script:$$"

sleep 100 &

echo "PID of recently executed background process:$!"

echo "all args are passed to script:$*"

