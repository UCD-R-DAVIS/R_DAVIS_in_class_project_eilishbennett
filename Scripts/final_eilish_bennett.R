#Final Assignment!

#Read in the file tyler_activity_laps_12-6.csv from the class github page. This file is at url https://raw.githubusercontent.com/UCD-R-DAVIS/R-DAVIS/refs/heads/main/data/tyler_activity_laps_12-6.csv, so you can code that url value as a string object in R and call read_csv() on that object. The file is a .csv file where each row is a “lap” from an activity Tyler tracked with his watch.
activities <- read_csv("https://raw.githubusercontent.com/UCD-R-DAVIS/R-DAVIS/refs/heads/main/data/tyler_activity_laps_12-6.csv")


#Filter out any non-running activities.
unique(activities$sport)
running <- activities %>% 
  filter(sport == "running")

#We are interested in normal running. You can assume that any lap with a pace above 10 minutes_per_mile pace is walking, so remove those laps. You should also remove any abnormally fast laps (< 5 minute_per_mile pace) and abnormally short records where the total elapsed time is one minute or less.

running_normal <- running %>% 
  filter(minutes_per_mile > 5 & minutes_per_mile < 10 & total_elapsed_time_s > 60)

max(running_normal$minutes_per_mile)
min(running_normal$total_elapsed_time_s)

#Group observations into three time periods corresponding to pre-2024 running, Tyler’s initial rehab efforts from January to June of this year, and activities from July to the present.

head(running_normal)

library(dplyr)
grouped_running <- running_normal %>% 
  mutate(time_period = case_when(
    year < 2024 ~ "pre2024", 
    timestamp >= as.POSIXct("2024-01-01") & timestamp <= as.POSIXct("2024-06-30") ~ "januarytojune", 
    timestamp > as.POSIXct("2024-06-30") ~ "julytopresent", 
    TRUE ~ "other"))

grouped_running2 <- grouped_running %>% 
  group_by(time_period) %>% 
  summarize(mean_mile = mean(minutes_per_mile))
grouped_running

#Make a scatter plot that graphs SPM over speed by lap.
library(ggplot2)

#Make 5 aesthetic changes to the plot to improve the visual. 
library(ggthemes)
ggplot(grouped_running, mapping = aes(x = steps_per_minute, y = minutes_per_mile)) + 
  geom_point(alpha = 0.1, color = "green") + 
  theme_clean() +
  labs(x = "Strides per Minute", y = "Speed (minutes per mile)")+
  ggtitle("Relationship between Tyler's Speed and Cadence")

#Add linear (i.e., straight) trendlines to the plot to show the relationship between speed and SPM for each of the three time periods (hint: you might want to check out the options for geom_smooth())
ggplot(grouped_running, mapping = aes(x = steps_per_minute, y = minutes_per_mile)) + 
  geom_point(alpha = 0.1, color = "lightgreen") + 
  theme_clean() +
  labs(x = "Strides per Minute", y = "Speed (minutes per mile)")+
  ggtitle("Relationship between Tyler's Speed and Cadence")+
  facet_wrap(~time_period, ncol = 1) +
  geom_smooth(method = "lm", se = FALSE, color = "orange")

#Does this relationship maintain or break down as Tyler gets tired? Focus just on post-intervention runs (after July 1, 2024). Make a plot (of your choosing) that shows SPM vs. speed by lap. Use the timestamp indicator to assign lap numbers, assuming that all laps on a given day correspond to the same run (hint: check out the rank() function). Select only laps 1-3 (Tyler never runs more than three miles these days). Make a plot that shows SPM, speed, and lap number (pick a visualization that you think best shows these three variables).

after_intervention <- grouped_running %>% 
  filter(time_period == "julytopresent")

ggplot(after_intervention, mapping = aes(x = steps_per_minute, y = minutes_per_mile)) + 
  geom_point(alpha = 0.1, color = "lightgreen") + 
  theme_clean() +
  labs(x = "Strides per Minute", y = "Speed (minutes per mile)")+
  ggtitle("Relationship between Tyler's Speed and Cadence")+
  geom_smooth(method = "lm", se = FALSE, color = "orange")

