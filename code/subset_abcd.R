#************************************************************************
# Title: subset_ABCD
# Author: William Murrah
# Description: Initial data exploration
# Created: Saturday, 24 October 2020
# R version: R version 4.0.3 (2020-10-10)
# Project(working) directory: /home/hank01/Projects/QMER/ABCD_ADMIN
#************************************************************************
library(dplyr)
loc <- "~/qmer/source_data/ABCD/ABCD_release2.0.1_update_Rds/"
abcd <- readRDS(paste0(loc, "nda2.0.1.Rds"))

# Get deap demographic variables
source("code/prepare_deap_variables_data.R")

# Subset Neurocognitive variables
abcd_ef <- abcd %>% 
  select("subjectid" | "eventname" |
           starts_with("neurocog") | 
           starts_with("nihtbx") |
           starts_with("lmt_") | 
           starts_with("ddis_") |
           starts_with("strp") |
           starts_with("ehi") |
           starts_with("pea") | 
           starts_with("snellen_"))

# Get residental history data
reshist <- abcd %>% 
  select("subjectid" | "eventname" |
           starts_with("reshist"))

# Merge demographics and ef data
abcdef1 <- merge(deap, abcd_ef, by = c("subjectid", "eventname"))

# Add residential history
abcdef1 <- merge(abcdef1, reshist, by = c("subjectid", "eventname"))

# Save Working ABCD data
saveRDS(abcdef1, "~/qmer/data/ABCD/abcdef1.rds")