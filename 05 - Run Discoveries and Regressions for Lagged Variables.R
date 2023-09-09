#===============================================================================
# Program   :  05 - Run Discoveries and Regressions for Lagged Variables
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
# 2. Load Master_Dataset_Lag1 and Master_Dataset_Lag2
#-------------------------------------------------------------------------------

# 2.1 Load in permanent RDS file for one-year lag
Master_Dataset_Lag1 <- readRDS("Master_Dataset_Lag1")

# 2.2 Load in permanent RDS file for two-year lag
Master_Dataset_Lag2 <- readRDS("Master_Dataset_Lag2")

#-------------------------------------------------------------------------------
# 3. Check normality of relationships (histogram)
#-------------------------------------------------------------------------------

# 3.1 Create Histogram_Q.from.World...2_Lag1 and save and jpeg
jpeg(file="Histogram_Q.from.World...2_Lag1.jpeg")
hist(Master_Dataset_Lag1$Q.from.World...2_Lag1)
dev.off()

# 3.2 Create Histogram_Q.from.Brazil...3_Lag1 and save and jpeg
jpeg(file="Histogram_Q.from.Brazil...3_Lag1.jpeg")
hist(Master_Dataset_Lag1$Q.from.Brazil...3_Lag1)
dev.off()

# 3.3 Create Histogram_Q.from.USA...4_Lag1 and save and jpeg
jpeg(file="Histogram_Q.from.USA...4_Lag1.jpeg")
hist(Master_Dataset_Lag1$Q.from.USA...4_Lag1)
dev.off()

# 3.4 Create Histogram_Q.from.World...2_Lag2 and save and jpeg
jpeg(file="Histogram_Q.from.World...2_Lag2.jpeg")
hist(Master_Dataset_Lag2$Q.from.World...2_Lag2)
dev.off()

# 3.5 Create Histogram_Q.from.Brazil...3_Lag2 and save and jpeg
jpeg(file="Histogram_Q.from.Brazil...3_Lag2.jpeg")
hist(Master_Dataset_Lag2$Q.from.Brazil...3_Lag2)
dev.off()

# 3.5 Create Histogram_Q.from.USA...4_Lag2 and save and jpeg
jpeg(file="Histogram_Q.from.USA...4_Lag2.jpeg")
hist(Master_Dataset_Lag2$Q.from.USA...4_Lag2)
dev.off()

#-------------------------------------------------------------------------------
# 4. Check linearity between trade flows and DV (scatter plot)
#-------------------------------------------------------------------------------

# 4.1 Create Scatter_Plot_BC.Total.DV_Q.from.World...2_Lag1 and save and jpeg
jpeg(file="Scatter_Plot_Q.from.World...2_Lag1_BC.Total.DV.jpeg")
plot(Q.from.World...2_Lag1 ~ BC.Total.DV, data = Master_Dataset_Lag1)
abline(lm(Q.from.World...2_Lag1 ~ BC.Total.DV, data = Master_Dataset_Lag1), col = "red")
dev.off()

# 4.2 Create Scatter_Plot_BC.Total.DV_Q.from.Brazil...3_Lag1 and save and jpeg
jpeg(file="Scatter_Plot_Q.from.Brazil...3_Lag1_BC.Total.DV.jpeg")
plot(Q.from.Brazil...3_Lag1 ~ BC.Total.DV, data = Master_Dataset_Lag1)
abline(lm(Q.from.Brazil...3_Lag1 ~ BC.Total.DV, data = Master_Dataset_Lag1), col = "red")
dev.off()

# 4.3 Create Scatter_Plot_BC.Total.DV_Q.from.USA...4_Lag1 and save and jpeg
jpeg(file="Scatter_Plot_Q.from.USA...4_Lag1_BC.Total.DV.jpeg")
plot(Q.from.USA...4_Lag1 ~ BC.Total.DV, data = Master_Dataset_Lag1)
abline(lm(Q.from.USA...4_Lag1 ~ BC.Total.DV, data = Master_Dataset_Lag1), col = "red")
dev.off()

# 4.4 Create Scatter_Plot_UC.Total.DV_Q.from.World...2_Lag1 and save and jpeg
jpeg(file="Scatter_Plot_Q.from.World...2_Lag1_UC.Total.DV.jpeg")
plot(Q.from.World...2_Lag1 ~ UC.Total.DV, data = Master_Dataset_Lag1)
abline(lm(Q.from.World...2_Lag1 ~ UC.Total.DV, data = Master_Dataset_Lag1), col = "red")
dev.off()

