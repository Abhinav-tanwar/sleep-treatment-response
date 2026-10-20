/* Sleep Treatment Response */
%require_input(sleep.csv);
data sleep;
  infile "&project_root./data/sleep.csv" dsd dlm=',' firstobs=2 truncover;
  input Drug Placebo;
  Difference=Drug-Placebo;
run;
proc means data=sleep n mean std; var Drug Placebo Difference; run;
proc univariate data=sleep normal;
  var Difference Placebo;
  histogram / normal;
  qqplot / normal(mu=est sigma=est);
run;
/* Primary recovery: original two-sided paired comparison and 95% CI. */
proc ttest data=sleep sides=2 alpha=0.05 h0=0;
  paired Drug*Placebo;
  title 'Paired difference in sleep hours: Drug minus Placebo';
run;
/* Directional question: prespecified increase in sleep. */
proc ttest data=sleep sides=U alpha=0.05 h0=0;
  paired Drug*Placebo;
  title 'One-sided sensitivity: increased sleep';
run;
proc corr data=sleep; var Drug Placebo; run;
/* A paired t-test is a one-sample test of within-pair differences.
   Use the observed difference SD as a transparent illustrative planning input.
   This is a planning curve, not post-hoc evidence for the observed effect. */
proc means data=sleep noprint;
  var Difference; output out=diff_summary std=sd_difference;
run;
data _null_; set diff_summary; call symputx('sd_difference',sd_difference); run;
proc power;
  onesamplemeans test=t mean=0 to 3 by 0.5 nullmean=0
    stddev=&sd_difference. sides=2 ntotal=10 alpha=0.05 power=.;
  plot x=effect min=0.2 max=2;
run;
proc ttest data=sleep sides=L alpha=0.10 h0=6;
  var Placebo;
  title 'Placebo mean sleep below six hours';
run;
