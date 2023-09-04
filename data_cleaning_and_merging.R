########################################
### Caste and Education: Census 2011 ###
########################################

### File Description: ###

#Objective: Function for Data Cleaning and Merging of Total population, SC population, ST population and Education files
#Date Created: 29/08/2023 
#Latest Date Updated: 29/08/2023
#Created By: Ananya Iyengar 

################################################################################

#Setting Working Directory

setwd("C:/Users/anniy/OneDrive/Desktop/caste_edu/caste_edu")

################################################################################

#Loading Packages 

library(readxl) #to import .xlsx format data sets
library(dplyr) #to manipulate data frames

################################################################################

#All India State-Wise Population (Census 2011)

#Importing Data 
state_pop <- read_excel("raw_data/state_pop.xlsx")

#Extracting information for total population for the entire region of state from state_pop

total_population <- state_pop %>% dplyr::filter(TRU == "Total") %>%
  select(State, Level, Name, TRU, TOT_P)

################################################################################

#Cleaning and Merging SC, ST and Education Data (Census 2011)

#To reduce repetition of work, we make a function that can be applied to data sets for all states. 

clean_and_merge <- function(sc, st, sc_edu, st_edu) {
  
  #Inputs:
  # - sc: data frame containing population data of scheduled castes in the state
  # - st: data frame containing population data of scheduled tribes in the state
  # - sc_edu: data frame containing education attainment levels data by scheduled caste in the state
  # - st_edu: data frame containing education attainment levels data by scheduled tribe in the state
  
  #Setting Column Names for the files to facilitate easy merging#
  
  colnames(sc) <- c("table_name", "state_code", "dist_code", "area_name", "sc_code", "sc_name",
                    "region", "total_pop", "male_pop", "female_pop")
  colnames(st) <- c("table_name", "state_code", "dist_code", "area_name", "st_code", "st_name",
                    "region", "total_pop", "male_pop", "female_pop")
  colnames(sc_edu) <- c("table_name", "state_code", "dist_code", "state_name", "sc_code", "sc_name", "region",
                        "pop_total", "pop_male", "pop_female", "ill_total", "ill_male", "ill_female", 
                        "lit_total", "lit_male", "lit_female", "lit_no_edu_total", "lit_no_edu_male",
                        "lit_no_edu_female", "below_prim_total", "below_prim_male", "below_prim_female",
                        "prim_total", "prim_male", "prim_female", "mid_total", "mid_male", "mid_female",
                        "matric_total", "matric_male", "matric_female", "sensec_total", "sensec_male",
                        "sensec_female", "nontechdip_total", "nontechdip_male", "nontechdip_female",
                        "techdip_total", "techdip_male", "techdip_female", "grad_total", "grad_male", "grad_female")
  colnames(st_edu) <- c("table_name", "state_code", "dist_code", "state_name", "st_code", "st_name", "region",
                        "pop_total", "pop_male", "pop_female", "ill_total", "ill_male", "ill_female", 
                        "lit_total", "lit_male", "lit_female", "lit_no_edu_total", "lit_no_edu_male",
                        "lit_no_edu_female", "below_prim_total", "below_prim_male", "below_prim_female",
                        "prim_total", "prim_male", "prim_female", "mid_total", "mid_male", "mid_female",
                        "matric_total", "matric_male", "matric_female", "sensec_total", "sensec_male",
                        "sensec_female", "nontechdip_total", "nontechdip_male", "nontechdip_female",
                        "techdip_total", "techdip_male", "techdip_female", "grad_total", "grad_male", "grad_female")
  
  #cleaning the scheduled caste file#
  sc1 <- sc %>% dplyr::filter(region == "Total" & dist_code == "00") %>% #choosing population in the overall geographical region of the state
    select(-c(male_pop, female_pop)) #excluding male and female population columns
  
  sc2 <- sc1 %>% dplyr::mutate(dummy = rep(1, times = nrow(sc1))) %>%
    mutate(commonid = paste0(dummy, sc_code)) #using 1 to denote SC and merging with sc_code to create uniqueid
  
  #cleaning the scheduled tribe file#
  st1 <- st %>% dplyr::filter(region == "Total" & dist_code == "00") %>% #choosing population in the overall geographical region of the state
    select(-c(male_pop, female_pop)) #excluding male and female population columns
  
  st2 <- st1 %>% dplyr::mutate(dummy = rep(2, times = nrow(st1))) %>%
    mutate(commonid = paste0(dummy, st_code)) #using 2 to denote ST and merging with st_code to create uniqueid
  
  #cleaning the sc_edu file#
  sc_edu1 <- sc_edu %>% dplyr::filter(region=="Total" & dist_code == "00") %>% #choosing population in the overall geographical region of the state
    dplyr::select(c(state_code, dist_code, state_name, sc_code, sc_name, region, ill_total, lit_total, lit_no_edu_total, below_prim_total, prim_total, mid_total,
           matric_total, sensec_total, grad_total)) #selecting total education attainment variables
  
  sc_edu2 <- sc_edu1 %>% dplyr::mutate(dummy = rep(1, times = nrow(sc_edu1))) %>%
    mutate(commonid = paste0(dummy, sc_code)) #using 1 to denote SC and merging with sc_code to create uniqueid
  
  #cleaning the st_edu file#
  st_edu1 <- st_edu %>% dplyr::filter(region == "Total" & dist_code == "00") %>% #choosing population in the overall geographical region of the state
    dplyr::select(c(state_code, dist_code, state_name, st_code, st_name, region, ill_total, lit_total, lit_no_edu_total, below_prim_total, prim_total, mid_total,
                    matric_total, sensec_total, grad_total))
  
  st_edu2 <- st_edu1 %>% dplyr::mutate(dummy = rep(2, times = nrow(st_edu1))) %>%
    mutate(commonid = paste0(dummy, st_code)) #using 2 to denote ST and merging with st_code to create uniqueid
  
  #merging the sc and sc_edu files together#
  sc_comb <- dplyr::inner_join(sc2, sc_edu2, by = "commonid")
  
  #merging the st and st_edu files together#
  st_comb <- dplyr::inner_join(st2, st_edu2, by = "commonid")
  
  #removing the ALL SC/ST rows before sorting in descending order
  
  sc_comb <- sc_comb[-1, ]
  st_comb <- st_comb[-1, ]
  
  #selecting the 10 largest castes by total population total_pop
  sc_top10 <- sc_comb %>% dplyr::arrange(desc(total_pop)) %>%
    slice(1:10)
  
  #selecting the 10 largest tribes by total population total_pop
  st_top10 <- st_comb %>% dplyr::arrange(desc(total_pop)) %>%
    slice(1:10)
  
  #vertically stacking the sc_top10 and st_top10 files#
  
  combined <- bind_rows(sc_top10, st_top10)
  
  return (combined)
}

