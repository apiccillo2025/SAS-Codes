PROC SQL;
CREATE TABLE WORK.query AS
SELECT AGE , SBP , HBP , AGP FROM _TEMP0.nhanes103_step2;
RUN;
QUIT;

PROC DATASETS NOLIST NODETAILS;
CONTENTS DATA=WORK.query OUT=WORK.details;
RUN;

PROC PRINT DATA=WORK.details;
RUN;


Proc Format;
VALUE AGP 1= "20-40"
2= "41-60"
3= "61-90";
VALUE HBP 0= "No"
1= "Yes";
Run;

Data phc6052.nhanes103_step2;
Set phc6052.nhanes103;
Label Age = "Age (Years)"
AGP = "Age Groups"
SBP = "Systolic Blood Pressure"
HBP = "High Blood Pressure";
format agp agp.
hbp hbp.;
Run;

Proc means Data=phc6052.nhanes103_step2 n mean std min Q1 median Q3 max;
Class AGP;
VAR SBP;
Run;

PROC SGPLOT  data=phc6052.nhanes103_step2;
Scatter Y=SBP X=Age;
Run; 



