#===============================================================================
# Program   :  06 - Create Time Variable and Run Multi-Variable Regressions
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
# 2. Load Master_Dataset
#-------------------------------------------------------------------------------

# 2.1 Load in permanent RDS files
Master_Dataset <- readRDS("Master_Dataset")
Master_Dataset_Lag1 <- readRDS("Master_Dataset_Lag1")
Master_Dataset_Lag2 <- readRDS("Master_Dataset_Lag2")

#-------------------------------------------------------------------------------
# 3. Create time variable
#-------------------------------------------------------------------------------

# 3.1 Create time variable where observation in 1995 = 1
Master_Dataset <- Master_Dataset %>%
  dplyr::mutate(Time_Period = dplyr::row_number(RefYear...1))
Master_Dataset_Lag1 <- Master_Dataset_Lag1 %>%
  dplyr::mutate(Time_Period = dplyr::row_number(RefYear...1))
Master_Dataset_Lag2 <- Master_Dataset_Lag2 %>%
  dplyr::mutate(Time_Period = dplyr::row_number(RefYear...1))

#-------------------------------------------------------------------------------
# 4. Run multi-variable regressions for all relationships with Time_Period variable
#-------------------------------------------------------------------------------

# 4.1 Run regression and create list for BC.Total.DV_Lag1_Time_Period_Q.from.World...2 relationship
lm_BC.Total.DV_Lag1_Time_Period_Q.from.World...2 <- lm(Q.from.World...2 ~ BC.Total.DV_Lag1 + Time_Period, data = Master_Dataset_Lag1)

# 4.2 Run regression and create list for BC.Total.DV_Lag1_Time_Period_Q.from.Brazil...3 relationship
lm_BC.Total.DV_Lag1_Time_Period_Q.from.Brazil...3 <- lm(Q.from.Brazil...3 ~ BC.Total.DV_Lag1 + Time_Period, data = Master_Dataset_Lag1)

# 4.3 Run regression and create list for BC.Total.DV_Lag1_Time_Period_Q.from.USA...4 relationship
lm_BC.Total.DV_Lag1_Time_Period_Q.from.USA...4 <- lm(Q.from.USA...4 ~ BC.Total.DV_Lag1 + Time_Period, data = Master_Dataset_Lag1)

# 4.4 Run regression and create list for UC.Total.DV_Lag1_Time_Period_Q.from.World...2 relationship
lm_UC.Total.DV_Lag1_Time_Period_Q.from.World...2 <- lm(Q.from.World...2 ~ UC.Total.DV_Lag1 + Time_Period, data = Master_Dataset_Lag1)

# 4.5 Run regression and create list for UC.Total.DV_Lag1_Time_Period_Q.from.Brazil...3 relationship
lm_UC.Total.DV_Lag1_Time_Period_Q.from.Brazil...3 <- lm(Q.from.Brazil...3 ~ UC.Total.DV_Lag1 + Time_Period, data = Master_Dataset_Lag1)

# 4.6 Run regression and create list for UC.Total.DV_Lag1_Time_Period_Q.from.USA...4 relationship
lm_UC.Total.DV_Lag1_Time_Period_Q.from.USA...4 <- lm(Q.from.USA...4 ~ UC.Total.DV_Lag1 + Time_Period, data = Master_Dataset_Lag1)

# 4.7 Run regression and create list for BC.Total.DV_Lag2_Time_Period_Q.from.World...2 relationship
lm_BC.Total.DV_Lag2_Time_Period_Q.from.World...2 <- lm(Q.from.World...2 ~ BC.Total.DV_Lag2 + Time_Period, data = Master_Dataset_Lag2)

# 4.8 Run regression and create list for BC.Total.DV_Lag2_Time_Period_Q.from.Brazil...3 relationship
lm_BC.Total.DV_Lag2_Time_Period_Q.from.Brazil...3 <- lm(Q.from.Brazil...3 ~ BC.Total.DV_Lag2 + Time_Period, data = Master_Dataset_Lag2)

# 4.9 Run regression and create list for BC.Total.DV_Lag2_Time_Period_Q.from.USA...4 relationship
lm_BC.Total.DV_Lag2_Time_Period_Q.from.USA...4 <- lm(Q.from.USA...4 ~ BC.Total.DV_Lag2 + Time_Period, data = Master_Dataset_Lag2)

