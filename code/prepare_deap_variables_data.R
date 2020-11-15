#************************************************************************
# Title: prepare_deap_variables_data.R
# Author: William Murrah
# Description: Create data.table from variables in deap.only.vars.others.csv
#              for ABCD 2.01
# Created: Saturday, 14 November 2020
# R version: R version 4.0.3 (2020-10-10)
# Project(working) directory: /home/hank01/Projects/QMER/ABCD_ADMIN
#************************************************************************
# ABCD source data directory
loc <- "~/qmer/source_data/ABCD/ABCD_release2.0.1_update_Rds/"

# Get basic variables
deap_dic <- fread(paste0(loc, "additional.vars.dic/deap.only.vars.others.csv"))

deap_names <- deap_dic$`DEAP name`

deap <- abcd[, deap_names]

# Rename event name to match other data for merging
names(deap)[names(deap) == "event_name"] <- "eventname"
rm(deap_names)
