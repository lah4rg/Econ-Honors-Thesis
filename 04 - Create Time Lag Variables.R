#===============================================================================
# Program   :  04 - Create Time Lag Variables
# Date      :  September 9, 2023
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

# 2.1 Load in permanent RDS file
Master_Dataset <- readRDS("Master_Dataset")

#-------------------------------------------------------------------------------
# 3. Create lag variables
#-------------------------------------------------------------------------------

# 3.1 Create one-year lag variables for Q.from.World...2, Q.from.Brazil...3, and Q.from.US...4
Master_Dataset_Lag1 <- Master_Dataset %>%
  dplyr::mutate(Q.from.World...2_Lag1 = dplyr::lag(Q.from.World...2, n=1)) %>%
  dplyr::mutate(Q.from.Brazil...3_Lag1 = dplyr::lag(Q.from.Brazil...3, n=1)) %>%
  dplyr::mutate(Q.from.USA...4_Lag1 = dplyr::lag(Q.from.USA...4, n=1))

# 3.2 Create two-year lag variables for Q.from.World...2, Q.from.Brazil...3, and Q.from.US...4
Master_Dataset_Lag2 <- Master_Dataset %>%
  dplyr::mutate(Q.from.World...2_Lag2 = dplyr::lag(Q.from.World...2, n=2)) %>%
  dplyr::mutate(Q.from.Brazil...3_Lag2 = dplyr::lag(Q.from.Brazil...3, n=2)) %>%
  dplyr::mutate(Q.from.USA...4_Lag2 = dplyr::lag(Q.from.USA...4, n=2))

#-------------------------------------------------------------------------------
# 4. Remove empty years in Master_Dataset_Lag1 and Master_Dataset_Lag2 and nonlagged trade flows
#-------------------------------------------------------------------------------

# 4.1 Remove NA observations in Master_Dataset_Lag1
Master_Dataset_Lag1 <- na.omit(Master_Dataset_Lag1)

# 4.2 Remove NA observations in Master_Dataset_Lag2
Master_Dataset_Lag2 <- na.omit(Master_Dataset_Lag2)

# 4.3 Remove non-lagged trade flows in Master_Dataset_Lag1
Master_Dataset_Lag1 <- Master_Dataset_Lag1[-c(2:4)]

# 4.4 Remove non-lagged trade flows in Master_Dataset_Lag2
Master_Dataset_Lag2 <- Master_Dataset_Lag2[-c(2:4)]

#-------------------------------------------------------------------------------
# 5. Save Master_Dataset_Lag1 and Master_Dataset_Lag2 in a permanent RDS and Excel format
#-------------------------------------------------------------------------------

# 5.1 Save Master_Dataset_Lag1 as RDS file
write_rds(Master_Dataset_Lag1, "Master_Dataset_Lag1", compress = "gz")

# 5.2 Save Master_Dataset_Lag1 as Excel
write_xlsx(Master_Dataset_Lag1,"Master_Dataset_Lag1.xlsx")

# 5.3 Save Master_Dataset_Lag2 as RDS file
write_rds(Master_Dataset_Lag2, "Master_Dataset_Lag2", compress = "gz")

# 5.4 Save Master_Dataset_Lag2 as Excel
write_xlsx(Master_Dataset_Lag2,"Master_Dataset_Lag2.xlsx")

#-------------------------------------------------------------------------------
# 6. Remove extra data
#-------------------------------------------------------------------------------

# 6.1 Fully clean work space
rm(Master_Dataset, Master_Dataset_Lag1, Master_Dataset_Lag2)
gc()

### END PROGRAM ###