# 4.10 Run regression and create list for UC.Total.DV_Lag2_Time_Period_Q.from.World...2 relationship
lm_UC.Total.DV_Lag2_Time_Period_Q.from.World...2 <- lm(Q.from.World...2 ~ UC.Total.DV_Lag2 + Time_Period, data = Master_Dataset_Lag2)

# 4.11 Run regression and create list for UC.Total.DV_Lag2_Time_Period_Q.from.Brazil...3 relationship
lm_UC.Total.DV_Lag2_Time_Period_Q.from.Brazil...3 <- lm(Q.from.Brazil...3 ~ UC.Total.DV_Lag2 + Time_Period, data = Master_Dataset_Lag2)

# 4.12 Run regression and create list for UC.Total.DV_Lag2_Time_Period_Q.from.USA...4 relationship
lm_UC.Total.DV_Lag2_Time_Period_Q.from.USA...4 <- lm(Q.from.USA...4 ~ UC.Total.DV_Lag2 + Time_Period, data = Master_Dataset_Lag2)

# 4.13 Run regression and create list for BC.Total.DV_Time_Period_Q.from.World...2 relationship
lm_BC.Total.DV_Time_Period_Q.from.World...2 <- lm(Q.from.World...2 ~ BC.Total.DV + Time_Period, data = Master_Dataset)

# 4.14 Run regression and create list for BC.Total.DV_Time_Period_Q.from.Brazil...3 relationship
lm_BC.Total.DV_Time_Period_Q.from.Brazil...3 <- lm(Q.from.Brazil...3 ~ BC.Total.DV + Time_Period, data = Master_Dataset)

# 4.15 Run regression and create list for BC.Total.DV_Time_Period_Q.from.USA...4 relationship
lm_BC.Total.DV_Time_Period_Q.from.USA...4 <- lm(Q.from.USA...4 ~ BC.Total.DV + Time_Period, data = Master_Dataset)

# 4.16 Run regression and create list for UC.Total.DV_Time_Period_Q.from.World...2 relationship
lm_UC.Total.DV_Time_Period_Q.from.World...2 <- lm(Q.from.World...2 ~ UC.Total.DV + Time_Period, data = Master_Dataset)

# 4.17 Run regression and create list for UC.Total.DV_Time_Period_Q.from.Brazil...3 relationship
lm_UC.Total.DV_Time_Period_Q.from.Brazil...3 <- lm(Q.from.Brazil...3 ~ UC.Total.DV + Time_Period, data = Master_Dataset)

# 4.18 Run regression and create list for UC.Total.DV_Time_Period_Q.from.USA...4 relationship
lm_UC.Total.DV_Time_Period_Q.from.USA...4 <- lm(Q.from.USA...4 ~ UC.Total.DV + Time_Period, data = Master_Dataset)

#-------------------------------------------------------------------------------
# 5. Export regression outputs into text files
#-------------------------------------------------------------------------------

# 5.1 Export regression output list for lm_BC.Total.DV_Lag1_Time_Period_Q.from.World...2 relationship
stargazer(lm_BC.Total.DV_Lag1_Time_Period_Q.from.World...2, title = "lm_BC.Total.DV_Lag1_Time_Period_Q.from.World...2", type = "text", out = "lm_BC.Total.DV_Lag1_Time_Period_Q.from.World...2.text")

# 5.2 Export regression output list for lm_BC.Total.DV_Lag1_Time_Period_Q.from.Brazil...3 relationship
stargazer(lm_BC.Total.DV_Lag1_Time_Period_Q.from.Brazil...3, title = "lm_BC.Total.DV_Lag1_Time_Period_Q.from.Brazil...3", type = "text", out = "lm_BC.Total.DV_Lag1_Time_Period_Q.from.Brazil...3.text")

# 5.3 Export regression output list for lm_BC.Total.DV_Lag1_Time_Period_Q.from.USA...4 relationship
stargazer(lm_BC.Total.DV_Lag1_Time_Period_Q.from.USA...4, title = "lm_BC.Total.DV_Lag1_Time_Period_Q.from.USA...4", type = "text", out = "lm_BC.Total.DV_Lag1_Time_Period_Q.from.USA...4.text")

# 5.4 Export regression output list for lm_UC.Total.DV_Lag1_Time_Period_Q.from.World...2 relationship
stargazer(lm_UC.Total.DV_Lag1_Time_Period_Q.from.World...2, title = "lm_UC.Total.DV_Lag1_Time_Period_Q.from.World...2", type = "text", out = "lm_UC.Total.DV_Lag1_Time_Period_Q.from.World...2.text")

