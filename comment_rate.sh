#!/bin/bash
#program:
#	input: .c,.cpp,.h 
#	output: line count, code line count, commnet count, empty line count, comment rat
#	accepted comment types：
#	* "//"
#	* /**/
#History:
#2016/11/01 First release
echo "-----------------------"> result.txt
date >> result.txt
echo "$1" >>result.txt
echo >>result.txt
echo "----===Results===----">>result.txt
declare -i fileLine=`cat $1 | wc -l`
echo  "Line count："$fileLine"" >>result.txt
declare -i codeLine=`cat $1 | grep -v '^[[:space:]]*$'|grep -v '^[[:space:]]*\/\/' |sed '/\/\*/,/\*\//d' | wc -l`
echo  "Code line count："$codeLine"" >>result.txt
declare -i noNoteLine=`cat $1 |  sed '/\/\*/,/\*\//d' | sed '/\/\//d'|wc -l`
declare -i noteLine=0
((noteLine=fileLine-noNoteLine))
echo  "Comment line count："$noteLine"" >>result.txt
declare -i blankLine=`cat $1 | grep '^[[:space:]]*$' |wc -l`
echo  "Blank line count："$blankLine"" >>result.txt
declare -i line=0
((line=noteLine+codeLine))
echo -n "Code rate:" >>result.txt
echo  $(expr $noteLine \* 100 / $line) >>result.txt
echo "----==============----" >>result.txt
