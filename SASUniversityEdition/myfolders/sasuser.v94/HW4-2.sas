options nodate pageno=1 formdlim='';

data ECG;
	input Gender ECG CD count @@;
datalines;
1 1 1 21 1 1 2 21 1 2 1 9 1 2 2 29
2 1 1 37 2 1 2 10 2 2 1 20 2 2 2 24 
;
run;
proc freq data= ECG;
	weight count;
	tables Gender*ECG*CD / cmh;
	run;
	