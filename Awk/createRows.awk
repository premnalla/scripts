#
# FILE: createRows.awk
#
# USAGE: nawk -v CMTS_HOST=Axiowave -f createRows.awk input_file.txt
#
BEGIN { 
  FS="|";
}

#Main()
{

  split($0, myFields, FS);

  CHANNEL_INDEX = myFields[1];
  CHANNEL_NAME = myFields[2];
  CHANNEL_TYPE = "Upsteram";

  sqlInsertStr = sprintf("insert into CMEX_CMTS_CHANNEL_INVENTORY values ('%s',%s,'%s','%s',NULL);", CMTS_HOST,CHANNEL_INDEX,CHANNEL_TYPE,CHANNEL_NAME);
  print sqlInsertStr;
}

#
END {
}

