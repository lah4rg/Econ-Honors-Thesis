#===============================================================================
# Program   :  07 - Create Difference Variables and Run Regressions with Difference Variables
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
# 3. Create difference variables
#-------------------------------------------------------------------------------

# 3.1 Create difference variable subtracting Q.from.USA...4 from Q.from.Brazil...3
Master_Dataset <- Master_Dataset %>%
  dplyr::mutate(Q.Diff = Q.from.Brazil...3 - Q.from.USA...4)
Master_Dataset_Lag1 <- Master_Dataset_Lag1 %>%
  dplyr::mutate(Q.Diff = Q.from.Brazil...3 - Q.from.USA...4)
Master_Dataset_Lag2 <- Master_Dataset_Lag2 %>%
  dplyr::mutate(Q.Diff = Q.from.Brazil...3 - Q.from.USA...4)

# 3.2 Create difference variable subtracting UC.Total.DV from BC.Total.DV
Master_Dataset <- Master_Dataset %>%
  dplyr::mutate(Total.DV.Diff = BC.Total.DV - UC.Total.DV)
Master_Dataset_Lag1 <- Master_Dataset_Lag1 %>%
  dplyr::mutate(Total.DV.Diff_Lag1 = BC.Total.DV_Lag1 - UC.Total.DV_Lag1)
Master_Dataset_Lag2 <- Master_Dataset_Lag2 %>%
  dplyr::mutate(Total.DV.Diff_Lag2 = BC.Total.DV_Lag2 - UC.Total.DV_Lag2)

#-------------------------------------------------------------------------------
# 4. Create line plots for difference variables through time
#-------------------------------------------------------------------------------

# 4.1 Create line plot Q.Diff variable
png(file = "Q.Diff_RefYear...1_LinePlot.jpg")
plot(Master_Dataset$RefYear...1, Master_Dataset$Q.Diff, type = "o")
dev.off()

# 4.2 Create line plot Total.DV.Diff variable
png(file = "Total.DV.Diff_RefYear...1_LinePlot.jpg")
plot(Master_Dataset$RefYear...1, Master_Dataset$Total.DV.Diff, type = "o")
dev.off()

# 4.3 Create line plot Total.DV.Diff_Lag1 variable
png(file = "Total.DV.Diff_Lag1_RefYear...1_LinePlot.jpg")
plot(Master_Dataset_Lag1$RefYear...1, Master_Dataset_Lag1$Q.Diff, type = "o")
dev.off()

# 4.4 Create line plot Total.DV.Diff_Lag2 variable
png(file = "Total.DV.Diff_Lag2_RefYear...1_LinePlot.jpg")
plot(Master_Dataset_Lag2$RefYear...1, Master_Dataset_Lag2$Q.Diff, type = "o")
dev.off()

#-------------------------------------------------------------------------------
# 5. Run multi-variable regressions for all relationships with and without Time_Period variable
#-------------------------------------------------------------------------------

# 5.1 Run regression and create list for Total.DV.Diff_Time_Period_Q.Diff relationship
lm_Total.DV.Diff_Time_Period_Q.Diff <- lm(Q.Diff ~ Total.DV.Diff + Time_Period, data = Master_Dataset)

# 5.2 Run regression and create list for Total.DV.Diff_Lag1_Time_Period_Q.Diff relationship
lm_Total.DV.Diff_Lag1_Time_Period_Q.Diff <- lm(Q.Diff ~ Total.DV.Diff_Lag1 + Time_Period, data = Master_Dataset_Lag1)

# 5.3 Run regression and create list for Total.DV.Diff_Lag2_Time_Period_Q.Diff relationship
lm_Total.DV.Diff_Lag2_Time_Period_Q.Diff <- lm(Q.Diff ~ Total.DV.Diff_Lag2 + Time_Period, data = Master_Dataset_Lag2)

# 5.4 Run regression and create list for Total.DV.Diff_Q.Diff relationship
lm_Total.DV.Diff_Q.Diff <- lm(Q.Diff ~ Total.DV.Diff, data = Master_Dataset)

# 5.5 Run regression and create list for Total.DV.Diff_Lag1_Q.Diff relationship
lm_Total.DV.Diff_Lag1_Q.Diff <- lm(Q.Diff ~ Total.DV.Diff_Lag1, data = Master_Dataset_Lag1)