# 4.5 Create Scatter_Plot_UC.Total.DV_Q.from.Brazil...3_Lag1 and save and jpeg
jpeg(file="Scatter_Plot_Q.from.Brazil...3_Lag1_UC.Total.DV.jpeg")
plot(Q.from.Brazil...3_Lag1 ~ UC.Total.DV, data = Master_Dataset_Lag1)
abline(lm(Q.from.Brazil...3_Lag1 ~ UC.Total.DV, data = Master_Dataset_Lag1), col = "red")
dev.off()

# 4.6 Create Scatter_Plot_UC.Total.DV_Q.from.USA...4_Lag1 and save and jpeg
jpeg(file="Scatter_Plot_Q.from.USA...4_Lag1_UC.Total.DV.jpeg")
plot(Q.from.USA...4_Lag1 ~ UC.Total.DV, data = Master_Dataset_Lag1)
abline(lm(Q.from.USA...4_Lag1 ~ UC.Total.DV, data = Master_Dataset_Lag1), col = "red")
dev.off()

# 4.7 Create Scatter_Plot_BC.Total.DV_Q.from.World...2_Lag2 and save and jpeg
jpeg(file="Scatter_Plot_Q.from.World...2_Lag2_BC.Total.DV.jpeg")
plot(Q.from.World...2_Lag2 ~ BC.Total.DV, data = Master_Dataset_Lag2)
abline(lm(Q.from.World...2_Lag2 ~ BC.Total.DV, data = Master_Dataset_Lag2), col = "red")
dev.off()

# 4.8 Create Scatter_Plot_BC.Total.DV_Q.from.Brazil...3_Lag2 and save and jpeg
jpeg(file="Scatter_Plot_Q.from.Brazil...3_Lag2_BC.Total.DV.jpeg")
plot(Q.from.Brazil...3_Lag2 ~ BC.Total.DV, data = Master_Dataset_Lag2)
abline(lm(Q.from.Brazil...3_Lag2 ~ BC.Total.DV, data = Master_Dataset_Lag2), col = "red")
dev.off()

# 4.9 Create Scatter_Plot_BC.Total.DV_Q.from.USA...4_Lag2 and save and jpeg
jpeg(file="Scatter_Plot_Q.from.USA...4_Lag2_BC.Total.DV.jpeg")
plot(Q.from.USA...4_Lag2 ~ BC.Total.DV, data = Master_Dataset_Lag2)
abline(lm(Q.from.USA...4_Lag2 ~ BC.Total.DV, data = Master_Dataset_Lag2), col = "red")
dev.off()

# 4.10 Create Scatter_Plot_UC.Total.DV_Q.from.World...2_Lag2 and save and jpeg
jpeg(file="Scatter_Plot_Q.from.World...2_Lag2_UC.Total.DV.jpeg")
plot(Q.from.World...2_Lag2 ~ UC.Total.DV, data = Master_Dataset_Lag2)
abline(lm(Q.from.World...2_Lag2 ~ UC.Total.DV, data = Master_Dataset_Lag2), col = "red")
dev.off()

# 4.11 Create Scatter_Plot_UC.Total.DV_Q.from.Brazil...3_Lag2 and save and jpeg
jpeg(file="Scatter_Plot_Q.from.Brazil...3_Lag2_UC.Total.DV.jpeg")
plot(Q.from.Brazil...3_Lag2 ~ UC.Total.DV, data = Master_Dataset_Lag2)
abline(lm(Q.from.Brazil...3_Lag2 ~ UC.Total.DV, data = Master_Dataset_Lag2), col = "red")
dev.off()

# 4.12 Create Scatter_Plot_UC.Total.DV_Q.from.USA...4_Lag2 and save and jpeg
jpeg(file="Scatter_Plot_Q.from.USA...4_Lag2_UC.Total.DV.jpeg")
plot(Q.from.USA...4_Lag2 ~ UC.Total.DV, data = Master_Dataset_Lag2)
abline(lm(Q.from.USA...4_Lag2 ~ UC.Total.DV, data = Master_Dataset_Lag2), col = "red")
dev.off()

#-------------------------------------------------------------------------------
# 5. Run regressions for all relationships
#-------------------------------------------------------------------------------

# 5.1 Run regression and create list for BC.Total.DV_Q.from.World...2_Lag1 relationship
lm_BC.Total.DV_Q.from.World...2_Lag1 <- lm(Q.from.World...2_Lag1 ~ BC.Total.DV, data = Master_Dataset_Lag1)

