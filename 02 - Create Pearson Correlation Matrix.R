#===============================================================================
# Program   :  02 - Create Pearson Correlation Matrix
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

# 1.2 Set working directory
setwd("C:/Users/4luca/OneDrive - University of Missouri/Coursework/2023 - 2024/Fall 2023/ECONOM 4995H/Data/Econ Honors Thesis")

#-------------------------------------------------------------------------------
# 2. Load Master_Dataset
#-------------------------------------------------------------------------------

# 2.1 Load in permanent RDS file
Master_Dataset <- readRDS("Master_Dataset")

#-------------------------------------------------------------------------------
# 3. Create Pearson_correlation_Matrix
#-------------------------------------------------------------------------------

# 3.1 Create Pearson_Correlation_Matrix
Pearson_Correlation_Matrix <- round(cor(Master_Dataset),
      digits = 2)

# 3.2 Convert Pearson_Correlation_Matrix into dataframe
Pearson_Correlation_Matrix <- data.frame(Pearson_Correlation_Matrix)

#-------------------------------------------------------------------------------
# 4. Save Pearson_Correlation_Matrix in a permanent RDS and Excel format
#-------------------------------------------------------------------------------

# 4.1 Save Pearson_Correlation_Matrix as RDS file
write_rds(Pearson_Correlation_Matrix, "Pearson_Correlation_Matrix", compress = "gz")

# 4.2 Save Pearson_Correlation_Matrix as Excel
write_xlsx(Pearson_Correlation_Matrix,"Pearson_Correlation_Matrix.xlsx")

#-------------------------------------------------------------------------------
# 5. Remove extra data
#-------------------------------------------------------------------------------

# 5.1 Fully clean work space
rm(Pearson_Correlation_Matrix, Master_Dataset)
gc()

### END PROGRAM ###