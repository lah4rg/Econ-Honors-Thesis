#===============================================================================
# Program   :  03 - Run Preliminary Discoveries and Regressions
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
# 3. Check normality of relationships (histogram)
#-------------------------------------------------------------------------------

# 3.1 Create Histogram_Q.from.World...2 and save and jpeg
jpeg(file="Histogram_Q.from.World...2.jpeg")
hist(Master_Dataset$Q.from.World...2)
dev.off()

# 3.2 Create Histogram_Q.from.Brazil...3 and save and jpeg
jpeg(file="Histogram_Q.from.Brazil...3.jpeg")
hist(Master_Dataset$Q.from.Brazil...3)
dev.off()

# 3.3 Create Histogram_Q.from.USA...4 and save and jpeg
jpeg(file="Histogram_Q.from.USA...4.jpeg")
hist(Master_Dataset$Q.from.USA...4)
dev.off()

# 3.4 Create Histogram_BC.Total.DV and save and jpeg
jpeg(file="Histogram_BC.Total.DV.jpeg")
hist(Master_Dataset$BC.Total.DV)
dev.off()

# 3.5 Create Histogram_UC.Total.DV and save and jpeg
jpeg(file="Histogram_UC.Total.DV.jpeg")
hist(Master_Dataset$UC.Total.DV)
dev.off()

#-------------------------------------------------------------------------------
# 4. Check linearity between trade flows and DV (scatter plot)
#-------------------------------------------------------------------------------

# 4.1 Create Scatter_Plot_BC.Total.DV_Q.from.World...2 and save and jpeg
jpeg(file="Scatter_Plot_Q.from.World...2_BC.Total.DV.jpeg")
plot(Q.from.World...2 ~ BC.Total.DV, data = Master_Dataset)
abline(lm(Q.from.World...2 ~ BC.Total.DV, data = Master_Dataset), col = "red")
dev.off()

# 4.2 Create Scatter_Plot_BC.Total.DV_Q.from.Brazil...3 and save and jpeg
jpeg(file="Scatter_Plot_Q.from.Brazil...3_BC.Total.DV.jpeg")
plot(Q.from.Brazil...3 ~ BC.Total.DV, data = Master_Dataset)
abline(lm(Q.from.Brazil...3 ~ BC.Total.DV, data = Master_Dataset), col = "red")
dev.off()

# 4.3 Create Scatter_Plot_BC.Total.DV_Q.from.USA...4 and save and jpeg
jpeg(file="Scatter_Plot_Q.from.USA...4_BC.Total.DV.jpeg")
plot(Q.from.USA...4 ~ BC.Total.DV, data = Master_Dataset)
abline(lm(Q.from.USA...4 ~ BC.Total.DV, data = Master_Dataset), col = "red")
dev.off()

# 4.4 Create Scatter_Plot_UC.Total.DV_Q.from.World...2 and save and jpeg
jpeg(file="Scatter_Plot_Q.from.World...2_UC.Total.DV.jpeg")
plot(Q.from.World...2 ~ UC.Total.DV, data = Master_Dataset)
abline(lm(Q.from.World...2 ~ UC.Total.DV, data = Master_Dataset), col = "red")
dev.off()

# 4.5 Create Scatter_Plot_UC.Total.DV_Q.from.Brazil...3 and save and jpeg
jpeg(file="Scatter_Plot_Q.from.Brazil...3_UC.Total.DV.jpeg")
plot(Q.from.Brazil...3 ~ UC.Total.DV, data = Master_Dataset)
abline(lm(Q.from.Brazil...3 ~ UC.Total.DV, data = Master_Dataset), col = "red")
dev.off()

# 4.6 Create Scatter_Plot_UC.Total.DV_Q.from.USA...4 and save and jpeg
jpeg(file="Scatter_Plot_Q.from.USA...4_UC.Total.DV.jpeg")
plot(Q.from.USA...4 ~ UC.Total.DV, data = Master_Dataset)
abline(lm(Q.from.USA...4 ~ UC.Total.DV, data = Master_Dataset), col = "red")
dev.off()

