library(tidyverse) 
library(dslabs)

d <- read_csv("times.txt")

head(d)

tidy_data <- d %>%
  gather(key = "key", value = "value", -age_group)%>%
  separate(col = key, into = c("year", "variable_name"), sep = "_")%>% 
  spread(key = variable_name, value = value)

tidy_data