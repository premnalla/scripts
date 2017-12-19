cvslsco () {
  OUT_FILE="/tmp/cvs_nq_update";
  AWK_INFILE="$OUT_FILE.awk.in";
  CAT_INFILE="$OUT_FILE.out";

  #echo "$AWK_INFILE; $CAT_INFILE";

  if [ -f $AWK_INFILE ]
  then
    /bin/rm $AWK_INFILE ;
  fi

  if [ -f $CAT_INFILE ]
  then
    /bin/rm $CAT_INFILE ;
  fi

  cvs -nq update |grep "M " >> $AWK_INFILE
  cvs -nq update |grep "? " >> $AWK_INFILE
  awk -f ~premraj/Awk/CvsNQ.awk $AWK_INFILE >> $CAT_INFILE
  cat $CAT_INFILE |more
}
