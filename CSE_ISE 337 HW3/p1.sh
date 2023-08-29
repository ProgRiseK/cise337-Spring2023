#!/bin/bash

#HaoNan Huang; SBUid:113357659; netid:haonhuang

if [ $# -ne 3 ];
then
    echo "USAGE: p1.sh <extension> <src_dir> <dst_dir>"
    exit 1
fi

src_dir=$2
if [ ! -d $src_dir ];
then
    echo "$src_dir not found"
    exit 1
fi

if [ -d $3 ];
then
    dst_dir=$3
else
    mkdir -p $3
    dst_dir=$3
fi

find $src_dir -name "*$1" | while read file;
do
  dirName=$(dirname $file)
  fileName=$(basename $file)
  destDirName=$(echo $dst_dir$dirName | sed -e "s#$src_dir##")

  if [ ! -d $destDirName ];
  then
      mkdir -p $destDirName
  fi

  mv $file $destDirName
done

rm -rf $dst_dir/tmp*

exit 0
