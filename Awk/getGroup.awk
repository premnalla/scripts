#
# FILE: getGroup.awk
#
# USAGE: nawk -f getGroup.awk group_1.txt
#
BEGIN { 
  FS=";";
  NUM_ROWS = 0;
}

#Main()
{
  if (NUM_ROWS == 0)
  {
    NUM_ROWS++;
    next;
  } else {
    NUM_ROWS++;
  }

  CMTS_HOST = "";

  split($0, myFields, FS);

  CMTS_HOST = myFields[1];

  print CMTS_HOST;
}


#
END {
}

