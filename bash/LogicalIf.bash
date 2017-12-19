#!/bin/bash

#
if [ -z $1 ]
then
  echo "empty"
else
  echo "not empty"
fi
#
if [ ! -z $1 ]
then
  echo "not empty"
else
  echo "empty"
fi
#
if [ -n $1 > 0 ] && [ $1 == "all" ]
then
  echo "parm-1:$1"
fi

