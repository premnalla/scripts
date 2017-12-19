#!/bin/bash
#echo "$1"
#exit 0;
RESULTS_DIR=$1
if [ -z $RESULTS_DIR ] ; then
  echo "Need to specify results Directory"
  exit -1;
fi
#exit 0;
source ~premraj/.bashrc
TMP_FILE=./awk.in
FILE_NAME_FILE=./filename.txt
FILES=`cvslsco`
for f in $FILES ; do
  /bin/rm $TMP_FILE > /dev/null 2>&1
  echo "$f" > $TMP_FILE
  /bin/nawk -f ~premraj/Awk/get_file_name_from_full_path.awk $TMP_FILE > $FILE_NAME_FILE
  FILE_NAME=`cat $FILE_NAME_FILE`
  #echo "File=$FILE_NAME"
  cvs diff -c $f > $RESULTS_DIR/$FILE_NAME.diff
done
