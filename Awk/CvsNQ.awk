#
# FILE: CvsNQ.awk
#
# USAGE: awk -f CvsNQ.awk input_file.txt
#
BEGIN { 
  FS=" ";
}

#Main()
{

  split($0, myFields, FS);

  FileName = myFields[2];

  print FileName;
}

#
END {
}

