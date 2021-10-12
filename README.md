# R Data and Code: Yun and Gramig (JAAE 2021)

This repository is to share the *R* data and code replicating the main results (Table 3 and Table S2) published in Yun and Gramig (JAAE 2021). Modifying the code properly, all results in Yun and Gramig (2021) are reproducible.

GitHub Repository maintained by: Seong Yun\
Department of Agricultural Economics\
Mississippi State University\
**<seong.yun@msstate.edu>**\
**<https://sites.google.com/site/yunsd2004/>**\
*Last updated: Oct 11, 2021*

------------------------------------------------------------------------

1 Citation
====================================
Please cite this publication;

```r
To cite Yun and Gramig (2021) in publications use:

  Yun, Seong D. and Benjamin M. Gramig, 2021, "Spatial Panel Model of Crop Yield Response
  to Weather: Econometric Specification Strategies and Prediction Performance,"
  Journal of Agricultural and Applied Economics (forthcoming).

A BibTeX entry for LaTeX users is

  @article{,
    title = {Spatial Panel Model of Crop Yield Response to Weather: Econometric Specification Strategies and Prediction Performance},
    author = {Seong D. Yun and Benjamin M. Gramig},
    year = {2021},
    journal = {Journal of Agricultural and Applied Economics},
    volume = {},
    issue = {},
    pages = {forthcoming}
  }
```

2 Getting started:
==================

Download the R-file from this repository into yoour working directory.

``` r
    ## In R
    download.file("https://raw.github.com/ysd2004/spatialcropyieldJAAE/main/regCode.R", "regCode.R")
```
In *regCode.R*, it is implementable to download the regression data and perform the regression results in Table 3 and Table S2. Modifying the regression codes, all regression results in Yun and Gramig (2021) are reproducible.

3 Variable Description
==================

*regdata.rda* includes the following variables.
| Column No. | Variable Name  | Description                                          |
|:----:|:------------:|--------------------------------------------------------------|
| 1  | stco     | State and County FIPS code                                         | 
| 2  | year     | year                                                               | 
| 3  | corn     | corn yield (bu/ac)                                                 | 
| 4  | ppt      | precipitation (mm)                                                 |
| 5  | ppt_sq   | ppt squared (ppt x ppt)                                            | 
| 6  | t        | time trend ( 1 = 1981)                                             |
| 7  | t_sq     | time trend squared (t x t)                                         |
| 8  | whc      | area weighted soil water holding capacity (cm/cm3)                 |
| 9  | om       | organic matter (%)                                                 |
| 10 | kffactor | soil erosion K-factor                                              |
| 11 | spH      | soil pH                                                            |
| 12 | gdd8to32 | growing degree days (GDDs) for 8 deg C ~ 32 deg C                  |
| 13 | gdd34    | extreem growing degree days (GDDs) for 34 deg C or above           |
| 14 | gdd34rt  | sqaure root of gdd34                                               |
| 15 - 22  | xit1 - xit8 | 8th order Chebyshev polynomials                           |
| 23 | yit      | log(corn + 1)                                                      |
| 24 | gdd8to32_sq | gdd8to32 sqaured (gdd8to32 x gdd8to32)                          |
| 25 - 37 | wgdd8to32 - wxit8 | spatially lagged X variables                         |
