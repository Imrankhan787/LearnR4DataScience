##***********************************  LOOPS        *************************************###
## Loops are useful when we want to perform the same operation on the sequence of elements.
## R is a vectorized language we need to write for loop less often in R.
## Apply family of functions also largely eliminates the need to write for loop in R. 

##***************************FOR LOOPS***************************************************###
##****for loops are used to iterate over items in a vector. They have the following basic form
## for (item in vector) perform_action

for (i in 1:3) {                            ## we use "for" loop when we know the number of iterations in advance. For example, how many times we have to print the number?
  print(i)
}


## Two variants of for loop: 1. looping over the element 2. looping over the numeric indices
sibling_names <- c("Andy","Billy","Cathy","David")
## Looping over the element

for (name in sibling_names){ ## Looping over the elements directly.
  print(name)
}

## Looping over the indices

for (i in seq_along(sibling_names)){  ##Looping over the position (index) of the elements is preferred because it is very easy to store the output in each iteration. Think why?
  print(sibling_names[i])
}

##When iterating over a vector of indices, it's conventional to use very short variable names like i, j, or k.)

## R is a vectorized language we rarely need to write for loop in R programming language.

num1 <- c(10, 15, 19, 34)      ##if num1 and num2 were list, then you cannot simply add the respective elements of the two lists using for loop 
num2 <- c(5, 11, 13, 15)

num1 + num2 ## This + is a vectorized function known as infix function. If + is not a vectorized function, then we need to add the numbers in num1 and num2 using for loop

## Allocating the space for output. Anticipate the output which you will get from each iteration. What is the appropriate output structure to store the output of each iteration? 
## Two things are important regarding the output data structure 1. specifying the appropriate type of output data structure (character, logical, integer, double, list) to store the result of each iteration.2. length of data structure
## Sequence:i in seq_along(df) (or i in 1:length(x)). This determines what to loop over: each run of the for loop will assign i to a different value from seq_along(df)
## Body of code to execute for each iteration

num_output <- vector("double", 4) 
for (j in 1:length(num1)){  
  num_output[j] <- num1[j] + num2[j] ## Here I am using + in a non-vectorized manner.
}

num_output

##   There are two ways to terminate for loop early: Use of next and break in the for loop
##   next exits the current iteration.
##   break exits the entire for loop.

for (i in 1:10) {
  if (i < 3) 
    next
  
  print(i)
  
  if (i >= 5)
    break
}
##mean of each column in mtcars dataset using the for loop

output_mean <- vector("double", ncol(mtcars))
for (i in seq_along(mtcars)){
  output_mean[[i]] <- mean(mtcars[[i]])
}

output_mean

## if for loop were not there, then we would have to apply mean function on each column one at a time.
mean(mtcars$mpg)

##*************** class of each column in iris dataset using the for loop****************##
output_class <- vector("character",ncol(iris))

for (j in 1:length(iris)){
  
  output_class[[j]] <-class(iris[[j]])
  
}

output_class


##***************    Practice question in class ********************************##
unique(mtcars$cyl)

## Find the unique values of each column in mtcars dataset using the for loop? ## We don't know the output length of each iteration in advance.


##******************While loop*************************************************##
##* In while loop we don't know the exact number of iterations in advance.
##* Syntax:while(condition) action: performs action while condition is TRUE

samp <-sample(1:1000, 800)

m <- 1

while (samp[m] %% 50 !=0) { ## Run this while loop as long as we don't find the number in samp that is completely divisible by 50. We don't know the position in advance in samp vector at which we will first find the number completely divisible by 50
  cat("We did not find the number completely divisible by 50 in iteration # ", m, "\n")
  m <- m + 1
}












