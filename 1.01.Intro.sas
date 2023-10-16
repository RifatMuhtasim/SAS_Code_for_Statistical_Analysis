/* Using libname command like: libname [libref] [Directory]
libref - What you are going to call it , Directory - location of your dataset
*/


data weight_club;
   input id_number 1-4 name $ 6-24 team $ startweight endweight;
   loss = startweight - endweight;
   datalines;
1023  Rifat Muhtasim    Red      62 58
1024  Wasif Ahmed       Yellow   87 67
1025  Raisul Islam      Green    92 72     
;
run;

proc print data=weight_club;
run;


data mydata;
   input Name $ Age Height Weight;
   datalines;
John 25 175 70
Alice 30 162 55
Bob 28 180 80
;

proc means data=mydata;
run;


data ourdata;
	input first_name $ last_name $;
	datalines;
rifat muhtasim
masum abdullah
shariful islam
;

proc freq data = ourdata;
run;



