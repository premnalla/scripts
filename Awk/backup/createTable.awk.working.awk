#
BEGIN { 
  FS="|";
}

#Main()
{
  CMTS_HOST = "philli.comcast.com";
  #CMTS_HOST = "";
  #CMTS_HOST_TMP = system("/bin/env |grep CMTS_GROUP_HOST");
  #print CMTS_HOST_TMP;
  #if (CMTS_HOST_TMP != "")
  #{
  #  split(CMTS_HOST_TMP, myCmtsHostEnvVar, "=");
  #  CMTS_HOST = myCmtsHostEnvVar[2];
  #}
  #print CMTS_HOST;

  split($0, myFields, FS);
  #CMTS_HOST = "foo";
  CHANNEL_INDEX = myFields[1];
  CHANNEL_NAME = myFields[2];
  CHANNEL_TYPE = "Upsteram";
  #UPDATE_TIME = "NULL";

  sqlInsertStr = sprintf("insert into CMEX_CMTS_CHANNEL_INVENTORY values ('%s',%s,'%s','%s',NULL);", CMTS_HOST,CHANNEL_INDEX,CHANNEL_TYPE,CHANNEL_NAME);
  print sqlInsertStr;
}


#
END {
}

