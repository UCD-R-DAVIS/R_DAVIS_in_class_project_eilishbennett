# Determining working directory and filepaths ----
getwd()

#How to change working directory to a different location in your files 
setwd()
# with file location within the parenthesis ^ after "setwd" 

d <- read.csv("./data/tail_length.csv")


dir.create("./lectures")


#HOW R THINKS ABOUT DATA ----
weight_g <- c(50, 60, 65, 82)
animals <- c("mouse", "rat", "dog")

#inspection of vectors
length(weight_g)
str(weight_g)

# Change vectors ----
weight_g <- c(weight_g, 90)
weight_g

?c

#CHALLENGE ----
num_char <- c(1, 2, 3, "a")
num_logical <- c(1, 2, 3, TRUE)

char_logical <- c("a", "b", "c", TRUE)
tricky <- c(1, 2, 3, "4")

class(num_char)
class(num_logical)
class(char_logical)
class(tricky)

#Vectors must be the SAME class of values


## Subsetting ---- 
animals <- c("mouse", "rat", "dog", "cat")
animals[2]
animals[c(2,3)]

# Conditional subsetting 
weight_g <- c(21, 34, 39, 54, 55)
weight_g > 50
weight_g[weight_g > 50]

# Symbols ----
animals
#"mouse", "rat", "dog", "cat" 
animals %in% c("rat", "cat", "dog", "duck", "goat")
