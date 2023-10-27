DATA temps;
INPUT date date9. high_temp;
FORMAT date date9.;
DATALINES;
01JAN2023 75
02JAN2023 72
03JAN2023 68
04JAN2023 80
05JAN2023 82
06JAN2023 79
07JAN2023 77
08JAN2023 74
09JAN2023 70
10JAN2023 72
;
RUN;


DATA tempcompare;
SET temps;
Last_temp = lag(high_temp);
Last2_temp = lag2(high_temp);
LABEL 	high_temp = "Today's Temp"
		Last_temp = "Yesterday's Temp"
		Last2_temp = "Temp from two days ago";
RUN;


PROC PRINT DATA = tempcompare;
RUN;


DATA testput;
SET  temps;
char_date = put(date, mmddyy10.);
RUN;

PROC PRINT DATA = testput;
RUN;