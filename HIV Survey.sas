/* Generated Code (IMPORT) */
/* Source File: HIV_Survey.xls */
/* Source Path: /home/u63558578/PHC6052 */
/* Code generated on: 11/30/23, 3:10 PM */

%web_drop_table(WORK.IMPORT);


FILENAME REFFILE '/home/u63558578/PHC6052/HIV_Survey.xls';

PROC IMPORT DATAFILE=REFFILE
	DBMS=XLS
	OUT=WORK.IMPORT;
	GETNAMES=YES;
RUN;

PROC CONTENTS DATA=WORK.IMPORT; RUN;


%web_open_table(WORK.IMPORT);

Proc Sgplot data=phc6052.hiv_survey;
vbox Sx_AgeStart / category= SexOrien;
Run;

Proc Corr Data=phc6052.hiv_survey;
Var Age TotalKnw;
Run;