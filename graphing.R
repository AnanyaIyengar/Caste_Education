########################################
### Caste and Education: Census 2011 ###
########################################

### File Description: ###

#Objective: Evaluating Population Fractions and Graphing 
#Date Created: 29/08/2023 
#Latest Date Updated: 04/09/2023
#Created By: Ananya Iyengar 

################################################################################

#Setting Working Directory

setwd("C:/Users/anniy/OneDrive/Desktop/caste_edu/caste_edu")

################################################################################

#Loading Packages

library(dplyr)
library(ggplot2)
library(viridis)

################################################################################

#Tamil Nadu

tn <- tn %>% dplyr::mutate(popshare_community = case_when(dummy.x == 1 ~ total_pop/14438445,
                                                          dummy.x ==2 ~ total_pop/794697)) #as a share of SC/ST population

#Primary Education

tn %>% 
  ggplot(aes(x = popshare_community, y = prim_total, fill = as.factor(dummy.x), size = total_pop)) + 
  geom_point(alpha = 0.4, shape = 21, color = "black") + scale_y_log10() + scale_color_viridis_b(aesthetics = "colour") + 
  theme(axis.text.x = element_text(size = 5.5), axis.title = element_text(size = 9)) +
  xlab("Community Population as a Fraction of Total SC/ST Population ") + 
  ylab("Log of Quantum of Primary School Attainment") +
  labs(fill = "SC/ST") + scale_fill_discrete(labels = c("SC", "ST")) + 
  ggtitle("Community Size vs Primary Education: Top 10 SC and ST in Tamil Nadu") +
  labs(caption = "Source: Data from Census 2011 Appendices A-10, A-11, SC-08, ST-08.") + 
  theme(plot.title = element_text(size=10), plot.caption = element_text(size = 6)) +
  guides(size = "none")
  
#Matriculation

tn %>% 
  ggplot(aes(x = popshare_community, y = matric_total, fill = as.factor(dummy.x), size = total_pop)) + 
  geom_point(alpha = 0.4, shape = 21, color = "black") + scale_y_log10() + scale_color_viridis_b(aesthetics = "colour") + 
  theme(axis.text.x = element_text(size = 5.5), axis.title = element_text(size = 9)) +
  xlab("Community Population as a Fraction of Total SC/ST Population ") + 
  ylab("Log of Quantum of Matriculation Attainment") +
  labs(fill = "SC/ST") + scale_fill_discrete(labels = c("SC", "ST")) + 
  ggtitle("Community Size vs Matriculation: Top 10 SC and ST in Tamil Nadu") +
  labs(caption = "Source: Data from Census 2011 Appendices A-10, A-11, SC-08, ST-08.") + 
  theme(plot.title = element_text(size=10), plot.caption = element_text(size = 6)) +
  guides(size = "none")

#Graduation

tn %>% 
  ggplot(aes(x = popshare_community, y = grad_total, fill = as.factor(dummy.x), size = total_pop)) + 
  geom_point(alpha = 0.4, shape = 21, color = "black") + scale_y_log10() + scale_color_viridis_b(aesthetics = "colour") + 
  theme(axis.text.x = element_text(size = 5.5), axis.title = element_text(size = 9)) +
  xlab("Community Population as a Fraction of Total SC/ST Population ") + 
  ylab("Log of Quantum of Graduation Attainment") +
  labs(fill = "SC/ST") + scale_fill_discrete(labels = c("SC", "ST")) + 
  ggtitle("Community Size vs Graduation: Top 10 SC and ST in Tamil Nadu") +
  labs(caption = "Source: Data from Census 2011 Appendices A-10, A-11, SC-08, ST-08.") + 
  theme(plot.title = element_text(size=10), plot.caption = element_text(size = 6)) +
  guides(size = "none")



################################################################################

  
#Andhra Pradesh


andhra <- andhra %>% dplyr::mutate(popshare_community = case_when(dummy.x == 1 ~ total_pop/13878078,
                                                                  dummy.x == 2 ~ total_pop/5918073)) #as a share of SC/ST population
#Primary Education