# 5.2 Run regression and create list for BC.Total.DV_Q.from.Brazil...3_Lag1 relationship
lm_BC.Total.DV_Q.from.Brazil...3_Lag1 <- lm(Q.from.Brazil...3_Lag1 ~ BC.Total.DV, data = Master_Dataset_Lag1)

# 5.3 Run regression and create list for BC.Total.DV_Q.from.USA...4_Lag1 relationship
lm_BC.Total.DV_Q.from.USA...4_Lag1 <- lm(Q.from.USA...4_Lag1 ~ BC.Total.DV, data = Master_Dataset_Lag1)

# 5.4 Run regression and create list for UC.Total.DV_Q.from.World...2_Lag1 relationship
lm_UC.Total.DV_Q.from.World...2_Lag1 <- lm(Q.from.World...2_Lag1 ~ UC.Total.DV, data = Master_Dataset_Lag1)

# 5.5 Run regression and create list for UC.Total.DV_Q.from.Brazil...3_Lag1 relationship
lm_UC.Total.DV_Q.from.Brazil...3_Lag1 <- lm(Q.from.Brazil...3_Lag1 ~ UC.Total.DV, data = Master_Dataset_Lag1)

# 5.6 Run regression and create list for UC.Total.DV_Q.from.USA...4_Lag1 relationship
lm_UC.Total.DV_Q.from.USA...4_Lag1 <- lm(Q.from.USA...4_Lag1 ~ UC.Total.DV, data = Master_Dataset_Lag1)

# 5.7 Run regression and create list for BC.Total.DV_Q.from.World...2_Lag2 relationship
lm_BC.Total.DV_Q.from.World...2_Lag2 <- lm(Q.from.World...2_Lag2 ~ BC.Total.DV, data = Master_Dataset_Lag2)

# 5.8 Run regression and create list for BC.Total.DV_Q.from.Brazil...3_Lag2 relationship
lm_BC.Total.DV_Q.from.Brazil...3_Lag2 <- lm(Q.from.Brazil...3_Lag2 ~ BC.Total.DV, data = Master_Dataset_Lag2)

# 5.9 Run regression and create list for BC.Total.DV_Q.from.USA...4_Lag2 relationship
lm_BC.Total.DV_Q.from.USA...4_Lag2 <- lm(Q.from.USA...4_Lag2 ~ BC.Total.DV, data = Master_Dataset_Lag2)

# 5.10 Run regression and create list for UC.Total.DV_Q.from.World...2_Lag2 relationship
lm_UC.Total.DV_Q.from.World...2_Lag2 <- lm(Q.from.World...2_Lag2 ~ UC.Total.DV, data = Master_Dataset_Lag2)

# 5.11 Run regression and create list for UC.Total.DV_Q.from.Brazil...3_Lag2 relationship
lm_UC.Total.DV_Q.from.Brazil...3_Lag2 <- lm(Q.from.Brazil...3_Lag2 ~ UC.Total.DV, data = Master_Dataset_Lag2)

# 5.12 Run regression and create list for UC.Total.DV_Q.from.USA...4_Lag2 relationship
lm_UC.Total.DV_Q.from.USA...4_Lag2 <- lm(Q.from.USA...4_Lag2 ~ UC.Total.DV, data = Master_Dataset_Lag2)

#-------------------------------------------------------------------------------
# 6. Export regression outputs into text files
#-------------------------------------------------------------------------------

# 6.1 Export regression output list for BC.Total.DV_Q.from.World...2_Lag1 relationship
stargazer(lm_BC.Total.DV_Q.from.World...2_Lag1, title = "lm_BC.Total.DV_Q.from.World...2_Lag1", type = "text", out = "lm_BC.Total.DV_Q.from.World...2_Lag1.text")

# 6.2 Export regression output list for BC.Total.DV_Q.from.Brazil...3_Lag1 relationship
stargazer(lm_BC.Total.DV_Q.from.Brazil...3_Lag1, title = "lm_BC.Total.DV_Q.from.Brazil...3_Lag1", type = "text", out = "lm_BC.Total.DV_Q.from.Brazil...3_Lag1.text")

# 6.3 Export regression output list for BC.Total.DV_Q.from.USA...4_Lag1 relationship
stargazer(lm_BC.Total.DV_Q.from.USA...4_Lag1, title = "lm_BC.Total.DV_Q.from.USA...4_Lag1", type = "text", out = "lm_BC.Total.DV_Q.from.USA...4_Lag1.text")

