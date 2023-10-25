/* Reading date from dataset 'DDMONCCYY'd */
DATA five_years;
	SET inspections;
	WHERE '01jan2008'd LE open_date LE '31dec2012'd;
RUN;


/* From previous time to current time */
DATA current_time;
	SET inspections;
	WHERE '01jan2008'd LE open_date LE TODAY();
RUN;


/* Reading datetime from dataset 'DDMONCCYY:HH:MM:SS'dt */
DATA five_years;
	SET inspections;
	WHERE '01jan2008:00:00:00'dt LE open_date LE '31dec2012:23:59:59';
RUN;