andhra %>% 
  ggplot(aes(x = popshare_community, y = prim_total, fill = as.factor(dummy.x), size = total_pop)) + 
  geom_point(alpha = 0.4, shape = 21, color = "black") + scale_y_log10() + scale_color_viridis_b(aesthetics = "colour") + 
  theme(axis.text.x = element_text(size = 5.5), axis.title = element_text(size = 9)) +
  xlab("Community Population as a Fraction of Total SC/ST Population ") + 
  ylab("Log of Quantum of Primary School Attainment") +
  labs(fill = "SC/ST") + scale_fill_discrete(labels = c("SC", "ST")) + 
  ggtitle("Community Size vs Primary Education: Top 10 SC and ST in Andhra Pradesh") +
  labs(caption = "Source: Data from Census 2011 Appendices A-10, A-11, SC-08, ST-08.") + 
  theme(plot.title = element_text(size=10), plot.caption = element_text(size = 6)) +
  guides(size = "none")

#Matriculation

andhra %>% 
  ggplot(aes(x = popshare_community, y = matric_total, fill = as.factor(dummy.x), size = total_pop)) + 
  geom_point(alpha = 0.4, shape = 21, color = "black") + scale_y_log10() + scale_color_viridis_b(aesthetics = "colour") + 
  theme(axis.text.x = element_text(size = 5.5), axis.title = element_text(size = 9)) +
  xlab("Community Population as a Fraction of Total SC/ST Population ") + 
  ylab("Log of Quantum of Matriculation Attainment") +
  labs(fill = "SC/ST") + scale_fill_discrete(labels = c("SC", "ST")) + 
  ggtitle("Community Size vs Matriculation: Top 10 SC and ST in Andhra Pradesh") +
  labs(caption = "Source: Data from Census 2011 Appendices A-10, A-11, SC-08, ST-08.") + 
  theme(plot.title = element_text(size=10), plot.caption = element_text(size = 6)) +
  guides(size = "none")

#Graduation

andhra %>% 
  ggplot(aes(x = popshare_community, y = grad_total, fill = as.factor(dummy.x), size = total_pop)) + 
  geom_point(alpha = 0.4, shape = 21, color = "black") + scale_y_log10() + scale_color_viridis_b(aesthetics = "colour") + 
  theme(axis.text.x = element_text(size = 5.5), axis.title = element_text(size = 9)) +
  xlab("Community Population as a Fraction of Total SC/ST Population ") + 
  ylab("Log of Quantum of Graduation Attainment") +
  labs(fill = "SC/ST") + scale_fill_discrete(labels = c("SC", "ST")) + 
  ggtitle("Community Size vs Graduation: Top 10 SC and ST in Andhra Pradesh") +
  labs(caption = "Source: Data from Census 2011 Appendices A-10, A-11, SC-08, ST-08.") + 
  theme(plot.title = element_text(size=10), plot.caption = element_text(size = 6)) +
  guides(size = "none")


################################################################################

#Assam

assam <- assam %>% dplyr::mutate(popshare_community = case_when(dummy.x == 1 ~ total_pop/2231321,
                                                                dummy.x == 2 ~ total_pop/3884371))

#Primary Education

assam %>% 
  ggplot(aes(x = popshare_community, y = prim_total, fill = as.factor(dummy.x), size = total_pop)) + 
  geom_point(alpha = 0.4, shape = 21, color = "black") + scale_y_log10() + scale_color_viridis_b(aesthetics = "colour") + 
  theme(axis.text.x = element_text(size = 5.5), axis.title = element_text(size = 9)) +
  xlab("Community Population as a Fraction of Total SC/ST Population ") + 
  ylab("Log of Quantum of Primary School Attainment") +
  labs(fill = "SC/ST") + scale_fill_discrete(labels = c("SC", "ST")) + 
  ggtitle("Community Size vs Primary Education: Top 10 SC and ST in Assam") +
  labs(caption = "Source: Data from Census 2011 Appendices A-10, A-11, SC-08, ST-08.") + 
  theme(plot.title = element_text(size=10), plot.caption = element_text(size = 6)) +
  guides(size = "none")

#Matriculation

assam %>% 
  ggplot(aes(x = popshare_community, y = matric_total, fill = as.factor(dummy.x), size = total_pop)) + 
  geom_point(alpha = 0.4, shape = 21, color = "black") + scale_y_log10() + scale_color_viridis_b(aesthetics = "colour") + 
  theme(axis.text.x = element_text(size = 5.5), axis.title = element_text(size = 9)) +
  xlab("Community Population as a Fraction of Total SC/ST Population ") + 
  ylab("Log of Quantum of Matriculation Attainment") +
  labs(fill = "SC/ST") + scale_fill_discrete(labels = c("SC", "ST")) + 
  ggtitle("Community Size vs Matriculation: Top 10 SC and ST in Assam") +
  labs(caption = "Source: Data from Census 2011 Appendices A-10, A-11, SC-08, ST-08.") + 
  theme(plot.title = element_text(size=10), plot.caption = element_text(size = 6)) +
  guides(size = "none")

