########################################
### Caste and Education: Census 2011 ###
########################################

### File Description: ###

#Objective: Importing data files for all states and using the data_cleaning_and_merging function to create data sets
#Date Created: 29/08/2023 
#Latest Date Updated: 04/09/2023
#Created By: Ananya Iyengar 

################################################################################

#Setting Working Directory

setwd("C:/Users/anniy/OneDrive/Desktop/caste_edu/caste_edu")

################################################################################

#Sourcing the data_cleaning_and_merging.R file to run the function in this script

source("data_cleaning_and_merging.r")

###############################################################################

#Tamil Nadu

#Importing Data Sets:

tn_sc_edu <- read_excel("raw_data/tamilnadu/tn_sc_edu.xlsx")
tn_sc_pop <- read_excel("raw_data/tamilnadu/tn_sc_pop.xlsx")
tn_st_edu <- read_excel("raw_data/tamilnadu/tn_st_edu.xlsx")
tn_st_pop <- read_excel("raw_data/tamilnadu/tn_st_pop.xlsx")

#Applying the function clean_and_merge():

tn <- clean_and_merge(tn_sc_pop, tn_st_pop, tn_sc_edu, tn_st_edu)

###############################################################################

#Andhra Pradesh

andhra_sc_edu <- read_excel("raw_data/andhrapradesh/andhra_sc_edu.xlsx")
andhra_sc_pop <- read_excel("raw_data/andhrapradesh/andhra_sc_pop.xlsx")
andhra_st_edu <- read_excel("raw_data/andhrapradesh/andhra_st_edu.xlsx")
andhra_st_pop <- read_excel("raw_data/andhrapradesh/andhra_st_pop.xlsx")

#Applying the function clean_and_merge():

andhra <- clean_and_merge(andhra_sc_pop, andhra_st_pop, andhra_sc_edu, andhra_st_edu)


###############################################################################

#Assam

assam_sc_edu <- read_excel("raw_data/assam/assam_sc_edu.XLS")
assam_sc_pop <- read_excel("raw_data/assam/assam_sc_pop.xlsx")
assam_st_edu <- read_excel("raw_data/assam/assam_st_edu.XLS")
assam_st_pop <- read_excel("raw_data/assam/assam_st_pop.xlsx")

#Applying the function clean_and_merge():

assam <- clean_and_merge(assam_sc_pop, assam_st_pop, assam_sc_edu, assam_st_edu)

###############################################################################

#Bihar

bihar_sc_edu <- read_excel("raw_data/bihar/bihar_sc_edu.XLS")
bihar_sc_pop <- read_excel("raw_data/bihar/bihar_sc_pop.xlsx")
bihar_st_edu <- read_excel("raw_data/bihar/bihar_st_edu.XLS")
bihar_st_pop <- read_excel("raw_data/bihar/bihar_st_pop.xlsx")

#Applying the function clean_and_merge():

bihar <- clean_and_merge(bihar_sc_pop, bihar_st_pop, bihar_sc_edu, bihar_st_edu)

###############################################################################

sessionInfo()

#R version 4.2.1 (2022-06-23 ucrt)
#Platform: x86_64-w64-mingw32/x64 (64-bit)
#Running under: Windows 10 x64 (build 22621)

#Matrix products: default

#locale:
#[1] LC_COLLATE=English_India.utf8  LC_CTYPE=English_India.utf8    LC_MONETARY=English_India.utf8
#[4] LC_NUMERIC=C                   LC_TIME=English_India.utf8    

#attached base packages:
#[1] stats     graphics  grDevices utils     datasets  methods   base     

#loaded via a namespace (and not attached):
# [1] fansi_1.0.3      assertthat_0.2.1 utf8_1.2.2       dplyr_1.0.10     R6_2.5.1         DBI_1.1.3       
# [7] lifecycle_1.0.2  magrittr_2.0.3   pillar_1.8.1     rlang_1.0.6      cli_3.4.1        rstudioapi_0.14 
# [13] vctrs_0.4.2      generics_0.1.3   tools_4.2.1      glue_1.6.2       purrr_0.3.4      compiler_4.2.1  
# [19] pkgconfig_2.0.3  tidyselect_1.1.2 tibble_3.1.8


