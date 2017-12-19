#!/bin/sh

AWK_INFILE=./foo.txt

if [ -f $AWK_INFILE ]; 
then
  /bin/rm $AWK_INFILE ;
else
  echo "$AWK_INFILE doesn't exist" ;
fi

