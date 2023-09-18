#===============================================================================
# Program   :  05 - Run Regressions for Lagged Variables
# Date      :  September 18, 2023
# Project   :  Econ Honors Thesis
# Author    :  Lucas Hayes
#===============================================================================

#-------------------------------------------------------------------------------
# 1. Set up packages and working directory 
#-------------------------------------------------------------------------------

# 1.1 Load packages
library(tidyverse)
library(dplyr)
library(openxlsx)
library(writexl)
library(ggplot2)
library(stargazer)

# 1.2 Set working directory
setwd("C:/Users/4luca/OneDrive - University of Missouri/Coursework/2023 - 2024/Fall 2023/ECONOM 4995H/Data/Econ Honors Thesis")

#-------------------------------------------------------------------------------
# 2. Load Master_Dataset_Lag1 and Master_Dataset_Lag2
#-------------------------------------------------------------------------------

# 2.1 Load in permanent RDS file for one-year lag
Master_Dataset_Lag1 <- readRDS("Master_Dataset_Lag1")

# 2.2 Load in permanent RDS file for two-year lag
Master_Dataset_Lag2 <- readRDS("Master_Dataset_Lag2")

#-------------------------------------------------------------------------------
# 3. Run regressions for all relationships
#-------------------------------------------------------------------------------

# 3.1 Run regression and create list for BC.Total.DV_Lag1_Q.from.World...2 relationship
lm_BC.Total.DV_Lag1_Q.from.World...2 <- lm(Q.from.World...2 ~ BC.Total.DV_Lag1, data = Master_Dataset_Lag1)

# 3.2 Run regression and create list for BC.Total.DV_Lag1_Q.from.Brazil...3 relationship
lm_BC.Total.DV_Lag1_Q.from.Brazil...3 <- lm(Q.from.Brazil...3 ~ BC.Total.DV_Lag1, data = Master_Dataset_Lag1)

# 3.3 Run regression and create list for BC.Total.DV_Lag1_Q.from.USA...4 relationship
lm_BC.Total.DV_Lag1_Q.from.USA...4 <- lm(Q.from.USA...4 ~ BC.Total.DV_Lag1, data = Master_Dataset_Lag1)

# 3.4 Run regression and create list for UC.Total.DV_Lag1_Q.from.World...2 relationship
lm_UC.Total.DV_Lag1_Q.from.World...2 <- lm(Q.from.World...2 ~ UC.Total.DV_Lag1, data = Master_Dataset_Lag1)

# 3.5 Run regression and create list for UC.Total.DV_Lag1_Q.from.Brazil...3 relationship
lm_UC.Total.DV_Lag1_Q.from.Brazil...3 <- lm(Q.from.Brazil...3 ~ UC.Total.DV_Lag1, data = Master_Dataset_Lag1)

# 3.6 Run regression and create list for UC.Total.DV_Lag1_Q.from.USA...4 relationship
lm_UC.Total.DV_Lag1_Q.from.USA...4 <- lm(Q.from.USA...4 ~ UC.Total.DV_Lag1, data = Master_Dataset_Lag1)

# 3.7 Run regression and create list for BC.Total.DV_Lag2_Q.from.World...2 relationship
lm_BC.Total.DV_Lag2_Q.from.World...2 <- lm(Q.from.World...2 ~ BC.Total.DV_Lag2, data = Master_Dataset_Lag2)

# 3.8 Run regression and create list for BC.Total.DV_Lag2_Q.from.Brazil...3 relationship
lm_BC.Total.DV_Lag2_Q.from.Brazil...3 <- lm(Q.from.Brazil...3 ~ BC.Total.DV_Lag2, data = Master_Dataset_Lag2)

# 3.9 Run regression and create list for BC.Total.DV_Lag2_Q.from.USA...4 relationship
lm_BC.Total.DV_Lag2_Q.from.USA...4 <- lm(Q.from.USA...4 ~ BC.Total.DV_Lag2, data = Master_Dataset_Lag2)

# 3.10 Run regression and create list for UC.Total.DV_Lag2_Q.from.World...2 relationship
lm_UC.Total.DV_Lag2_Q.from.World...2 <- lm(Q.from.World...2 ~ UC.Total.DV_Lag2, data = Master_Dataset_Lag2)

# 3.11 Run regression and create list for UC.Total.DV_Lag2_Q.from.Brazil...3 relationship
lm_UC.Total.DV_Lag2_Q.from.Brazil...3 <- lm(Q.from.Brazil...3 ~ UC.Total.DV_Lag2, data = Master_Dataset_Lag2)

# 3.12 Run regression and create list for UC.Total.DV_Lag2_Q.from.USA...4 relationship
lm_UC.Total.DV_Lag2_Q.from.USA...4 <- lm(Q.from.USA...4 ~ UC.Total.DV_Lag2, data = Master_Dataset_Lag2)

#-------------------------------------------------------------------------------
# 4. Export regression outputs into text files
#-------------------------------------------------------------------------------

# 4.1 Export regression output list for lm_BC.Total.DV_Lag1_Q.from.World...2 relationship
stargazer(lm_BC.Total.DV_Lag1_Q.from.World...2, title = "lm_BC.Total.DV_Lag1_Q.from.World...2", type = "text", out = "lm_BC.Total.DV_Lag1_Q.from.World...2.text")

