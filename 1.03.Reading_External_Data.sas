/* txt
Reading Data from a text file 
infile - Where to find data
input - Variable name associated with each data value
*/

data demography;
	infile "/home/u63602459/Mydata.txt";
	input Gender $ 
		Age
		Height
		Weight;
run;


title 'Demography Data';
proc print data=demography;
run;



/* csv
Reading Data from a CSV file Where variable are separated by comma
dsd - this statement is must be used to read data from csv it's called "delimiter-sensitive data"
*/

data company;
	infile "/home/u63602459/company.csv" dsd;
	input Employee $ 
		Age
        Salary;
run;

title 'Company Data';
proc print data=company;
run;
