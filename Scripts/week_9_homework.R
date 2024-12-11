#Week 9 homework
library(dplyr)
library(tidyverse)
surveys <- read.csv("data/portal_data_joined.csv")
head(surveys)

#Using a for loop, print to the console the longest species name of each taxon. Hint: the function nchar() gets you the number of characters in a string.
#group by taxa and then apply the nchar() function and then put it in a for loop
#actually, we will not use group by but instead the unique function

rodent <- surveys %>%
  filter(taxa == "Rodent")
max_rodent_name <- max(nchar(rodent$species))

unique_taxa <- unique(surveys$taxa)
print(unique_taxa)

for(i in unique_taxa){
  specific_taxa <- subset(surveys, taxa == i)
  longest_species_name <- specific_taxa$species[which.max(nchar(specific_taxa$species))]
    print(paste("Longest species in", i, ":", longest_species_name))
}

library(purrr)

#2 Use the map function from purrr to print the max of each of the following columns: “windDir”,“windSpeed_m_s”,“baro_hPa”,“temp_C_2m”,“temp_C_10m”,“temp_C_towertop”,“rel_humid”,and “precip_intens_mm_hr”. 

mloa <- read_csv("https://raw.githubusercontent.com/ucd-cepb/R-DAVIS/master/data/mauna_loa_met_2001_minute.csv")

needed_columns <- mloa %>% select(columns_of_interest <- c("windDir", "windSpeed_m_s", "baro_hPa", 
                                             "temp_C_2m", "temp_C_10m", "temp_C_towertop", 
                                             "rel_humid", "precip_intens_mm_hr"))


needed_columns %>%  map(max)
#3 Make a function called C_to_F that converts Celsius to Fahrenheit. Hint: first you need to multiply the Celsius temperature by 1.8, then add 32. Make three new columns called “temp_F_2m”, “temp_F_10m”, and “temp_F_towertop” by applying this function to columns “temp_C_2m”, “temp_C_10m”, and “temp_C_towertop”. Bonus: can you do this by using map_df? Don’t forget to name your new columns “temp_F…” and not “temp_C…”!

C_to_F <- function(x) {
  (x*1.8)+32
}

C_to_F(0)

#how to make new columns? 

mloa$temp_F_2m <- C_to_F(mloa$temp_C_2m)
mloa$temp_F_10m <- C_to_F(mloa$temp_C_10m)
mloa$temp_F_towertop <- C_to_F(mloa$temp_C_towertop)
