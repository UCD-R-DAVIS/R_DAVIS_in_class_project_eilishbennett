#Other data types 

##Lists ----

c(4, 6, "dog")
a <- list(4, 6, "dog")
class(a)
str(a)

# Data.frame
letters
data.frame(letters)
df <- data.frame(letters)
length(df)
dim(df)
nrow(df)
ncol(df)

# Factors ----
## Factors combine multiples things of information, the values and also the order of the values. 
animals <- factor(c('duck', 'duck', 'goose', 'goose'))
animals

animals <- factor(c('pigs', 'duck', 'duck', 'goose', 'goose'))
animals

class(animals)
levels(animals)
nlevels(animals)

animals <- factor(x = animals, levels = c('goose', 'pigs', 'duck'))
animals

year <- factor(c(1978, 1980, 1934, 1979))
year
class(year)
as.numeric(year)
levels(year)
