#===============================================================================
# Program   :  01 - Run Summary Statistics on Master_Dataset
# Date      :  September 8, 2023
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
library(readr)

# 1.2 Set working directory
setwd("C:/Users/4luca/OneDrive - University of Missouri/Coursework/2023 - 2024/Fall 2023/ECONOM 4995H/Data/Econ Honors Thesis")

#-------------------------------------------------------------------------------
# 2. Load Master_Dataset
#-------------------------------------------------------------------------------

# 2.1 Load in permanent RDS file
Master_Dataset <- readRDS("Master_Dataset")

#-------------------------------------------------------------------------------
# 3. Create Summary_Statistics_Master_Dataset
#-------------------------------------------------------------------------------

# 3.1 Create summary file with values
Summary_Statistics_Master_Dataset <- summary(Master_Dataset)

# 3.2 Convert file with summary statistics values into a dataframe
Summary_Statistics_Master_Dataset <- data.frame(Summary_Statistics_Master_Dataset)

# 3.3 Remove empty first column
Summary_Statistics_Master_Dataset <- Summary_Statistics_Master_Dataset[-c(1)]

# 3.4 Remove empty rows
Summary_Statistics_Master_Dataset <- Summary_Statistics_Master_Dataset %>%
  filter(!row_number() %in% c(7,14,21,28))

#-------------------------------------------------------------------------------
# 4. Save Summary_Statistics_Dataset in a permanent Excel format
#-------------------------------------------------------------------------------

# 4.1 Save Summary_Statistics_Dataset in Excel format
write_xlsx(Summary_Statistics_Master_Dataset, "Summary_Statistics_Master_Dataset.xlsx")

#-------------------------------------------------------------------------------
# 5. Save Summary_Statistics_Dataset in a permanent RDS format
#-------------------------------------------------------------------------------

# 5.1 Save Summary_Statistics_Dataset in RDS format
write_rds(Summary_Statistics_Master_Dataset, "Summary_Statistics_Master_Dataset", compress = "gz")

#-------------------------------------------------------------------------------
# 6. Remove extra data
#-------------------------------------------------------------------------------

# 6.1 Fully clean work space
rm(Summary_Statistics_Master_Dataset, Master_Dataset)
gc()

### END PROGRAM ###