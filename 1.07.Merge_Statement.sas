/* Merge */
DATA PersQuiz;
	INPUT Student_id $ quiz1;
	DATALINES;
03 12
04 15
01 18
02 19
05 17
;
RUN;


DATA SocQuiz;
	INPUT Student_id $ quiz2;
	DATALINES;
05 19
06 11
07 12
01 13
02 12
03 15
04 17
;
RUN;


DATA CogQuiz;
	INPUT Student_id $ quiz3;
	DATALINES;
01 16
02 15
05 16
03 19
04 12
;
RUN;


/* Sorting Value */
PROC SORT DATA=PersQuiz;
BY Student_id;
RUN;

PROC SORT DATA=SocQuiz;
BY Student_id;
RUN;

PROC SORT DATA=CogQuiz;
BY Student_id;
RUN;


DATA Final;
MERGE PersQuiz SocQuiz CogQuiz;
BY Student_id;
RUN;

PROC PRINT DATA=Final;
RUN;


/* Inner Joins */
DATA Final_Allq; 
MERGE PersQuiz (in= q1) SocQuiz (in= q2);
BY Student_id;
IF q1 = 1 and q2 = 1;
RUN;


title "Inner Joins";
PROC PRINT DATA=Final_Allq;
RUN;


/* Excluding Joins */
DATA Final_Allq2; 
MERGE PersQuiz (in= q3) SocQuiz (in= q4);
BY Student_id;
IF q3 = 0 and q4 = 1;
RUN;


title "Excluding Joins";
PROC PRINT DATA = Final_Allq2;
RUN;