# 4.2 Export regression output list for lm_BC.Total.DV_Lag1_Q.from.Brazil...3 relationship
stargazer(lm_BC.Total.DV_Lag1_Q.from.Brazil...3, title = "lm_BC.Total.DV_Lag1_Q.from.Brazil...3", type = "text", out = "lm_BC.Total.DV_Lag1_Q.from.Brazil...3.text")

# 4.3 Export regression output list for lm_BC.Total.DV_Lag1_Q.from.USA...4 relationship
stargazer(lm_BC.Total.DV_Lag1_Q.from.USA...4, title = "lm_BC.Total.DV_Lag1_Q.from.USA...4", type = "text", out = "lm_BC.Total.DV_Lag1_Q.from.USA...4.text")

# 4.4 Export regression output list for lm_UC.Total.DV_Lag1_Q.from.World...2 relationship
stargazer(lm_UC.Total.DV_Lag1_Q.from.World...2, title = "lm_UC.Total.DV_Lag1_Q.from.World...2", type = "text", out = "lm_UC.Total.DV_Lag1_Q.from.World...2.text")

# 4.5 Export regression output list for lm_UC.Total.DV_Lag1_Q.from.Brazil...3 relationship
stargazer(lm_UC.Total.DV_Lag1_Q.from.Brazil...3, title = "lm_UC.Total.DV_Lag1_Q.from.Brazil...3", type = "text", out = "lm_UC.Total.DV_Lag1_Q.from.Brazil...3.text")

# 4.6 Export regression output list for lm_UC.Total.DV_Lag1_Q.from.USA...4 relationship
stargazer(lm_UC.Total.DV_Lag1_Q.from.USA...4, title = "lm_UC.Total.DV_Lag1_Q.from.USA...4", type = "text", out = "lm_UC.Total.DV_Lag1_Q.from.USA...4.text")

# 4.7 Export regression output list for lm_BC.Total.DV_Lag2_Q.from.World...2 relationship
stargazer(lm_BC.Total.DV_Lag2_Q.from.World...2, title = "lm_BC.Total.DV_Lag2_Q.from.World...2", type = "text", out = "lm_BC.Total.DV_Lag2_Q.from.World...2.text")

# 4.8 Export regression output list for lm_BC.Total.DV_Lag2_Q.from.Brazil...3 relationship
stargazer(lm_BC.Total.DV_Lag2_Q.from.Brazil...3, title = "lm_BC.Total.DV_Lag2_Q.from.Brazil...3", type = "text", out = "lm_BC.Total.DV_Lag2_Q.from.Brazil...3.text")

# 4.9 Export regression output list for lm_BC.Total.DV_Lag2_Q.from.USA...4 relationship
stargazer(lm_BC.Total.DV_Lag2_Q.from.USA...4, title = "lm_BC.Total.DV_Lag2_Q.from.USA...4", type = "text", out = "lm_BC.Total.DV_Lag2_Q.from.USA...4.text")

# 4.10 Export regression output list for lm_UC.Total.DV_Lag2_Q.from.World...2 relationship
stargazer(lm_UC.Total.DV_Lag2_Q.from.World...2, title = "lm_UC.Total.DV_Lag2_Q.from.World...2", type = "text", out = "lm_UC.Total.DV_Lag2_Q.from.World...2.text")

# 4.11 Export regression output list for lm_UC.Total.DV_Lag2_Q.from.Brazil...3 relationship
stargazer(lm_UC.Total.DV_Lag2_Q.from.Brazil...3, title = "lm_UC.Total.DV_Lag2_Q.from.Brazil...3", type = "text", out = "lm_UC.Total.DV_Lag2_Q.from.Brazil...3.text")

# 4.12 Export regression output list for lm_UC.Total.DV_Lag2_Q.from.USA...4 relationship
stargazer(lm_UC.Total.DV_Lag2_Q.from.USA...4, title = "lm_UC.Total.DV_Lag2_Q.from.USA...4", type = "text", out = "lm_UC.Total.DV_Lag2_Q.from.USA...4.text")

#-------------------------------------------------------------------------------
# 5. Remove extra data
#-------------------------------------------------------------------------------

# 6.1 Fully clean work space
rm(Master_Dataset_Lag1,lm_BC.Total.DV_Lag1_Q.from.World...2, lm_BC.Total.DV_Lag1_Q.from.Brazil...3, lm_BC.Total.DV_Lag1_Q.from.USA...4, lm_UC.Total.DV_Lag1_Q.from.World...2, lm_UC.Total.DV_Lag1_Q.from.Brazil...3, lm_UC.Total.DV_Lag1_Q.from.USA...4)
rm(Master_Dataset_Lag2,lm_BC.Total.DV_Lag2_Q.from.World...2, lm_BC.Total.DV_Lag2_Q.from.Brazil...3, lm_BC.Total.DV_Lag2_Q.from.USA...4, lm_UC.Total.DV_Lag2_Q.from.World...2, lm_UC.Total.DV_Lag2_Q.from.Brazil...3, lm_UC.Total.DV_Lag2_Q.from.USA...4)
gc()

### END PROGRAM ###