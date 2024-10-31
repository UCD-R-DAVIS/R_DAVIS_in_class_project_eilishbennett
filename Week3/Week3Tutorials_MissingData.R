# Missing data ----
NA # special character
NaN 

"NA" # do not use quotes for NA values in R - it makes it into a character 

heights <- c(2, 4, 4, NA, 6)

mean(heights)
max(heights)
sum(heights)

mean(heights, na.rm = TRUE)
mean(heights, na.rm = T)

is.na(heights)
!is.na(heights)


## Ways to exclude NAs from vectors
heights[!is.na(heights)]

heights [complete.cases(heights)]

