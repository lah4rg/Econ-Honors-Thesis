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

# 3.2 Convert file with summary statistics values into a datafram
Summary_Statistics_Master_Dataset <- data.frame(Summary_Statistics_Master_Dataset)

# 3.3 Remove empty first column
Summary_Statistics_Master_Dataset <- Summary_Statistics_Master_Dataset[-c(1)]

# 3.4 Remove empty rows
Summary_Statistics_Master_Dataset <- Summary_Statistics_Master_Dataset %>%
  filter(!row_number() %in% c(7,14,21,28))

#-------------------------------------------------------------------------------
# 4. Create individual summary statistics for each variable
#-------------------------------------------------------------------------------

# 4.1 Create RefYear_Summary_Statistics_Dataset
RefYear_Summary_Statistics_Dataset <- Summary_Statistics_Master_Dataset %>%
  filter(row_number() %in% c(1:6))

# 4.2 Create Q_From_World_Summary_Statistics_Dataset
Q_From_World_Summary_Statistics_Dataset <- Summary_Statistics_Master_Dataset %>%
  filter(row_number() %in% c(7:12))

# 4.3 Create Q_From_Brazil_Summary_Statistics_Dataset
Q_From_Brazil_Summary_Statistics_Dataset <- Summary_Statistics_Master_Dataset %>%
  filter(row_number() %in% c(13:18))

# 4.4 Create Q_From_USA_Summary_Statistics_Dataset
Q_From_USA_Summary_Statistics_Dataset <- Summary_Statistics_Master_Dataset %>%
  filter(row_number() %in% c(19:24))

# 4.5 Create BC_DV_in_C_Summary_Statistics_Dataset
BC_DV_in_C_Summary_Statistics_Dataset <- Summary_Statistics_Master_Dataset %>%
  filter(row_number() %in% c(25:31))

# 4.6 Create BC_DV_in_B_Summary_Statistics_Dataset
BC_DV_in_B_Summary_Statistics_Dataset <- Summary_Statistics_Master_Dataset %>%
  filter(row_number() %in% c(32:38))

# 4.7 Create BC_DV_in_Other_Summary_Statistics_Dataset
BC_DV_in_Other_Summary_Statistics_Dataset <- Summary_Statistics_Master_Dataset %>%
  filter(row_number() %in% c(39:45))

# 4.8 Create BC_Total_DV_Summary_Statistics_Dataset
BC_Total_DV_Summary_Statistics_Dataset <- Summary_Statistics_Master_Dataset %>%
  filter(row_number() %in% c(46:52))

# 4.9 Create BC_DE_Summary_Statistics_Dataset
BC_DE_Summary_Statistics_Dataset <- Summary_Statistics_Master_Dataset %>%
  filter(row_number() %in% c(53:59))

# 4.10 Create BC_CDE_Summary_Statistics_Dataset
BC_CDE_Summary_Statistics_Dataset <- Summary_Statistics_Master_Dataset %>%
  filter(row_number() %in% c(60:66))

# 4.11 Create BU_DV_in_U_Summary_Statistics_Dataset
BU_DV_in_U_Summary_Statistics_Dataset <- Summary_Statistics_Master_Dataset %>%
  filter(row_number() %in% c(67:73))

# 4.12 Create BU_DV_in_B_Summary_Statistics_Dataset
BU_DV_in_B_Summary_Statistics_Dataset <- Summary_Statistics_Master_Dataset %>%
  filter(row_number() %in% c(74:80))

# 4.13 Create BU_DV_in_Other_Summary_Statistics_Dataset
BU_DV_in_Other_Summary_Statistics_Dataset <- Summary_Statistics_Master_Dataset %>%
  filter(row_number() %in% c(81:87))

# 4.14 Create BU_Total_DV_Summary_Statistics_Dataset
BU_Total_DV_Summary_Statistics_Dataset <- Summary_Statistics_Master_Dataset %>%
  filter(row_number() %in% c(88:94))

# 4.15 Create BU_DE_Summary_Statistics_Dataset
BU_DE_Summary_Statistics_Dataset <- Summary_Statistics_Master_Dataset %>%
  filter(row_number() %in% c(95:101))

# 4.16 Create BU_CDE_Summary_Statistics_Dataset
BU_CDE_Summary_Statistics_Dataset <- Summary_Statistics_Master_Dataset %>%
  filter(row_number() %in% c(102:108))

