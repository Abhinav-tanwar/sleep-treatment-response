# Provenance and implementation notes

Sleep Treatment Response was recovered from the author-supplied SAS code PDF, with statements transcribed into editable SAS source and organized for a standalone repository.

Changes include portable input paths, explicit data schemas, fail-fast missing-input checks, and removal of SAS Studio web-only macros and browser print artifacts. Commits describe packaging and reconstruction performed now; they do not backdate the original analysis.

SAS source has not been executed in SAS in this environment. Independent Python checks verify the supplied data and selected numerical results; they do not establish SAS runtime compatibility.

The supplied power block uses corr=+0.44, but observed Drug/Placebo correlation is -0.442282. Its stddev=1.7319 equals the SD of paired differences, not a shared marginal SD. The corrected planning curve uses ONESAMPLEMEANS on paired differences. The original block is retained in docs/original-power.sas for traceability. See [SAS POWER documentation](https://support.sas.com/documentation/onlinedoc/stat/121/power.pdf).
