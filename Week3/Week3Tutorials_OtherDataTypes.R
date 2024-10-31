#Lists - essentially multiple vectors in one object

c(4, 6, "dog")
list(4, 6, "dog")

a<- list(4, 6, "dog")
class(a)
str(a)

b <- list(4, letters, "dog")
str(b)

length(b)
length(b[[2]])
# 2 is the index value of letters from above bc is is number 2 in the order of the list
# The above code is examining the length of letters

#QUESTION ----
# What is the difference between values and data in environments? 

# Data frames 
letters
data.frame(letters)
df <- data.frame(letters)
length(df) #length is the number of columns
dim(df) #26 rows, 1 column
nrow(df)
ncol(df)

df2 <- data.frame(letters, letters)
str(df)
dim(df2)

data.frame(letters, "dog")
data.frame(letters, 1:2)
data.frame(letters, 1:3)

# matrices
matrix(nrow = 10, ncol = 10)
matrix(1:10, nrow = 10, ncol = 10, byrow = TRUE)
n <- matrix(1:10, nrow = 10, ncol = 10, byrow = TRUE)
n[1,7]
n[c(1, 2), c(5, 6)]

# arrays - 3d matrices: x, y, and z value

## HONESTLY PRETTY LOST AFTER THIS POINT
# factors - fancy characters with some sort of order to them. Think of the pain scale at the doctors
response <- factor(c("no", "yes", "maybe", "no", "maybe", "no"))
class(response)
levels(response)
nlevels(response)
#below, typeof ends up being integer even though our values appear to be words.
#This is because R sees them as a number and level
typeof(response)
#typeof is an integer instead of character bc these are the qualitative identifiers
response

response <- factor(response, levels = c("yes", "maybe", "no"))
response

#convert the factor to character
as.character(response)

year_fct <- factor(c(1990, 1983, 1977, 1998, 1990))
year_fct
#Convert to numeric
as.numeric(year_fct)
as.numeric(as.character(year_fct))

# Renaming 
levels(response)
levels(response)[1] <- "YES"
response

levels(response) <- c("YES", "MAYBE", "NO")
response