# 5.5 Export regression output list for lm_UC.Total.DV_Lag1_Time_Period_Q.from.Brazil...3 relationship
stargazer(lm_UC.Total.DV_Lag1_Time_Period_Q.from.Brazil...3, title = "lm_UC.Total.DV_Lag1_Time_Period_Q.from.Brazil...3", type = "text", out = "lm_UC.Total.DV_Lag1_Time_Period_Q.from.Brazil...3.text")

# 5.6 Export regression output list for lm_UC.Total.DV_Lag1_Time_Period_Q.from.USA...4 relationship
stargazer(lm_UC.Total.DV_Lag1_Time_Period_Q.from.USA...4, title = "lm_UC.Total.DV_Lag1_Time_Period_Q.from.USA...4", type = "text", out = "lm_UC.Total.DV_Lag1_Time_Period_Q.from.USA...4.text")

# 5.7 Export regression output list for lm_BC.Total.DV_Lag2_Time_Period_Q.from.World...2 relationship
stargazer(lm_BC.Total.DV_Lag2_Time_Period_Q.from.World...2, title = "lm_BC.Total.DV_Lag2_Time_Period_Q.from.World...2", type = "text", out = "lm_BC.Total.DV_Lag2_Time_Period_Q.from.World...2.text")

# 5.8 Export regression output list for lm_BC.Total.DV_Lag2_Time_Period_Q.from.Brazil...3 relationship
stargazer(lm_BC.Total.DV_Lag2_Time_Period_Q.from.Brazil...3, title = "lm_BC.Total.DV_Lag2_Time_Period_Q.from.Brazil...3", type = "text", out = "lm_BC.Total.DV_Lag2_Time_Period_Q.from.Brazil...3.text")

# 5.9 Export regression output list for lm_BC.Total.DV_Lag2_Time_Period_Q.from.USA...4 relationship
stargazer(lm_BC.Total.DV_Lag2_Time_Period_Q.from.USA...4, title = "lm_BC.Total.DV_Lag2_Time_Period_Q.from.USA...4", type = "text", out = "lm_BC.Total.DV_Lag2_Time_Period_Q.from.USA...4.text")

# 5.10 Export regression output list for lm_UC.Total.DV_Lag2_Time_Period_Q.from.World...2 relationship
stargazer(lm_UC.Total.DV_Lag2_Time_Period_Q.from.World...2, title = "lm_UC.Total.DV_Lag2_Time_Period_Q.from.World...2", type = "text", out = "lm_UC.Total.DV_Lag2_Time_Period_Q.from.World...2.text")

# 5.11 Export regression output list for lm_UC.Total.DV_Lag2_Time_Period_Q.from.Brazil...3 relationship
stargazer(lm_UC.Total.DV_Lag2_Time_Period_Q.from.Brazil...3, title = "lm_UC.Total.DV_Lag2_Time_Period_Q.from.Brazil...3", type = "text", out = "lm_UC.Total.DV_Lag2_Time_Period_Q.from.Brazil...3.text")

# 5.12 Export regression output list for lm_UC.Total.DV_Lag2_Time_Period_Q.from.USA...4 relationship
stargazer(lm_UC.Total.DV_Lag2_Time_Period_Q.from.USA...4, title = "lm_UC.Total.DV_Lag2_Time_Period_Q.from.USA...4", type = "text", out = "lm_UC.Total.DV_Lag2_Time_Period_Q.from.USA...4.text")

# 5.13 Export regression output list for lm_BC.Total.DV_Time_Period_Q.from.World...2 relationship
stargazer(lm_BC.Total.DV_Time_Period_Q.from.World...2, title = "lm_BC.Total.DV_Time_Period_Q.from.World...2", type = "text", out = "lm_BC.Total.DV_Time_Period_Q.from.World...2.text")

# 5.14 Export regression output list for lm_BC.Total.DV_Time_Period_Q.from.Brazil...3 relationship
stargazer(lm_BC.Total.DV_Time_Period_Q.from.Brazil...3, title = "lm_BC.Total.DV_Time_Period_Q.from.Brazil...3", type = "text", out = "lm_BC.Total.DV_Time_Period_Q.from.Brazil...3.text")

