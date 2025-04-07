# genetics.binaRies

<!-- badges: start -->
[![R-CMD-check](https://github.com/MRCIEU/genetics.binaRies/workflows/R-CMD-check/badge.svg)](https://github.com/MRCIEU/genetics.binaRies/actions)
[![r-universe](https://mrcieu.r-universe.dev/badges/genetics.binaRies)](https://mrcieu.r-universe.dev/genetics.binaRies)
<!-- badges: end -->

The goal of genetics.binaRies is to provide a convenient way to make binaries 
such as `plink`, `bcftools`, and `gcta` available to other packages in the 
MRC IEU OpenGWAS system.

## Installation

You can install the development version of **genetics.binaRies** from GitHub 
with:

``` r
if (!requireNamespace("remotes", quietly = TRUE)) install.packages("remotes")
remotes::install_github("MRCIEU/genetics.binaRies")
```
