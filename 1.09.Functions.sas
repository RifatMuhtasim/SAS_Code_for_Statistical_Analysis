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

/* Function vs PROC's */ 
DATA mean_result;
	SET Final;
	means = mean(quiz1, quiz2, quiz3); /* Here mean is a function */
RUN;


PROC PRINT DATA=mean_result;
RUN;


PROC MEANS DATA= Final;
	var quiz2;
RUN;