#-------------------------------------------------------------------------------
# 5. Run regressions for all relationships
#-------------------------------------------------------------------------------

# 5.1 Run regression and create list for BC.Total.DV_Q.from.World...2 relationship
lm_BC.Total.DV_Q.from.World...2 <- lm(Q.from.World...2 ~ BC.Total.DV, data = Master_Dataset)

# 5.2 Run regression and create list for BC.Total.DV_Q.from.Brazil...3 relationship
lm_BC.Total.DV_Q.from.Brazil...3 <- lm(Q.from.Brazil...3 ~ BC.Total.DV, data = Master_Dataset)

# 5.3 Run regression and create list for BC.Total.DV_Q.from.USA...4 relationship
lm_BC.Total.DV_Q.from.USA...4 <- lm(Q.from.USA...4 ~ BC.Total.DV, data = Master_Dataset)

# 5.4 Run regression and create list for UC.Total.DV_Q.from.World...2 relationship
lm_UC.Total.DV_Q.from.World...2 <- lm(Q.from.World...2 ~ UC.Total.DV, data = Master_Dataset)

# 5.5 Run regression and create list for UC.Total.DV_Q.from.Brazil...3 relationship
lm_UC.Total.DV_Q.from.Brazil...3 <- lm(Q.from.Brazil...3 ~ UC.Total.DV, data = Master_Dataset)

# 5.6 Run regression and create list for UC.Total.DV_Q.from.USA...4 relationship
lm_UC.Total.DV_Q.from.USA...4 <- lm(Q.from.USA...4 ~ UC.Total.DV, data = Master_Dataset)

#-------------------------------------------------------------------------------
# 6. Export regression outputs into text files
#-------------------------------------------------------------------------------

# 6.1 Export regression output list for BC.Total.DV_Q.from.World...2 relationship
stargazer(lm_BC.Total.DV_Q.from.World...2, title = "lm_BC.Total.DV_Q.from.World...2", type = "text", out = "lm_BC.Total.DV_Q.from.World...2.text")

# 6.2 Export regression output list for BC.Total.DV_Q.from.Brazil...3 relationship
stargazer(lm_BC.Total.DV_Q.from.Brazil...3, title = "lm_BC.Total.DV_Q.from.Brazil...3", type = "text", out = "lm_BC.Total.DV_Q.from.Brazil...3.text")

# 6.3 Export regression output list for BC.Total.DV_Q.from.USA...4 relationship
stargazer(lm_BC.Total.DV_Q.from.USA...4, title = "lm_BC.Total.DV_Q.from.USA...4", type = "text", out = "lm_BC.Total.DV_Q.from.USA...4.text")

# 6.4 Export regression output list for UC.Total.DV_Q.from.World...2 relationship
stargazer(lm_UC.Total.DV_Q.from.World...2, title = "lm_UC.Total.DV_Q.from.World...2", type = "text", out = "lm_UC.Total.DV_Q.from.World...2.text")

# 6.5 Export regression output list for UC.Total.DV_Q.from.Brazil...3 relationship
stargazer(lm_UC.Total.DV_Q.from.Brazil...3, title = "lm_UC.Total.DV_Q.from.Brazil...3", type = "text", out = "lm_UC.Total.DV_Q.from.Brazil...3.text")

# 6.6 Export regression output list for UC.Total.DV_Q.from.USA...4 relationship
stargazer(lm_UC.Total.DV_Q.from.USA...4, title = "lm_UC.Total.DV_Q.from.USA...4", type = "text", out = "lm_UC.Total.DV_Q.from.USA...4.text")

#-------------------------------------------------------------------------------
# 7. Remove extra data
#-------------------------------------------------------------------------------

# 7.1 Fully clean work space
rm(Master_Dataset, lm_BC.Total.DV_Q.from.World...2, lm_BC.Total.DV_Q.from.Brazil...3, lm_BC.Total.DV_Q.from.USA...4, lm_UC.Total.DV_Q.from.World...2, lm_UC.Total.DV_Q.from.Brazil...3, lm_UC.Total.DV_Q.from.USA...4)
gc()

### END PROGRAM ###