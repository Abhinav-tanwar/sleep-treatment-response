# Independent numerical validation

Computed directly from the repository CSV using Python, pandas, NumPy, and SciPy. This is independent numerical evidence, not a SAS execution log. Reproduce with `python -m pip install -r validation/requirements.txt` then `python validation/check_results.py`.

```text
Pairs: 10
Mean Drug minus Placebo: 1.72
SD difference: 1.731922502756851
95% CI: (np.float64(0.48105727704688905), np.float64(2.958942722953111))
Two-sided paired t: TtestResult(statistic=np.float64(3.1405086352488047), pvalue=np.float64(0.011918261578070138), df=np.int64(9))
One-sided paired t: TtestResult(statistic=np.float64(3.1405086352488047), pvalue=np.float64(0.005959130789035069), df=np.int64(9))
Shapiro difference: ShapiroResult(statistic=np.float64(0.9612956876987693), pvalue=np.float64(0.8005407973316176))
Placebo below 6: TtestResult(statistic=np.float64(-1.8128870881143997), pvalue=np.float64(0.05163065925525573), df=np.int64(9))
Drug/Placebo correlation: -0.4422816584887401
Shapiro placebo: ShapiroResult(statistic=np.float64(0.9328123044167279), pvalue=np.float64(0.4761172278082469))
```
