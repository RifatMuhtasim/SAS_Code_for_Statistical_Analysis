data mydata;
   input Name $ Age Height Weight Gender $;
   datalines;
John 25 175 70 M
Alice 30 162 55 F
Bob 28 180 80 M
;


/* Gender Frequency Table */
title "Geneder Frequencies";
proc freq data = mydata;
    table Age;
run;


/* Summary Statistics */
title "Summary Statistics";
proc means data = mydata;
    var Age Height;
run;


/*
PROC freq
 Creates a basic frequency 
table with:
 Frequency
 Percent
 Cumulative Frequency
 Cumulative Percent
 “DATA=newdemo” references 
the newdemo dataset
 TABLE statement indicates 
which variable(s) to include
 Can use multiple variables 
and even create cross-tab tables

PROC means
 Creates a basic summary 
table with:
 N
 Mean
 Std Dev
 Minimum
 Maximum
 Can specify which statistics 
to use in table
 “DATA=newdemo” 
references the newdemo
dataset
 VAR statement indicates 
which variable(s) to include
*/


/*
PROC PRINT: PROC Print can be used to list the data in a SAS dataset

Many options to control output of PROC Print
    noobs – Suppresses “OBS” column in output
    (obs=2) – Only prints the first two observations
    Can put in any number: 1 through N
    Must be placed in parentheses after data= option
   var statement – Only prints listed variables
*/

PROC PRINT data=mydata;
run;

PROC PRINT noobs data=mydata(obs=2);
var Height Weight;
run;


/*
PROC CONTENTS: PROC Contents can be used to display the metadata (descriptor portion) of the SAS dataset
- # : Variable number
- Type: Numeric or Characteristic
- Format: How to data is displayed
- Informat: How the data was read by SAS

varnum :- Show the list of the Variables
*/

PROC CONTENTS;
RUN;

PROC CONTENTS VARNUM;
RUN;



/*
PROC FREQ :  can be used to run simple frequency tables on your data

table: Use the table statement to only print selected variables
nocum: Use the nocum option to suppress cumulative statistics
nopercent: Use the nopercent option to suppress percent statistics

Gender * Weight = is Called Corss tabulations

Gender * Weight / list = Use the list option to display cross-tab tables in a list format

*/

proc freq data= mydata;
run;

proc freq data=mydata;
   table Gender nocum nopercent;
run;

proc freq data=mydata;
   table Gender * Height;
run;

proc freq data=mydata;
   table Gender * Height / list;
run;



/*
proc means;
PROC Means can be used to run simple summary statistics on your data

NMiss Mean Median :– Examples of statistics that can be specified in PROC Means
class :- Allows for grouping by categorical variables
var :- Only provides statistics for listing analysis variables.
*/

proc means data=mydata;
run;

proc means data=mydata Nmiss Mean Median;
   class Gender;
   var Height;
run;