# 4.17 Create UC_DV_in_U_Summary_Statistics_Dataset
UC_DV_in_U_Summary_Statistics_Dataset <- Summary_Statistics_Master_Dataset %>%
  filter(row_number() %in% c(109:115))

# 4.18 Create UC_DV_in_C_Summary_Statistics_Dataset
UC_DV_in_C_Summary_Statistics_Dataset <- Summary_Statistics_Master_Dataset %>%
  filter(row_number() %in% c(116:122))

# 4.19 Create UC_DV_in_Other_Summary_Statistics_Dataset
UC_DV_in_Other_Summary_Statistics_Dataset <- Summary_Statistics_Master_Dataset %>%
  filter(row_number() %in% c(123:129))

# 4.20 Create UC_Total_DV_Summary_Statistics_Dataset
UC_Total_DV_Summary_Statistics_Dataset <- Summary_Statistics_Master_Dataset %>%
  filter(row_number() %in% c(130:136))

# 4.21 Create UC_DE_Summary_Statistics_Dataset
UC_DE_Summary_Statistics_Dataset <- Summary_Statistics_Master_Dataset %>%
  filter(row_number() %in% c(137:143))

# 4.22 Create UC_CDE_Summary_Statistics_Dataset
UC_CDE_Summary_Statistics_Dataset <- Summary_Statistics_Master_Dataset %>%
  filter(row_number() %in% c(144:150))

#-------------------------------------------------------------------------------
# 5. Save individual summary statistics in a permanent RDS format
#-------------------------------------------------------------------------------

# 5.1 Save RefYear_Summary_Statistics_Dataset
write_rds(RefYear_Summary_Statistics_Dataset, "RefYear_Summary_Statistics_Dataset", compress = "gz")

# 5.2 Save Q_From_World_Summary_Statistics_Dataset
write_rds(Q_From_World_Summary_Statistics_Dataset, "Quantity_From_World_Summary_Statistics_Dataset", compress = "gz")

# 5.3 Save Q_From_Brazil_Summary_Statistics_Dataset
write_rds(Q_From_Brazil_Summary_Statistics_Dataset, "Quantity_From_Brazil_Summary_Statistics_Dataset", compress = "gz")

# 5.4 Save Q_From_USA_Summary_Statistics_Dataset
write_rds(Q_From_USA_Summary_Statistics_Dataset, "Quantity_From_USA_Summary_Statistics_Dataset", compress = "gz")

# 5.5 Save BC_DV_in_C_Summary_Statistics_Dataset
write_rds(BC_DV_in_C_Summary_Statistics_Dataset, "BC_DV_in_C_Summary_Statistics_Dataset", compress = "gz")

# 5.6 Save BC_DV_in_B_Summary_Statistics_Dataset
write_rds(BC_DV_in_B_Summary_Statistics_Dataset, "BC_DV_in_B_Summary_Statistics_Dataset", compress = "gz")

# 5.7 Save BC_DV_in_Other_Summary_Statistics_Dataset
write_rds(BC_DV_in_Other_Summary_Statistics_Dataset, "BC_DV_in_Other_Summary_Statistics_Dataset", compress = "gz")

# 5.8 Save BC_Total_DV_Summary_Statistics_Dataset
write_rds(BC_Total_DV_Summary_Statistics_Dataset, "BC_Total_DV_Summary_Statistics_Dataset", compress = "gz")

# 5.9 Save BC_DE_Summary_Statistics_Dataset
write_rds(BC_DE_Summary_Statistics_Dataset, "BC_DE_Summary_Statistics_Dataset", compress = "gz")

# 5.10 Save BC_CDE_Summary_Statistics_Dataset
write_rds(BC_CDE_Summary_Statistics_Dataset, "BC_CDE_Summary_Statistics_Dataset", compress = "gz")

# 5.11 Save BU_DV_in_U_Summary_Statistics_Dataset
write_rds(BU_DV_in_U_Summary_Statistics_Dataset, "BU_DV_in_U_Summary_Statistics_Dataset", compress = "gz")

# 5.12 Save BU_DV_in_B_Summary_Statistics_Dataset
write_rds(BU_DV_in_B_Summary_Statistics_Dataset, "BU_DV_in_B_Summary_Statistics_Dataset", compress = "gz")

# 5.13 Save BU_DV_in_Other_Summary_Statistics_Dataset
write_rds(BU_DV_in_Other_Summary_Statistics_Dataset, "BU_DV_in_Other_Summary_Statistics_Dataset", compress = "gz")

