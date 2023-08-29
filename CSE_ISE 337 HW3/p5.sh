#! /bin/bash

# HaoNan Huang; SBUid:113357659; netid:haonhuang

if [ $# -ne 1 ];
then
    echo "input directory is missing"
    exit 1
fi

if [ ! -d "$1" ];
then
    echo "the directory does not exist"
    exit 1
else
    cd $1
    echo "Current date and time: $(date +"%D %T")"
    echo "Current directory is: $(pwd)"
    echo " "

    echo "--- 10 most recently modified directories ---"
    ls -ltp | grep "/" | head -n 10
    echo " "

    echo "--- 6 largest files ---"
    find . -maxdepth 1 -type f -printf '%s %p\n' | sort -rn | head -n 6 | awk '{print $2}' | xargs ls -lSh | tac
    echo " "

    printf '=%.0s' {1..70}
    echo " "
fi
