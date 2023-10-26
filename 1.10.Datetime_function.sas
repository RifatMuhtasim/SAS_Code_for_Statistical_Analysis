DATA playdates;
	INPUT	@1 subj 3. 
			@4 datetime anydtdtm19.;
	DATALINES;
	01 12/12/2012:00:00:00 
	02 10/09/2008:12:51:02 
	03 01/19/2000:00:00:36 
	04 20/07/2017:05:38:09 
	05 20/07/2000:11:15:45 
	;
RUN;
	
	
DATA chageit;
	SET playdates;
	FORMAT formatted_date mmddyy10.;
	formatted_date = datepart(datetime);
	date = datepart(datetime); /* Extract date portion from a datetime value:17905 */
	year = year(date);  /* Extract year from a date value:2009 */
	month = month(date);  /* Extract month from a date value:12 */
	day = day(date);  /* Extract day of the month from a date value:31 */
	weekday = weekday(date); /* Extract day of the week from a date value:2 */
	recalc_date = mdy(month, day, year); /* Create a date using month, day and year values:17905 */
	time = timepart(datetime); /* Extract time portion from a datetime value:46262 */
RUN;


PROC PRINT DATA=chageit;
RUN;


/* Show only the thursday value */
DATA thursday;
	SET chageit;
	WHERE weekday(date)=5;
RUN;


PROC PRINT DATA=thursday;
RUN;


/* INTCK Function  */
DATA frequency;
	SET chageit;
	WHERE '01jan2000'd le date le '31dec2015'd;
	days = INTCK('day', '01jan2000'd, date);
RUN;


title "Using intck function";
PROC FREQ DATA=frequency;
	TABLE days;
RUN;
	