# 5.14 Save BU_Total_DV_Summary_Statistics_Dataset
write_rds(BU_Total_DV_Summary_Statistics_Dataset, "BU_Total_DV_Summary_Statistics_Dataset", compress = "gz")

# 5.15 Save BU_DE_Summary_Statistics_Dataset
write_rds(BU_DE_Summary_Statistics_Dataset, "BU_DE_Summary_Statistics_Dataset", compress = "gz")

# 5.16 Save BU_CDE_Summary_Statistics_Dataset
write_rds(BU_CDE_Summary_Statistics_Dataset, "BU_CDE_Summary_Statistics_Dataset", compress = "gz")

# 5.17 Save UC_DV_in_U_Summary_Statistics_Dataset
write_rds(UC_DV_in_U_Summary_Statistics_Dataset, "UC_DV_in_U_Summary_Statistics_Dataset", compress = "gz")

# 5.18 Save UC_DV_in_C_Summary_Statistics_Dataset
write_rds(UC_DV_in_C_Summary_Statistics_Dataset, "UC_DV_in_C_Summary_Statistics_Dataset", compress = "gz")

# 5.19 Save UC_DV_in_Other_Summary_Statistics_Dataset
write_rds(UC_DV_in_Other_Summary_Statistics_Dataset, "UC_DV_in_Other_Summary_Statistics_Dataset", compress = "gz")

# 5.20 Save UC_Total_DV_Summary_Statistics_Dataset
write_rds(UC_Total_DV_Summary_Statistics_Dataset, "UC_Total_DV_Summary_Statistics_Dataset", compress = "gz")

# 5.21 Save UC_DE_Summary_Statistics_Dataset
write_rds(UC_DE_Summary_Statistics_Dataset, "UC_DE_Summary_Statistics_Dataset", compress = "gz")

# 5.22 Save UC_CDE_Summary_Statistics_Dataset
write_rds(UC_CDE_Summary_Statistics_Dataset, "UC_CDE_Summary_Statistics_Dataset", compress = "gz")

# 5.23 Save Summary_Statistics_Master_Dataset
write_rds(Summary_Statistics_Master_Dataset, "Summary_Statistics_Master_Dataset", compress = "gz")

#-------------------------------------------------------------------------------
# 6. Save individual summary statistics in a permanent RDS format
#-------------------------------------------------------------------------------

# 6.1 Save RefYear_Summary_Statistics_Dataset
write_xlsx(RefYear_Summary_Statistics_Dataset, "RefYear_Summary_Statistics_Dataset")

# 6.2 Save Q_From_World_Summary_Statistics_Dataset
write_xlsx(Q_From_World_Summary_Statistics_Dataset, "Quantity_From_World_Summary_Statistics_Dataset")

# 6.3 Save Q_From_Brazil_Summary_Statistics_Dataset
write_xlsx(Q_From_Brazil_Summary_Statistics_Dataset, "Quantity_From_Brazil_Summary_Statistics_Dataset")

# 6.4 Save Q_From_USA_Summary_Statistics_Dataset
write_xlsx(Q_From_USA_Summary_Statistics_Dataset, "Quantity_From_USA_Summary_Statistics_Dataset")

# 6.5 Save BC_DV_in_C_Summary_Statistics_Dataset
write_xlsx(BC_DV_in_C_Summary_Statistics_Dataset, "BC_DV_in_C_Summary_Statistics_Dataset")

# 6.6 Save BC_DV_in_B_Summary_Statistics_Dataset
write_xlsx(BC_DV_in_B_Summary_Statistics_Dataset, "BC_DV_in_B_Summary_Statistics_Dataset")

# 6.7 Save BC_DV_in_Other_Summary_Statistics_Dataset
write_xlsx(BC_DV_in_Other_Summary_Statistics_Dataset, "BC_DV_in_Other_Summary_Statistics_Dataset")

# 6.8 Save BC_Total_DV_Summary_Statistics_Dataset
write_xlsx(BC_Total_DV_Summary_Statistics_Dataset, "BC_Total_DV_Summary_Statistics_Dataset")

# 6.9 Save BC_DE_Summary_Statistics_Dataset
write_xlsx(BC_DE_Summary_Statistics_Dataset, "BC_DE_Summary_Statistics_Dataset")

