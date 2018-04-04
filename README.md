# GBM_immune_microenvironment

R script implementing regression analysis to estimate the proportion of cells from mixture gene expression data. Analysis is based on reference expression profiles. 

Usage
-----
Function for running the regression analysis is `regressionAnalysis`. Input for the function is normalized gene expresison matrix of mixture for which to relative cell proportions are estimated and normalized gene expression matrix of reference cell types.

``` r
proportions <- regressionAnalysis(mixture = myMixture, reference_cells = myReference)
```
`proportions` contains the estimated relative cell proportions in each mixture sample present in the matrix `myMixture`.

Contact information
-------------------

Suvi Luoto (<suvi.luoto@uta.fi>).
