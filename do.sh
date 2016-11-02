#!/bin/bash
# input: src directory of code

find $1 \( -name "*.h" -or -name "*.cpp" \) -exec cat {} \; > /tmp/all_code.c
./comment-rate.sh /tmp/all_code.c