# 6.10 Save BC_CDE_Summary_Statistics_Dataset
write_xlsx(BC_CDE_Summary_Statistics_Dataset, "BC_CDE_Summary_Statistics_Dataset")

# 6.11 Save BU_DV_in_U_Summary_Statistics_Dataset
write_xlsx(BU_DV_in_U_Summary_Statistics_Dataset, "BU_DV_in_U_Summary_Statistics_Dataset")

# 6.12 Save BU_DV_in_B_Summary_Statistics_Dataset
write_xlsx(BU_DV_in_B_Summary_Statistics_Dataset, "BU_DV_in_B_Summary_Statistics_Dataset")

# 6.13 Save BU_DV_in_Other_Summary_Statistics_Dataset
write_xlsx(BU_DV_in_Other_Summary_Statistics_Dataset, "BU_DV_in_Other_Summary_Statistics_Dataset")

# 6.14 Save BU_Total_DV_Summary_Statistics_Dataset
write_xlsx(BU_Total_DV_Summary_Statistics_Dataset, "BU_Total_DV_Summary_Statistics_Dataset")

# 6.15 Save BU_DE_Summary_Statistics_Dataset
write_xlsx(BU_DE_Summary_Statistics_Dataset, "BU_DE_Summary_Statistics_Dataset")

# 6.16 Save BU_CDE_Summary_Statistics_Dataset
write_xlsx(BU_CDE_Summary_Statistics_Dataset, "BU_CDE_Summary_Statistics_Dataset")

# 6.17 Save UC_DV_in_U_Summary_Statistics_Dataset
write_rds(UC_DV_in_U_Summary_Statistics_Dataset, "UC_DV_in_U_Summary_Statistics_Dataset")

# 6.18 Save UC_DV_in_C_Summary_Statistics_Dataset
write_rds(UC_DV_in_C_Summary_Statistics_Dataset, "UC_DV_in_C_Summary_Statistics_Dataset")

# 6.19 Save UC_DV_in_Other_Summary_Statistics_Dataset
write_xlsx(UC_DV_in_Other_Summary_Statistics_Dataset, "UC_DV_in_Other_Summary_Statistics_Dataset")

# 6.20 Save UC_Total_DV_Summary_Statistics_Dataset
write_xlsx(UC_Total_DV_Summary_Statistics_Dataset, "UC_Total_DV_Summary_Statistics_Dataset")

# 6.21 Save UC_DE_Summary_Statistics_Dataset
write_xlsx(UC_DE_Summary_Statistics_Dataset, "UC_DE_Summary_Statistics_Dataset")

# 6.22 Save UC_CDE_Summary_Statistics_Dataset
write_xlsx(UC_CDE_Summary_Statistics_Dataset, "UC_CDE_Summary_Statistics_Dataset")

# 6.23 Save Summary_Statistics_Master_Dataset
write_xlsx(Summary_Statistics_Master_Dataset, "Summary_Statistics_Master_Dataset")

#-------------------------------------------------------------------------------
# 6. Remove extra data
#-------------------------------------------------------------------------------

# 6.1 Fully clean work space
rm(BC_CDE_Summary_Statistics_Dataset, BC_DE_Summary_Statistics_Dataset, BC_DV_in_B_Summary_Statistics_Dataset, BC_DV_in_C_Summary_Statistics_Dataset, BC_DV_in_Other_Summary_Statistics_Dataset, BC_Total_DV_Summary_Statistics_Dataset)
rm(BU_CDE_Summary_Statistics_Dataset, BU_DE_Summary_Statistics_Dataset, BU_DV_in_B_Summary_Statistics_Dataset, BU_DV_in_U_Summary_Statistics_Dataset, BU_DV_in_Other_Summary_Statistics_Dataset, BU_Total_DV_Summary_Statistics_Dataset)
rm(UC_CDE_Summary_Statistics_Dataset, UC_DE_Summary_Statistics_Dataset, UC_DV_in_U_Summary_Statistics_Dataset, UC_DV_in_C_Summary_Statistics_Dataset, UC_DV_in_Other_Summary_Statistics_Dataset, UC_Total_DV_Summary_Statistics_Dataset)
rm(Q_From_Brazil_Summary_Statistics_Dataset,Q_From_USA_Summary_Statistics_Dataset, Q_From_World_Summary_Statistics_Dataset)
rm(Summary_Statistics_Master_Dataset, RefYear_Summary_Statistics_Dataset, Master_Dataset)
gc()

### END PROGRAM ###
