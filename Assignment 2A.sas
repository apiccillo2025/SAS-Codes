/* Generated Code (IMPORT) */
/* Source File: nhanes21.csv */
/* Source Path: /home/u63558578/PHC6052 */
/* Code generated on: 9/1/23, 9:59 PM */

%web_drop_table(PHC6052.nhanes21);


FILENAME REFFILE '/home/u63558578/PHC6052/nhanes21.csv';

PROC IMPORT DATAFILE=REFFILE
	DBMS=CSV
	OUT=PHC6052.nhanes21;
	GETNAMES=YES;
RUN;

PROC CONTENTS DATA=PHC6052.nhanes21; RUN;


%web_open_table(PHC6052.nhanes21);

data PHC6052.nhanes21_step1;
set PHC6052.nhanes21;
label Age="Age (Years)"
Smoking="Smoking Status";
Run;

Proc Freq data=phc6052.nhanes21_step1;
tables Smoking;
run;

Proc means data=phc6052.nhanes21_step1 N MEAN STD MIN Q1 MEDIAN Q3 MAX MAXDEC=3;
var Age;
run;

Proc SGPLOT data=phc6052.nhanes21_step1;
HISTOGRAM Age;
run;

Proc SGPLOT data=phc6052.nhanes21_step1;
VBOX Age;
run;

Proc UNIVARIATE data=phc6052.nhanes21_step1 NOPRINT;
VAR Age;
QQPLOT;
run;

Proc SGPLOT data=phc6052.nhanes21_step1;
Histogram Age;
Density Age/Type = Kernel;
Run;