################################################################################

sessionsInfo()

#Session Info Details
R version 4.2.1 (2022-06-23 ucrt)
Platform: x86_64-w64-mingw32/x64 (64-bit)
Running under: Windows 10 x64 (build 22621)

Matrix products: default

locale:
[1] LC_COLLATE=English_India.utf8  LC_CTYPE=English_India.utf8    LC_MONETARY=English_India.utf8
[4] LC_NUMERIC=C                   LC_TIME=English_India.utf8    

attached base packages:
[1] stats     graphics  grDevices utils     datasets  methods   base     

other attached packages:
[1] ggplot2_3.3.6 dplyr_1.0.10  readxl_1.4.1 

loaded via a namespace (and not attached):
 [1] rstudioapi_0.14  magrittr_2.0.3   munsell_0.5.0    tidyselect_1.1.2 colorspace_2.0-3 R6_2.5.1        
 [7] rlang_1.0.6      fansi_1.0.3      tools_4.2.1      grid_4.2.1       gtable_0.3.1     utf8_1.2.2      
[13] cli_3.4.1        DBI_1.1.3        withr_2.5.0      ellipsis_0.3.2   assertthat_0.2.1 tibble_3.1.8    
[19] lifecycle_1.0.2  purrr_0.3.4      vctrs_0.4.2      glue_1.6.2       compiler_4.2.1   pillar_1.8.1    
[25] cellranger_1.1.0 generics_0.1.3   scales_1.2.1     pkgconfig_2.0.3 


