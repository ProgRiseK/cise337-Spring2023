#! /bin/bash

# HaoNan Huang; SBUid:113357659; netid:haonhuang

if [ $# -ne 2 ];
then
    echo "input file and dictionary missing"
    exit 1
fi

if [ ! -f "$1" ] ;
then
   echo "$1 is not a file"
   exit 1
fi

if [ ! -f "$2" ] ;
then
   echo "$2 is not a file"
   exit 1
fi

readarray -t words < <(awk -v RS='[ .,?!]|\n' 'length($0)==5' "$1")
readarray -t dict < "$2"

for word1 in "${words[@]}";
do

  for word2 in "${dict[@]}";
  do

    if [[ "${word1:0:1}" == "${word2:0:1}" && "$(echo "$word1" | grep -o . | sort | tr -d '\n')" == "$(echo "$word2" | grep -o . | sort | tr -d '\n')" && "$word1" != "$word2" ]]; then
       echo "$word1"
    fi

  done

done

