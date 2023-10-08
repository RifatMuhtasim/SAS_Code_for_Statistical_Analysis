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
