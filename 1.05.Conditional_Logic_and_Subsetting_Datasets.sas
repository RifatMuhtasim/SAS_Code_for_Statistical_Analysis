/* If Else Condition
IF <condition> THEN <x> ;
ELSE IF <Second Condition> THEN <y>;
ELSE <Z>;

grade = assignment statement use to create a new variable
*/

IF score >= 40 THEN grade="Passed";
ELSE grade="Failed";

IF score >= 60 THEN grade="First Class";
ELSE IF 40 <= score < 60 THEN grade = "Second Class";
ELSE grade="Failed";


data AgeGroup;
  set test_data;
  if age < 18 and gender = "F" then group = "Minor - Female";
  else if age < 18 and gender = "M" then group = "Minor - Male";
  else if age > 18 and gender = "F" then group = "Adult - Female";
  else if age > 18 and gender = "M" then group = "Adult - Male";
RUN;


/* Subsetting Condition
Can be used both if and where condition
*/

DATA minors; 
  SET test_data;
  IF age < 18;
RUN;

DATA minors; 
  SET test_data;
  WHERE age < 18;
RUN;


/* Subsetting If
Use in data step to bring in only the selected observations when using an input statement
*/

data mydata;
   input Name $ Age Height Weight Gender $;
   if Gender = "F";
   datalines;
John 25 175 70 M
Alice 30 162 55 F
Bob 28 180 80 M
;


/* Subsetting Where
Use in data step to bring in only the selected observations when using an input statement
*/

PROC PRINT data = mydata;
WHERE Age > 28;
RUN;


/* Selecting Variables

*/
data demo;
  set test_scores;
  drop gender;
run;

data demo2;
  set test_scores (drop=gender);
  run;
