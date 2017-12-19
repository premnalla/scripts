#!/bin/bash
source ~premraj/.bashrc
FILES=`cvslsco`
for f in $FILES ; do
  echo "File = $f"
done
