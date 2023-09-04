# Caste and Education
This project looks at the relationship between population shares of individual Scheduled Castes and Scheduled Tribes and education completion rates at the primary, matriculation and graduation levels in different Indian states using Census 2011 data. 

# Folder Descriptions & Sources
### Raw Data:
This folder contains raw data downloaded from the https://censusindia.gov.in website. The state_pop.xlsx file contains total population by state and gender for the entire country. The rest of the folder is organised state-wise, where each state folder contains 4 .xlsx files: xx_sc_pop (population by scheduled caste), xx_st_pop (population by scheduled tribe), xx_sc_edu (education attainment by scheduled caste), xx_st_edu (education attainment by scheduled tribe). Here, xx is a placeholder for the state name (for example, Tamil Nadu uses acronym "tn". Acronyms are used as per https://en.wikipedia.org/wiki/Template:India_state_abbreviations. Note that education levels are considered for ages 7 and above. 

##### Information about the colummns of these data sets is given in variable_description_raw_data.xlsx.

### Excel Changelogs
The Census data files were downloaded in .xlsx format. Minor formatting (changing column names, un-merging cells, etc.) was done on MS Excel. Changes made to each sheet in the Raw Data were tracked, and are provided in the Excel Changelogs folder. This folder is not organised by state. 

# Code & Reproducing Results 
All code here in run in R. The RStudio IDE set-up is preferable. 
#### Step 1: 
Download the Raw Data folder. Make sure to store all data sets as named in the repository. 
#### Step 2:
Set the folder the data is stored in as Working Directory. Note that all R scripts must be created in the same Working Directory. 
#### Step 3:
Download the data_cleaning_and_merging.R script, and open it in RStudio. Change the path to the Working Directory as on your machine, and run the script. This script gives a function to apply to all data sets. 
#### Step 4:
Download the states_import.R script, and open it in RStudio. Set the Working Directory as on your machine, and run the script to get cleaned and merged data sets. 
#### Step 5:
Download the graphing.R script, and open it in RStudio. Set the Working Directory as on your machine, and run the script to get graphs. 
