/* Recovered original planning block; not called by run.sas.
   The values mix the SD of paired differences with marginal SD/correlation assumptions. */
/* Original planning assumptions are retained, not estimated power. */
proc power;
  pairedmeans test=diff meandiff=0 to 3 by 0.5
    stddev=1.7319 corr=0.44 sides=2 npairs=10 alpha=0.05 power=.;
  plot x=effect min=0.2 max=2;
run;
