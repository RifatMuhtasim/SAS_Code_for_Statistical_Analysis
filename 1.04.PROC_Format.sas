/* PROC Import 
OUT = Name of the output SAS dataset
DATAFILES = Where to find data . The directory of dataset
DBMS = Type of incoming raw data. 
replace = Overwritten SAS Data.
GETNAMES = Use the first record as a variable name.
*/

PROC IMPORT OUT=work.test
    DATAFILES = "/home/u63602459/Mydata.txt"
    DBMS=CSV replace;
  GETNAMES=yes;
RUN;


/* PROC FORMAT
value = Value statements begins with new format
*/

PROC FORMAT;
    value $GENDER
    "M" = "Male"
    "F" = "Female";
RUN;

PROC FORMAT;
    VALUE YNscale /* There is no $ so the value is numerical */
    1= "Yes"
    2= "No"
    3= "N/A";
RUN;

/* PROC FORMAT Groupdata */
PROC FORMAT;
    value $groupdata
    "Always", "Mostly" = "Like"
    "Rarely", "Never" = "Dislike";
RUN;


/* PROC FORMAT Grades 
other or else = non-specified input value 
*/
PROC FORMAT;
    value $grades
    'A'-'C' = "Passed"
    'D', 'F' = "Fail"
    'I' = 'Incomplete'
    ' ' = 'Grade Missing'
    other = 'Data Error'
RUN;


/* PROC FORMAT Wage */
PROC FORMAT;
    VALUE wages
    low - 300 = "Less than Average"
    300 <- 600 = "Average"
    600 - high = "Above Average";
RUN;

/* Using Formats */
FORMAT gender $gender. dob mmddyy8.
    dollar dollar12.2 miles comma8.;
RUN;


data test;
    input Date Dollar Miles Gender $;
    FORMAT gender $gender. dob mmddyy8.
        dollar dollar12.2 miles comma8.;
    datalines;
    12331 234342 23425 M
    34534 234342 16234 F
    21343 234234 23434 M;
RUN;

PROC FREQ data = test;
    
