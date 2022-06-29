library(tidyverse) 
library(dslabs)

admissions
data(admissions)
dat <- admissions %>% select(-applicants)

dat_tidy <- spread(dat, gender, admitted)
dat_tidy

tmp <- gather(admissions, key, value, admitted:applicants)
tmp

tmp2 <- unite(tmp, column_name, c(key, gender))
tmp2

tmp3 <- tmp2 %>% spread(column_name, value)
tmp3