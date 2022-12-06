
###********************WRITING FUNCTIONS IN R PROGRAMMING*******************************###
###*************************************************************************************###
###*************************************************************************************###

## Let us take a big intellectual step in programming: from function "user" to function "writer". It is also a big leap from "user" to "developer" 
##There are over 10,000 packages in R but we still need to write our own functions. We have been using the functions since the first day we start learning R.
## 
## What is the difference between built-in function versus user-defined function?

## When should we consider writing a function: If we are copying-pasting the code more than twice, then we should actively consider writing the functions.
## What is function? In simple language, function takes some input, perform some actions on input and returns a value.
## In formal language: Functions are often used to encapsulate a "sequence of expressions" that need to be executed numerous times, 
## perhaps under "slightly different conditions". What do we mean by slightly different conditions? Think in terms of different values we can pass to the arguments.
## Please go through this excellent short tutorial on functions https://www.tutorialspoint.com/r/r_functions.htm

## R is a functional programming language. Very powerful idea. We will explore this idea in great detail when we will study the "apply" family of functions and purr package(Tidyverse)
## What does the functional programming language mean? Functional programming is the one in which functions are first-class object. Okay what do we mean by "first-class-object"?
## Function is a first-class object mean 1. we can assign a name to the function as we do to any other R object 2. We can pass function as an argument to another function 
## 3. we can return a function from another function. 4. Just like any-other R object, we can store a function as an element in the list.

## What is a syntax of function in R
function_name <- function(arg_1, arg_2, ...) { ## we use keyword "function" to define the function. It is followed by arguments in the round bracket.
  #Function body                               ## function body is enclosed in the pair of curly braces.Function body includes the sequence of expressions that are evaluated.
}


##Let us write our first function in R. This function square each element of atomic vector.

square_element <- function(a) {         ## "function" keyword
  for(i in a) {                        ## Am I looping over the values or indices in the for loop? Recall the last lecture on loops.
    b <- i^2
    print(b)
    ## What will this function returns? The last expression on the body of function is returned.    
  }
}

## How to know if we have written the function properly?

numeric_vector_1 <- c(1, 2.5, 7, 9, 12, 15.5)
numeric_vector_2 <- seq(from=1, to =10, by=2)
character_vector_3 <- c("a","b","c","d")

## let us call our first function that we just wrote
## Pay close attention how we call the function. function_name(args_1, args_2,...). Function name should communicate the functionality of function. How to give a good name to function?

square_element(a=numeric_vector_1)
square_element(numeric_vector_2)
square_element(character_vector_3) ## will give an error because the expression in the body of function are non-numeric

## How can we make the above function to cube (instead of square) each element of the vector? What change I need to make in the body of above function?
## And if we want to take the fourth power of each element in the numeric vector? Hint: Argument

##*************Writing function that takes three-dots as one of its arguments****************##
## How to return any expression before the last expression in the body of function?
## Returning the single value versus returning multiple values from the function?
## Use of dot-dot-dot as an function argument

# Let us write the summary statistics function
?mean
?sd
?median

sum_stat_func <- function(x){
  mn     <-     mean(x)
  st_dev <-     sd(x)
  med    <-     median(x)
  med
}

##list(computed_mean = mn, computed_std= st_dev, computed_median= med)

sum_stat_func(numeric_vector_1)

numeric_missing_NA <- c(1, 2, 5.5, NA)
sum_stat_func(numeric_missing_NA)

##****************writing function that takes function as one of its arguments**************###

## let us write function that takes mean() of each column in dataframe. We start writing the code from function body.

func_mean   <- function(df){
  
  output_func <- vector("double", ncol(df))
  for (i in seq_along(df)){
    output_func[[i]] <- mean(df[[i]])
  }
  
  output_func
}



func_mean(mtcars)   ## Calling a function on mtcars dataset.

## What I need to change in the body of the func_mean() to compute the median (or standard deviation) of each column in input dataset?

##**********Passing user-defined function as an argument to the apply family of functions************************###
## I want to multiply each column in dataset by 2. Let us write our own simple function and then subsequently pass it to lapply().

## Passing a function to lapply(): named function vs anonymous function

multiply_by_two <- function(x) x*2

lapply(mtcars, multiply_by_two)