# 5.15 Export regression output list for lm_BC.Total.DV_Time_Period_Q.from.USA...4 relationship
stargazer(lm_BC.Total.DV_Time_Period_Q.from.USA...4, title = "lm_BC.Total.DV_Time_Period_Q.from.USA...4", type = "text", out = "lm_BC.Total.DV_Time_Period_Q.from.USA...4.text")

# 5.16 Export regression output list for lm_UC.Total.DV_Time_Period_Q.from.World...2 relationship
stargazer(lm_UC.Total.DV_Time_Period_Q.from.World...2, title = "lm_UC.Total.DV_Time_Period_Q.from.World...2", type = "text", out = "lm_UC.Total.DV_Time_Period_Q.from.World...2.text")

# 5.17 Export regression output list for lm_UC.Total.DV_Time_Period_Q.from.Brazil...3 relationship
stargazer(lm_UC.Total.DV_Time_Period_Q.from.Brazil...3, title = "lm_UC.Total.DV_Time_Period_Q.from.Brazil...3", type = "text", out = "lm_UC.Total.DV_Time_Period_Q.from.Brazil...3.text")

# 5.18 Export regression output list for lm_UC.Total.DV_Time_Period_Q.from.USA...4 relationship
stargazer(lm_UC.Total.DV_Time_Period_Q.from.USA...4, title = "lm_UC.Total.DV_Time_Period_Q.from.USA...4", type = "text", out = "lm_UC.Total.DV_Time_Period_Q.from.USA...4.text")

#-------------------------------------------------------------------------------
# 6. Save Master_Dataset, Master_Dataset_Lag1, Master_Dataset_Lag2 in a permanent RDS and Excel format
#-------------------------------------------------------------------------------

# 6.1 Save Master_Dataset as RDS file
write_rds(Master_Dataset, "Master_Dataset", compress = "gz")

# 6.2 Save Master_Dataset as Excel
write_xlsx(Master_Dataset,"Master_Dataset.xlsx")

# 6.3 Save Master_Dataset_Lag1 as RDS file
write_rds(Master_Dataset_Lag1, "Master_Dataset_Lag1", compress = "gz")

# 6.4 Save Master_Dataset_Lag1 as Excel
write_xlsx(Master_Dataset_Lag1,"Master_Dataset_Lag1.xlsx")

# 6.5 Save Master_Dataset_Lag2 as RDS file
write_rds(Master_Dataset_Lag2, "Master_Dataset_Lag2", compress = "gz")

# 6.6 Save Master_Dataset_Lag2 as Excel
write_xlsx(Master_Dataset_Lag2,"Master_Dataset_Lag2.xlsx")

#-------------------------------------------------------------------------------
# 7. Remove extra data
#-------------------------------------------------------------------------------

# 7.1 Fully clean work space
rm(Master_Dataset_Lag1,lm_BC.Total.DV_Lag1_Time_Period_Q.from.World...2, lm_BC.Total.DV_Lag1_Time_Period_Q.from.Brazil...3, lm_BC.Total.DV_Lag1_Time_Period_Q.from.USA...4, lm_UC.Total.DV_Lag1_Time_Period_Q.from.World...2, lm_UC.Total.DV_Lag1_Time_Period_Q.from.Brazil...3, lm_UC.Total.DV_Lag1_Time_Period_Q.from.USA...4)
rm(Master_Dataset_Lag2,lm_BC.Total.DV_Lag2_Time_Period_Q.from.World...2, lm_BC.Total.DV_Lag2_Time_Period_Q.from.Brazil...3, lm_BC.Total.DV_Lag2_Time_Period_Q.from.USA...4, lm_UC.Total.DV_Lag2_Time_Period_Q.from.World...2, lm_UC.Total.DV_Lag2_Time_Period_Q.from.Brazil...3, lm_UC.Total.DV_Lag2_Time_Period_Q.from.USA...4)
rm(Master_Dataset,lm_BC.Total.DV_Time_Period_Q.from.World...2, lm_BC.Total.DV_Time_Period_Q.from.Brazil...3, lm_BC.Total.DV_Time_Period_Q.from.USA...4, lm_UC.Total.DV_Time_Period_Q.from.World...2, lm_UC.Total.DV_Time_Period_Q.from.Brazil...3, lm_UC.Total.DV_Time_Period_Q.from.USA...4)
gc()

### END PROGRAM ###