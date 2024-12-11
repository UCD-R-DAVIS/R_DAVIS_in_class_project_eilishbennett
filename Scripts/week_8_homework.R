#Week 8 Homework 
library(readr)
mloa <- read_csv("https://raw.githubusercontent.com/gge-ucd/R-DAVIS/master/data/mauna_loa_met_2001_minute.csv")

#Use the README file associated with the Mauna Loa dataset to determine in what time zone the data are reported, and how missing values are reported in each column.
##Time zone is UTC
##With the mloa data.frame, remove observations with missing values in rel_humid, temp_C_2m, and windSpeed_m_s. 
#Missing data are reported as rel_humid(-99); temp_C_2m (-999.9), windSpeed_m_s(-999.9). 
library(tidyverse)
mloa_cleaned <- mloa %>% 
  filter(rel_humid > -99 & temp_C_2m > -999.9 & windSpeed_m_s > -999.9)
summary(mloa_cleaned)

#^ a better way to do this may be to reclassify those NA values as NA values and filtering those out  

#Generate a column called “datetime” using the year, month, day, hour24, and min columns. 

mloa_cleaned <- mloa_cleaned %>% 
  mutate(datetime = make_datetime(year, month, day, hour24, min))
head(mloa_cleaned$datetime)


#another way would be using the paste function to put all the columns together and add a part for separation (see R class script)

#Next, create a column called “datetimeLocal” that converts the datetime column to Pacific/Honolulu time (HINT: look at the lubridate function called with_tz(). 
library(lubridate)
library(dplyr)
library(readr)

?with_tz

mloa_local <- mloa_cleaned %>% 
  mutate(datetimeLocal = with_tz(datetime, tzone = "HST"))
#this shifts everthing back to HST, not just changes the label from UTC to HST. Hope that is okay. 

#Then, use dplyr to calculate the mean hourly temperature each month using the temp_C_2m column and the datetimeLocal columns. (HINT: Look at the lubridate functions called month() and hour()).

mloa_local_mean <- mloa_local %>% 
  mutate(localmonth = month(datetimeLocal), 
         localhour = hour(datetimeLocal)) %>% 
  group_by(localmonth, localhour) %>% 
  summarize(mean_hourly_temp = mean(temp_C_2m))


#Finally, make a ggplot scatterplot of the mean monthly temperature, with points colored by local hour.
library(ggplot2)
library(ggthemes)
ggplot(mloa_local_mean, aes(x = localmonth, y = mean_hourly_temp)) +
  geom_point(aes(color = localhour))+
  scale_color_viridis_c() +
  labs( title = "Mean Hourly Temperature by Month", 
        x = "Month", 
        y = "Mean Temperature C",
        color = "Hour of Day")+
  theme_calc() 

#future adaptations: fixing color scale to be bipolar but same on both ends, assigning months on the x axis