# 6.4 Export regression output list for UC.Total.DV_Q.from.World...2_Lag1 relationship
stargazer(lm_UC.Total.DV_Q.from.World...2_Lag1, title = "lm_UC.Total.DV_Q.from.World...2_Lag1", type = "text", out = "lm_UC.Total.DV_Q.from.World...2_Lag1.text")

# 6.5 Export regression output list for UC.Total.DV_Q.from.Brazil...3_Lag1 relationship
stargazer(lm_UC.Total.DV_Q.from.Brazil...3_Lag1, title = "lm_UC.Total.DV_Q.from.Brazil...3_Lag1", type = "text", out = "lm_UC.Total.DV_Q.from.Brazil...3_Lag1.text")

# 6.6 Export regression output list for UC.Total.DV_Q.from.USA...4_Lag1 relationship
stargazer(lm_UC.Total.DV_Q.from.USA...4_Lag1, title = "lm_UC.Total.DV_Q.from.USA...4_Lag1", type = "text", out = "lm_UC.Total.DV_Q.from.USA...4_Lag1.text")

# 6.7 Export regression output list for BC.Total.DV_Q.from.World...2_Lag2 relationship
stargazer(lm_BC.Total.DV_Q.from.World...2_Lag2, title = "lm_BC.Total.DV_Q.from.World...2_Lag2", type = "text", out = "lm_BC.Total.DV_Q.from.World...2_Lag2.text")

# 6.8 Export regression output list for BC.Total.DV_Q.from.Brazil...3_Lag2 relationship
stargazer(lm_BC.Total.DV_Q.from.Brazil...3_Lag2, title = "lm_BC.Total.DV_Q.from.Brazil...3_Lag2", type = "text", out = "lm_BC.Total.DV_Q.from.Brazil...3_Lag2.text")

# 6.9 Export regression output list for BC.Total.DV_Q.from.USA...4_Lag2 relationship
stargazer(lm_BC.Total.DV_Q.from.USA...4_Lag2, title = "lm_BC.Total.DV_Q.from.USA...4_Lag2", type = "text", out = "lm_BC.Total.DV_Q.from.USA...4_Lag2.text")

# 6.10 Export regression output list for UC.Total.DV_Q.from.World...2_Lag2 relationship
stargazer(lm_UC.Total.DV_Q.from.World...2_Lag2, title = "lm_UC.Total.DV_Q.from.World...2_Lag2", type = "text", out = "lm_UC.Total.DV_Q.from.World...2_Lag2.text")

# 6.11 Export regression output list for UC.Total.DV_Q.from.Brazil...3_Lag2 relationship
stargazer(lm_UC.Total.DV_Q.from.Brazil...3_Lag2, title = "lm_UC.Total.DV_Q.from.Brazil...3_Lag2", type = "text", out = "lm_UC.Total.DV_Q.from.Brazil...3_Lag2.text")

# 6.12 Export regression output list for UC.Total.DV_Q.from.USA...4_Lag2 relationship
stargazer(lm_UC.Total.DV_Q.from.USA...4_Lag2, title = "lm_UC.Total.DV_Q.from.USA...4_Lag2", type = "text", out = "lm_UC.Total.DV_Q.from.USA...4_Lag2.text")

#-------------------------------------------------------------------------------
# 7. Remove extra data
#-------------------------------------------------------------------------------

# 7.1 Fully clean work space
rm(Master_Dataset_Lag1,lm_BC.Total.DV_Q.from.World...2_Lag1, lm_BC.Total.DV_Q.from.Brazil...3_Lag1, lm_BC.Total.DV_Q.from.USA...4_Lag1, lm_UC.Total.DV_Q.from.World...2_Lag1, lm_UC.Total.DV_Q.from.Brazil...3_Lag1, lm_UC.Total.DV_Q.from.USA...4_Lag1)
rm(Master_Dataset_Lag2, lm_BC.Total.DV_Q.from.World...2_Lag2, lm_BC.Total.DV_Q.from.Brazil...3_Lag2, lm_BC.Total.DV_Q.from.USA...4_Lag2, lm_UC.Total.DV_Q.from.World...2_Lag2, lm_UC.Total.DV_Q.from.Brazil...3_Lag2, lm_UC.Total.DV_Q.from.USA...4_Lag2)
gc()

### END PROGRAM ###