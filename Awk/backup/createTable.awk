function printError(STRING)
{
    print "ERROR::"STRING;
    exit 1;
}

function trim(STRING)
{
     gsub(/^[ \t]*/,"",STRING);
     gsub(/[ \t]*$/,"",STRING);
     return STRING;
}

function trimAll()
{
    for(i=1;i<=NF;i++)
    {
        $i=trim($i);
    }
}


#Called once when a header is found
#This will take a list of columns and 
#create a array of all columns in range
function getColumnsAll(list,array)
{
    z = split(list,tmp_array,COLUMN_SEP);
    x=0;
    for(i=1;i<=z;i++)
    {
        y = split(tmp_array[i],tmp_ref_array,":");
        if(tmp_ref_array[1] <= NF && tmp_ref_array[1]  > 0)
        {
            x++;
            array[x]=tmp_array[i];
        }
        else
        {
            printError("Column ["tmp_ref_array[1]"] is out of range");
        }
    }
    return x;
}

#Called once when a header is found
#This will take a list of columns and 
#create a array of vaild columns and styles
function getColumns(list,column_array,style_array)
{
    z = getColumnsAll(list,tmp_array);
    x=0;
    for(i=1;i<=z;i++)
    {
        y = split(tmp_array[i],tmp_ref_array,":");

        if(y== 2  && (tmp_ref_array[2] > NF || tmp_ref_array[2] <1))
        {
            printError("Column ["tmp_ref_array[2]"] is out of range");
        }
        if(y > 2)
        {
            printError("Column ["tmp_ref_array[1]"] contains too many ':'s");
        }
        if(y == 2 && tmp_ref_array[2] <= NF && tmp_ref_array[2] >0)
        {
            style_array[tmp_ref_array[1]]=tmp_ref_array[2];
        }
        x++;
        column_array[x]=tmp_ref_array[1];
    }
    return x;
}

function getHeaderColumns(list,header_array)
{
     #z = split(list,tmp_array,COLUMN_SEP);
     z = getColumnsAll(list,tmp_array);
     x=0;

     for(i=1;i<=z;i++)
     {
         y = split(tmp_array[i],tmp_ref_array,":");
         if(y == 2)
         {
            header_array[tmp_ref_array[1]]=tmp_ref_array[2];
         }
         x++;
     }
     return x;
}

function print_TD(column)
{
    STRING="<TD";
    if(STYLE_COLS[column] && trim($STYLE_COLS[column]))
    {
        STRING=STRING" "trim($STYLE_COLS[column]);
    }
    STRING=STRING">";
    return STRING;
}

function print_TH(column)
{
    STRING="<TH";
    if(HEADER_COLS[column])
    {
        STRING=STRING" "HEADER_COLS[column];
    }
    STRING=STRING">";
    return STRING;
}

function print_Column(column)
{
    if($column ~ /^999999$/ || $column ~ /^999999.[0]*$/)
    {
        return "<center>No Data</center>";
    }
    else
    {
        return $column;
    }
}

BEGIN { 
          FS="|";
          #Variable Init
          HEADER=0;
          ROW_COLOR="#ADD8E6";#the row background color
          COLOR_ROW=1;#color starting on row 1
          DATA_ROW_NUM=0;#The number of data rows written
          COLUMN_SEP=",";
          #Startup Stuff
          #print "<HTML>";
          #print "<HEAD><TITLE></TITLE></HEAD>";
          #print "<body bgcolor=#FFFFCC><BR><BR><BR>";
          
          print "<CENTER>";
          print "<TABLE id=\"DataTable\" border width=100% cellspacing=0 >";
}

#Main()
{
    if(NF <=1)
    {
        next;
    }

    if (HEADER==0)
    {
        #If the row contains header data
        #get rows that contain color data

        #CALL THE FOLLOWING ONCE
        trimAll();
        number_of_columns = getColumns(COLUMNS,columns,STYLE_COLS);
       
        number_of_prefix_columns = getColumnsAll(PREFIX,prefix_columns);
        number_of_suffix_columns = getColumnsAll(SUFFIX,suffix_columns);
        
        number_of_header_columns = getHeaderColumns(HEADER_STYLE,HEADER_COLS);

        total_number_of_columns=number_of_columns+number_of_prefix_columns+number_of_suffix_columns;

        print "<TR ALIGN=CENTER BGCOLOR=#FFCC99>";

        #PRINT THE PREFIX
        for (i = 1; i <= number_of_prefix_columns; i++)
        {  
            print $prefix_columns[i];
        }
        
        #PRINT THE MIDDLE DATA
        for (i = 1; i <= number_of_columns; i++)
        {            
            #print "<TH>"$columns[i]"</TH>";
            print print_TH(columns[i]) trim($columns[i]) "</TH>";
        } 

        #PRINT THE POST FIX
        for (i = 1; i <= number_of_suffix_columns; i++)
        {  
            print $suffix_columns[i];
        }
        print "</TR>";
        HEADER=1;
    }
    else
    {
        #If the row contains row data
        DATA_ROW_NUM=DATA_ROW_NUM+1;
        print "<TR ALIGN=CENTER";
        if((COLOR_ROW = ((COLOR_ROW % 2) + 1)) == 2)
        {
            print " BGCOLOR="ROW_COLOR;
        }
        print ">";

        #PRINT THE PREFIX
        for (i = 1; i <= number_of_prefix_columns; i++)
        {  
            print trim($prefix_columns[i]);
        }

        #PRINT THE MIDDLE DATA
        for (i = 1; i <= number_of_columns; i++)
        {
            
            print print_TD(columns[i]) trim(print_Column(columns[i])) "</TD>";
        }

        #PRINT THE POST FIX
        for (i = 1; i <= number_of_suffix_columns; i++)
        {  
            print trim($suffix_columns[i]);
        }
        print "</TR>";
    }
}


END {
    
    print "</TABLE>";
    print "</CENTER>";
    
    if(HEADER <= 0)
    {
        printError("log file contains no data");
    }
    else if(DATA_ROW_NUM <= 0)
    {
        print "<CENTER>";
        print "<TABLE border width=100% cellspacing=0 >";
        print "<TR BGCOLOR="ROW_COLOR"><TD><Center><br><b>No Modem Data for this report</center><br></td></tr>";
        print "</TABLE>";
    print "</CENTER>";
    }
    #print "</HTML>";
}


      









