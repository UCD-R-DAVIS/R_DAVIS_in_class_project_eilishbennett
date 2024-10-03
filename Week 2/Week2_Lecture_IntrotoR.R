1+2
2*5

#R follows order of operations 
4+(8*3)^2
4+8*3^2

#scientific notation 
2/100000
4e3


#mathematical function
exp(3)
log(4)


#log help files
?log
log(2,4)
log(4,2)

#specifying which place is which 
log(x=2, base=4)


x <- 1
x

#avoid naming variables x or y
rm(x)


#nested functions
sqrt(exp(4))


#comparison functions
## defining/creating a variable 
mynumber <- 6
## questioning value of variable (must use double equals signs) 
mynumber == 5
## questioning is 5 is NOT the value of my variable
mynumber != 5

mynumber > 4
mynumber < 3
mynumber >= 2
mynumber <= 1


## objects and assignment 
mynumber <- 7
 othernumber<- -3
mynumber * othernumber  


# object name conventions
numSamples <- 50
num_samples <- 40

rm(num_samples)

ls()

#errors and warnings
log_of_word <- log("a_word")
log_of_word

log_of_nagtive <- log(-2)
log_of_nagtive 

#challenge 

elephant1_kg <- 3492
elephant2_lb <- 7757

elephant1_lb <- elephant1_kg * 2.2 

elephant2_lb > elephant1_lb 

myelephants <- c(elephant1_lb, elephant2_lb)
myelephants
which(myelephants == max (myelephants))
