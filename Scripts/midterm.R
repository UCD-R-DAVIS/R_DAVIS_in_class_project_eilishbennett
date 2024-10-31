#Midterm

library(readr)
tyler_activity <- "https://raw.githubusercontent.com/ucd-cepb/R-DAVIS/refs/heads/main/data/tyler_activity_laps_10-24.csv"

library(tidyverse)
view(tyler_activity)
head(tyler_activity)

tyler_activity_data <- read_csv(tyler_activity)

head(tyler_activity_data)

tyler_running <- tyler_activity_data %>% 
  filter(sport == "running")
head(tyler_running)

view(tyler_running)
str(tyler_running)
summary(tyler_running$minutes_per_mile)

tyler_running_pace <- tyler_running %>% 
  filter(minutes_per_mile < 10 & minutes_per_mile > 5)
view(tyler_running_pace)

head(tyler_running_pace)
summary(tyler_running_pace$minutes_per_mile)