# 5.6 Run regression and create list for Total.DV.Diff_Lag2_Q.Diff relationship
lm_Total.DV.Diff_Lag2_Q.Diff <- lm(Q.Diff ~ Total.DV.Diff_Lag2, data = Master_Dataset_Lag2)

#-------------------------------------------------------------------------------
# 6. Export regression outputs into text files
#-------------------------------------------------------------------------------

# 6.1 Export regression output list for lm_Total.DV.Diff_Time_Period_Q.Diff relationship
stargazer(lm_Total.DV.Diff_Time_Period_Q.Diff, title = "lm_Total.DV.Diff_Time_Period_Q.Diff", type = "text", out = "lm_Total.DV.Diff_Time_Period_Q.Diff.text")

# 6.2 Export regression output list for lm_Total.DV.Diff_Time_Period_Lag1_Q.Diff relationship
stargazer(lm_Total.DV.Diff_Lag1_Time_Period_Q.Diff, title = "lm_Total.DV.Diff_Lag1_Time_Period_Q.Diff", type = "text", out = "lm_Total.DV.Diff_Lag1_Time_Period_Q.Diff.text")

# 6.3 Export regression output list for lm_Total.DV.Diff_Time_Period_Lag2_Q.Diff relationship
stargazer(lm_Total.DV.Diff_Lag2_Time_Period_Q.Diff, title = "lm_Total.DV.Diff_Lag2_Time_Period_Q.Diff", type = "text", out = "lm_Total.DV.Diff_Lag2_Time_Period_Q.Diff.text")

# 6.4 Export regression output list for lm_Total.DV.Diff_Q.Diff relationship
stargazer(lm_Total.DV.Diff_Q.Diff, title = "lm_Total.DV.Diff_Q.Diff", type = "text", out = "lm_Total.DV.Diff_Q.Diff.text")

# 6.5 Export regression output list for lm_Total.DV.Diff_Lag1_Q.Diff relationship
stargazer(lm_Total.DV.Diff_Lag1_Q.Diff, title = "lm_Total.DV.Diff_Lag1_Q.Diff", type = "text", out = "lm_Total.DV.Diff_Lag1_Q.Diff.text")

# 6.6 Export regression output list for lm_Total.DV.Diff_Lag2_Q.Diff relationship
stargazer(lm_Total.DV.Diff_Lag2_Q.Diff, title = "lm_Total.DV.Diff_Lag2_Q.Diff", type = "text", out = "lm_Total.DV.Diff_Lag2_Q.Diff.text")

#-------------------------------------------------------------------------------
# 7. Save Master_Dataset, Master_Dataset_Lag1, Master_Dataset_Lag2 in a permanent RDS and Excel format
#-------------------------------------------------------------------------------

# 7.1 Save Master_Dataset as RDS file
write_rds(Master_Dataset, "Master_Dataset", compress = "gz")

# 7.2 Save Master_Dataset as Excel
write_xlsx(Master_Dataset,"Master_Dataset.xlsx")

# 7.3 Save Master_Dataset_Lag1 as RDS file
write_rds(Master_Dataset_Lag1, "Master_Dataset_Lag1", compress = "gz")

# 7.4 Save Master_Dataset_Lag1 as Excel
write_xlsx(Master_Dataset_Lag1,"Master_Dataset_Lag1.xlsx")

# 7.5 Save Master_Dataset_Lag2 as RDS file
write_rds(Master_Dataset_Lag2, "Master_Dataset_Lag2", compress = "gz")

# 7.6 Save Master_Dataset_Lag2 as Excel
write_xlsx(Master_Dataset_Lag2,"Master_Dataset_Lag2.xlsx")

#-------------------------------------------------------------------------------
# 8. Remove extra data
#-------------------------------------------------------------------------------

# 8.1 Fully clean work space
rm(Master_Dataset, Master_Dataset_Lag1, Master_Dataset_Lag2)
rm(lm_Total.DV.Diff_Lag1_Time_Period_Q.Diff, lm_Total.DV.Diff_Lag2_Time_Period_Q.Diff,lm_Total.DV.Diff_Time_Period_Q.Diff, lm_Total.DV.Diff_Lag1_Q.Diff, lm_Total.DV.Diff_Lag2_Q.Diff, lm_Total.DV.Diff_Q.Diff)
gc()

### END PROGRAM ###