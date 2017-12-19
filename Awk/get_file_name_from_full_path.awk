#
# FILE: get_file_name_from_full_path.awk
#
#
BEGIN { 
}

#Main()
{
  FS="/";

  numFields =   split($0, myFields, FS);

  fileName = myFields[numFields];

  printf("%s\n", fileName);
}

#
END {
}

