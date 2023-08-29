#! /bin/bash

# HaoNan Huang; SBUid: 113357659; netid:haonhuang

if [ $# -ne 2 ];
then
    echo "data file or output file not found"
    exit 1
fi

filename=$1
if [ ! -f $filename ];
then
    echo "$filename not found"
    exit 1
fi

if [ -f "$2" ];
then
    output_file=$2
else
    touch "$2"
    output_file=$2
fi

awk -F '[;:,]' '{ for (i=1; i<=NF; i++) sum[i]+=$i; }; END { for (i in sum) print "Col "i" : " sum[i] }' $filename > $output_file

