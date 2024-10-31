# Vector Math 

x<- 1:10
x

x + 3
x * 10

x + c(3)

y <- 100:109
y

x + y
cbind(x, y, x+y)

# Adding vectors of different lengths 
## Result is that the shorter vector will be repeated through until the length of the longer is matched
z<- 1:2
z
x + z

cbind(x, z, x + z)

## What happens if the shorter vector is not a multiple of the larger?
z <- 1:3
cbind(x, z, x + 2)

a <- x + z

x[c(TRUE, FALSE)]
x[c(TRUE, FALSE, FALSE)]
