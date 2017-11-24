proc format;
	value ExpFmt 1= "Night Light Used"
	           0= 'Night Light Not Used';
	value RspFmt 1= "Yes"
			  0= "No";
run;
			  
data Myopia;
	input Exposure Response Count;
	label response= "Myopia";
datalines;
0 0 114
0 1 18
1 0 115
1 1 78 
;
proc sort data=Myopia;
   by descending Exposure descending Response;
run;
proc freq data = Myopia order = data;
format Exposure ExpFmt. Response RspFmt.;
   tables Exposure*Response / chisq relrisk;
   exact pchi or;
   weight Count;
   title 'Case-Control Study of Night lights';
run;
	