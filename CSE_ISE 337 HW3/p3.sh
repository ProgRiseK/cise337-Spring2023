#! /bin/bash

# HaoNan Huang; SBUid:113357659; netid:haonhuang

if [ $# -ne 1 ];
then
    echo "score directory missing"
    exit 1
fi

dirname=$1
if [ ! -d "$dirname" ];
then
    echo "$dirname is not a directory"
    exit 1
fi

confirm_letter_grade() {
    if (( $1 >= 93 )); then
        echo "A"
    elif (( $1 >= 80 )); then
        echo "B"
    elif (( $1 >= 65 )); then
        echo "C"
    elif (( $1 >= 50 )); then
        echo "D"
    else
        echo "F"
    fi
}

for file in "$dirname"/*;
do

  if [[ $file == *.txt ]];
  then
      id=$(awk 'NR==2{split($1,a,","); print a[1]}' "$file")

      average=$(awk 'NR==2{split($1,a,","); sum=0; for(i=2;i<=6;i++) sum+=(a[i]*10); print sum/5}' "$file")

      letter_grade=$(confirm_letter_grade "$average")

      echo "ID:$id:$letter_grade"
 fi

done
