rm(num_samples)
rm(x)
rm(y)
# Above, removing variables in the environment that were from the Week2 Videos. 

# Code below copied from homework. Question: how did this code generate so many values and variables? Where does it all come from? 
set.seed(15)
hw2 <- runif(50, 4, 50)
hw2 <- replace(hw2, c(4,12,22,27), NA)
hw2

# Instruction: Take your hw2 vector and removed all the NAs then select all the numbers between 14 and 38 inclusive, call this vector prob1.
na.omit(hw2)
hw2

#Question: I used a different code for this, the example uses a function with an exclamation point. How does that function work?
prob1 <- na.omit(hw2)
prob1 <- prob1[prob1 >= 14 & prob1 <= 38]
prob1

# Instruction: Multiply each number in the prob1 vector by 3 to create a new vector called times3. Then add 10 to each number in your times3 vector to create a new vector called plus10.
times3 <- (prob1)*3
times3

plus10 <- (times3)+10
plus10

# Instruction: Select every other number in your plus10 vector by selecting the first number, not the second, the third, not the fourth, etc. If you’ve worked through these three problems in order, you should now have a vector that is 12 numbers long that looks exactly like this one:
final <- plus10[c(TRUE,FALSE)]
final
