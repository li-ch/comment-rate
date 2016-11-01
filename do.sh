#!/bin/bash
# input: src directory of code

find $1 \( -name "*.h" -or -name "*.cpp" \) -exec cat {} \; > all_code.c
./comment-rate.sh all_code.c

