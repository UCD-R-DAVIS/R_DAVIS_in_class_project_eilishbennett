#Week 3 Homework

#Reading the data in 
surveys <- read.csv("data/portal_data_joined.csv")

# Determining the names of the columns 
colnames(surveys)

#Creating a subset of data that is the first 5000 rows and the species_id, the weight, and the plot_type columns. 
surveys_base <- surveys[1:5000, c(6, 9, 13)]
class(surveys)

#Converting the species_id and plot_type columns to factors 
factor_species_id <- factor(surveys$species_id)
class(factor_species_id)

factor_plot_type <- factor(surveys$plot_type)
class(factor_plot_type)

# Remove all rows where there is an NA in the weight column. My way 
surveys["weight"]

surveys_weight_cleaned <- surveys[!is.na(surveys$weight), ]

head(surveys["weight"])
head(surveys_weight_cleaned["weight"])

# Removing all NA values from HW answers - does this erase all NA in the whole df? You didn't need to isolate the weigth column?----
surveys_base <- surveys_base[complete.cases(surveys_base), ]

head(surveys_base["weight"])

#Exploring new factor variables 
levels(factor_species_id)

typeof(factor_species_id)
class(factor_species_id)

#Why might we want to use factors? Can you think of any examples? 
# No, I do not understand this and can't think of any examples. 

#Do not understand challenge
challenge_base <- surveys_weight_cleaned()