#Graduation

assam %>% 
  ggplot(aes(x = popshare_community, y = grad_total, fill = as.factor(dummy.x), size = total_pop)) + 
  geom_point(alpha = 0.4, shape = 21, color = "black") + scale_y_log10() + scale_color_viridis_b(aesthetics = "colour") + 
  theme(axis.text.x = element_text(size = 5.5), axis.title = element_text(size = 9)) +
  xlab("Community Population as a Fraction of Total SC/ST Population ") + 
  ylab("Log of Quantum of Graduation Attainment") +
  labs(fill = "SC/ST") + scale_fill_discrete(labels = c("SC", "ST")) + 
  ggtitle("Community Size vs Graduation: Top 10 SC and ST in Assam") +
  labs(caption = "Source: Data from Census 2011 Appendices A-10, A-11, SC-08, ST-08.") + 
  theme(plot.title = element_text(size=10), plot.caption = element_text(size = 6)) +
  guides(size = "none")

################################################################################

#Bihar

bihar <- bihar %>% dplyr::mutate(popshare_community = case_when(dummy.x == 1 ~ total_pop/16567325,
                                                                dummy.x == 2 ~ total_pop/1336573))

#Primary Education

bihar %>% 
  ggplot(aes(x = popshare_community, y = prim_total, fill = as.factor(dummy.x), size = total_pop)) + 
  geom_point(alpha = 0.4, shape = 21, color = "black") + scale_y_log10() + scale_color_viridis_b(aesthetics = "colour") + 
  theme(axis.text.x = element_text(size = 5.5), axis.title = element_text(size = 9)) +
  xlab("Community Population as a Fraction of Total SC/ST Population ") + 
  ylab("Log of Quantum of Primary School Attainment") +
  labs(fill = "SC/ST") + scale_fill_discrete(labels = c("SC", "ST")) + 
  ggtitle("Community Size vs Primary Education: Top 10 SC and ST in Bihar") +
  labs(caption = "Source: Data from Census 2011 Appendices A-10, A-11, SC-08, ST-08.") + 
  theme(plot.title = element_text(size=10), plot.caption = element_text(size = 6)) +
  guides(size = "none")

#Matriculation

bihar %>% 
  ggplot(aes(x = popshare_community, y = matric_total, fill = as.factor(dummy.x), size = total_pop)) + 
  geom_point(alpha = 0.4, shape = 21, color = "black") + scale_y_log10() + scale_color_viridis_b(aesthetics = "colour") + 
  theme(axis.text.x = element_text(size = 5.5), axis.title = element_text(size = 9)) +
  xlab("Community Population as a Fraction of Total SC/ST Population ") + 
  ylab("Log of Quantum of Matriculation Attainment") +
  labs(fill = "SC/ST") + scale_fill_discrete(labels = c("SC", "ST")) + 
  ggtitle("Community Size vs Matriculation: Top 10 SC and ST in Bihar") +
  labs(caption = "Source: Data from Census 2011 Appendices A-10, A-11, SC-08, ST-08.") + 
  theme(plot.title = element_text(size=10), plot.caption = element_text(size = 6)) +
  guides(size = "none")

#Graduation

bihar %>% 
  ggplot(aes(x = popshare_community, y = grad_total, fill = as.factor(dummy.x), size = total_pop)) + 
  geom_point(alpha = 0.4, shape = 21, color = "black") + scale_y_log10() + scale_color_viridis_b(aesthetics = "colour") + 
  theme(axis.text.x = element_text(size = 5.5), axis.title = element_text(size = 9)) +
  xlab("Community Population as a Fraction of Total SC/ST Population ") + 
  ylab("Log of Quantum of Graduation Attainment") +
  labs(fill = "SC/ST") + scale_fill_discrete(labels = c("SC", "ST")) + 
  ggtitle("Community Size vs Graduation: Top 10 SC and ST in Bihar") +
  labs(caption = "Source: Data from Census 2011 Appendices A-10, A-11, SC-08, ST-08.") + 
  theme(plot.title = element_text(size=10), plot.caption = element_text(size = 6)) +
  guides(size = "none")


################################################################################

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






