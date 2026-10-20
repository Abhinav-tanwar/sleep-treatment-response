import pandas as pd,numpy as np
from scipy import stats
from pathlib import Path
root=Path(__file__).resolve().parents[1]
d=pd.read_csv(root/'data/sleep.csv');assert len(d)==10 and not d.isna().any().any()
x=d.Drug-d.Placebo;n=len(x);se=x.std(ddof=1)/np.sqrt(n);ci=stats.t.interval(.95,n-1,loc=x.mean(),scale=se)
print('Pairs:',n);print('Mean Drug minus Placebo:',x.mean());print('SD difference:',x.std(ddof=1));print('95% CI:',ci);print('Two-sided paired t:',stats.ttest_rel(d.Drug,d.Placebo));print('One-sided paired t:',stats.ttest_rel(d.Drug,d.Placebo,alternative='greater'));print('Shapiro difference:',stats.shapiro(x));print('Placebo below 6:',stats.ttest_1samp(d.Placebo,6,alternative='less'));print('Drug/Placebo correlation:',d.Drug.corr(d.Placebo));print('Shapiro placebo:',stats.shapiro(d.Placebo))
