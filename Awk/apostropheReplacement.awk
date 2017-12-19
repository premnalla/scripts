function addExtraApostrophe (inStr)
{
  num = split(inStr, values, "'");

  for (i=1; i<=num; i++)
  {
    #printf("%s\n", values[i]);
  }

  retStr = "";
  for (i=1; i<=num; i++)
  {
    retStr = sprintf("%s''%s", retStr, values[i]);
  }

  #printf("%s\n", retStr);

  if (num > 1)
  {
     sprintf(retStr, "%s''%s", values[1],values[2]);
  }
  else
  {
    retStr = inStr;
  }

  return (retStr);
}

BEGIN {
    #FS = "[ \t]+";
    FS = ",";
}

{ 
    FIRSTNAME = $1;
    LASTNAME = addExtraApostrophe($2);

    printf("%s,%s\n", FIRSTNAME,LASTNAME);
}

