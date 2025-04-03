Data PHC6052.nhanes121_Step1;
Set phc6052.nhanes121;
Label Age = "Age (Years)"
Smoke = "Smoking Status"
HBP = "High Blood Pressure";
Run;

Proc Format;
Value Smoke 1 = "Never"
2 = "Former"
3 = "Current";
Value HBP 0 = "No"
1 = "Yes";
Run;

Data phc6052.nhanes121_Step2;
Set phc6052.nhanes121;
Label Age = "Age (Years)"
Smoke = "Smoking Status"
HBP = "High Blood Pressure";

Format Smoke Smoke.
HBP HBP.;

Run;

Proc Format;
Value Smoke 1 = "Never"
2 = "Former"
3 = "Current";
Value HBP = "No"
1 = "Yes";
Run;


Proc Freq data=phc6052.nhanes121_step2;
Tables HBP*Smoke;
Run;

Proc Means data=phc6052.nhanes121_step2 N MEAN STD MIN Q1 MEDIAN Q3 MAX MAXDEC=3;
Class HBP;
Var Age;
Run;

Proc Means data=phc6052.nhanes121_step2 N MEAN STD MIN Q1 MEDIAN Q3 MAX MAXDEC=3;
Class Smoke;
Var Age;
Run;

Proc SGPLOT data=phc6052.nhanes121_step2;
Vbox Age/Category=HBP;
Run;

Proc SGPLOT data=phc6052.nhanes121_step2;
Vbox Age/Category=Smoke;
Run;







