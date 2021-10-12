######################################################################################
## R code for the major results in Yun and Gramig's JAAE Article
## Spatial Panel Models of Crop Yield Response to Weather:
## Econometric Specification Strategies and Prediction Performances
## Replication of Table 3 and Table S2
## Written by Seong Yun (seong.yun@msstate.edu)
## Updated: Oct. 11. 2021
######################################################################################
library(plm)
library(splm)
library(spatialreg)
rm(list=ls())

## Laod the regression data from GitHub Repository
load(url("https://raw.github.com/ysd2004/spatialcropyieldJAAE/main/regdata.rda"))

## Make the data as pdata.frame
pdata <- pdata.frame(regdata,c("stco","year"))

## Replication of Table S2.
## Eq.(3) Pooled
fm3 <- yit ~ gdd8to32 + gdd8to32_sq + gdd34rt + ppt + ppt_sq + t + t_sq 

m3res <- plm(fm3, data=pdata, model="pooling")
summary(m3res)

## Eq.(4) FE
fm4 <- yit ~ gdd8to32 + gdd8to32_sq + gdd34rt + ppt + ppt_sq + t + t_sq -1

m4res <- plm(fm4, data=pdata, model="within", effect="individual")
summary(m4res)

## Eq.(5) RE
fm5 <- yit ~ gdd8to32 + gdd8to32_sq + gdd34rt + ppt + ppt_sq + 
             whc + kffactor + om + spH + t + t_sq -1

m5res <- spml(fm5, data=pdata, listw = ww6, model="random",
              effect = "individual", spatial.error="none", lag = F)
summary(m5res)

## Eq.(7) SEM
fm7 <- yit ~ gdd8to32 + gdd8to32_sq + gdd34rt + ppt + ppt_sq + t + t_sq -1
m7res <- spml(fm7, data=pdata, listw = ww6, model="within",
                  effect = "individual", spatial.error="b", lag = F)
summary(m7res)

## Eq.(8) KKP: this takes long to run!!
fm8 <- yit ~ gdd8to32 + gdd8to32_sq + gdd34rt + ppt + ppt_sq + 
             whc + kffactor + om + spH + t + t_sq -1
m8res <- spml(fm8, data=pdata, listw = ww6, model="random",
              effect = "individual", spatial.error="kkp", lag = F) 
summary(m8res)

## Eq.(9) SLX
fm9 <- yit ~ gdd8to32 + gdd8to32_sq + gdd34rt + ppt + ppt_sq + 
  wgdd8to32 + wgdd8to32_sq + wgdd34rt + wppt + wppt_sq +
  t + t_sq -1

m9res <- plm(fm9, data=pdata, model="within", effect="individual")
summary(m9res)

## Eq. (10) SAR
fm10 <- yit ~ gdd8to32 + gdd8to32_sq + gdd34rt + ppt + ppt_sq + t + t_sq -1
m10res <- spml(fm10, data=pdata, listw = ww6, model="within",
              effect = "individual", spatial.error="none", lag = T)
summary(m10res)

