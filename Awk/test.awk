#
# FILE: test.awk
#
#
BEGIN { 
  FS=" ";
  print $2;
  $2 = "5";
}

#Main()
{
  print $2;
}

#
END {
}

