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
