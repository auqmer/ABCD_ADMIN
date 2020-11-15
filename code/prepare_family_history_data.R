#************************************************************************
# Title: prepare_family_history_data
# Author: William Murrah
# Description: Prepare Family history variables from ABCD_2.01
# Created: Saturday, 14 November 2020
# R version: R version 4.0.3 (2020-10-10)
# Project(working) directory: /home/hank01/Projects/QMER/ABCD_ADMIN
#************************************************************************
require(data.table)
require(dplyr)

loc <- "~/qmer/source_data/ABCD/ABCD_release2.0.1_update_Rds/"
nda_names <- fread(paste0(loc, "NDA_DEAP_names_2.0.1.csv"))

fhx_colnames <- c("subjectid", nda_names$abcd[nda_names$instrument == "fhxp201"])

fhx <- abcd[, fhx_colnames]
