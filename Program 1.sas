/* Generated Code (IMPORT) */
/* Source File: Project 1 .xls */
/* Source Path: /home/u63558578/PHC6052 */
/* Code generated on: 10/26/23, 10:01 AM */

%web_drop_table(PHC6052.Project1);


FILENAME REFFILE '/home/u63558578/PHC6052/Project 1 .xls';

PROC IMPORT DATAFILE=REFFILE
	DBMS=XLS
	OUT=PHC6052.Project1;
	GETNAMES=YES;
RUN;

PROC CONTENTS DATA=PHC6052.Project1; RUN;


%web_open_table(PHC6052.Project1);

Proc format;
Value denbinaryf 1= "Density <= 1.050"
                2= "Density > 1.050";
Value denmultif  1= "Desnity <= 1.060"
                2= "1.060 < Density < 1.080"
                3= "Density >= 1.080";
Value wbinaryf   1= "Weight <= 175"  
                2= "Weight > 175";
Value wmultif    1= "Weight <= 160" 
                2= "160 < Weight < 200"
                3= "Weight >= 200";
Run;      

Data phc6052.project2;
Set phc6052.project1;
if density <= 1.050 then denbinary = 1;
if density > 1.050 then denbinary = 2;
if density <= 1.060 then denmulti = 1;
if 1.060 < density < 1.080 then denmulti = 2;
if 1.080<= density then denmulti = 3;
if weight <= 175 then wbinary = 1;
if weight > 175 then wbinary = 2;
if weight <= 160 then wmulti = 1;
if 160 < weight < 200 then wmulti = 2;
if 200 <= weight then wmulti = 3;
label density = "Density of Participant"  
      weight = "Weight (lb)"
      denbinary = "Binary Density"
      denmulti = "Multilevel Density"
      wbinary = "Binary Weight (lb)"
      wmulti = "Mulitlevel Weight (lb)";
format denbinary denbinaryf.
       denmulti denmultif.
       wbinary wbinaryf.
       wmulti wmultif.;
Run;

Proc means data=phc6052.project2 n mean clm std min q1 median q3 max;
var density;
Run;

Proc sgplot data=phc6052.project2;
histogram density;
Run;

Proc sgplot data=phc6052.project2;
vbox density;
Run;

Proc univariate data=phc6052.project2 noprint;
var density;
qqplot / normal(mu=est sigma=est);
Run;

Proc freq data=phc6052.project2;
table denbinary denmulti;
Run;

Proc means data=phc6052.project2 n mean clm std min q1 median q3 max;
var weight;
Run;

Proc sgplot data=phc6052.project2;
histogram weight;
Run;

Proc sgplot data=phc6052.project2;
vbox weight;
Run;

Proc univariate data=phc6052.project2 noprint;
var weight;
qqplot / normal(mu=est sigma=est);
Run;

Proc freq data=phc6052.project2;
table wbinary wmulti;
Run;


Proc sgplot data=phc6052.project2;
scatter x = density y = weight;
Run;

Proc corr data=phc6052.project2;
var density weight;
Run;

Proc reg data=phc6052.project2;
model density = weight / clb;
Run;
Quit;

Proc freq data=phc6052.project2;
table denbinary*wbinary / expected chisq;
Run;

Proc freq data=phc6052.project2;
table denmulti*wmulti / expected chisq;
Run;

Proc freq data=phc6052.project2;
table denbinary*wmulti / expected chisq;
Run;

Proc freq data=phc6052.project2;
table denmulti*wbinary / expected chisq;
Run;

Proc sgplot data=phc6052.project2;
vbox weight / category= denbinary;
Run;

Proc ttest data=phc6052.project2;
var weight;
class denbinary;
Run;

Proc sgplot data=phc6052.project2;
vbox weight / category= denmulti;
Run;

Proc anova data=phc6052.project2;
class denmulti;
model weight = denmulti;
Run;














