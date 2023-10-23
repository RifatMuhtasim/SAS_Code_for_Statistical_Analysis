/* Appending Dataset with SET Statements */
data mydata;
   input Name $ Age Height Weight Gender $;
   datalines;
John 25 175 70 F
Alice 30 162 55 F
Bob 28 180 80 M
;
RUN;


data mydata2;
   input Name $ Age Height Weight Gender $;
   datalines;
Johny 253 1735 730 M
Alicey 303 1632 535 F
Boby 283 1803 830 M
;
RUN;


DATA Adding_data;
SET mydata mydata2;
RUN;

PROC PRINT data=Adding_data;
RUN;



/* Appending dataset with PROC APPEND Statements? */
data mydata;
   input Name $ Age Height Weight Gender $;
   datalines;
John 25 175 70 F
Alice 30 162 55 F
Bob 28 180 80 M
;
RUN;


data mydata2;
   input Name $ Age Height Weight Gender $;
   datalines;
Johny 253 1735 730 M
Alicey 303 1632 535 F
Boby 283 1803 830 M
;
RUN;


PROC APPEND 
	BASE = mydata
	DATA = mydata2;
RUN;