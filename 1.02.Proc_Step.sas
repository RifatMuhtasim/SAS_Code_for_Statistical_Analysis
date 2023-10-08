data mydata;
   input Name $ Age Height Weight;
   datalines;
John 25 175 70
Alice 30 162 55
Bob 28 180 80
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