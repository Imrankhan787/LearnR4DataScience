
##install.packages("rlang")
library(rlang) ## run the above line if you have not installed the "rlang" package.
##********************Scoping rules and Environment in R programming**********************##
##*What are scoping rules? 
#  The scoping rules are the "act of binding values to the name(symbols)". 
#  R will search through the series of environments to bind the value to a symbol.
#  For example,If the same variable x (symbol) exists inside and outside the body of the function and two different values
#  are attached to this x variable. Which value of x will be used inside the body of function? the value of x that exists inside the
#  body of function or the value of x that exists outside the body of function.

## What is the concept of environment? Environment is a collection (or bag) of symbol-value pair.
## The job of an environment is "to associate, or bind, a set of names to a set of values".You can think of an 
## environment as a bag of names,with no "implied order" (i.e. it doesn't make sense to ask which is the first element in an environment).
## In some respects, environment is like a named list. In a named list, a set of names are also bound to the set of values.
## But in the named list, the order of set of name-value bindings matters but in the environment the order of name-value
## bindings does not matter.

## Each environment has a parent environment.
## The only environment without a parent is the empty environment.
## R will search through the "series of evironments" to associate a value to a symbol. 
#  When R reach the empty environment and it could not associate the value to a symbol then it throws an error.
env_parents() ## gives you the sequence of search list of environments in which R will look for a value for symbol. R will go to next environment in search list (of environments) if it could not associate a value to a symbol in the previous environment.
search() ## search() function in base R also gives the sequence of environment to bind the value to a symbol.
## When we are writing R code in the console we are in the global environment. We are always interacting with the single environment.

x <- 10
g01 <- function() {
  x <- 20
  x
}

g01() ## what is the value of x that this function call will return? And why?

x  ## what is the value of x that will be returned?

## x<-20 and x<-10 exists in two different environments.x <- 10 in the global environment and x <- 20 is bound in the
## execution environment (temporary environment that is created when the function is executed. We have a different execution environment each time function is called).

##********overriding previous values of variable in the same environment********************##
x <-50 ## Variable (symbol) x cannot have two different values attached to it in the "same environment".
## However, the same variable (symbol) can have two different values attached to it in the "different environment".
## Therefore, binding x to a new value 50 will override the previous value of x in the global environment. What was the previous value of x in the global environment? 
x  ## variable or symbol x has now value 50 attached to it in the global environment. R looked for the value for symbol (variable) x in the current environment which is also the global environment.

##*********What is the relationship between the execution environment (also sometimes referred to as runtime environment) of function and function environment?*********##
## Function environment is "always" the parent of the execution environment of the function.
## Function environment is the one where the function is defined.
## This example will illustrate the difference
add_y <- function(y){
           x <-10
         
           z<- x+y
         
           list(  execution_environment = current_env(), ## Execution environment is temporary
                  parent_execution_environment = env_parent(current_env()),
                  function_environment = fn_env(add_y),
                  objects_bindings_execution_environment = ls.str(environment())) ## function arguments and local variables of the functions are evaluated in the execution environment.
}
add_y(5)

##***********Scoping Rules***************************##

f <- function(a){  ## a is a function argument
  b <-5            ## b is a local variable defined inside the body of function. Local variable means that the value for symbol (or variable) b exists inside the body of function.
  a^2 + b/c        ## c is a free variable. It is neither a function argument nor local variable. R will search 
}

f(2)

#The question is how the R searches the value for symbol "c". The answer to this question is determined by the scoping rules of programming language.

##*************Lexical scoping rules*******************##
# R uses lexical scoping: it looks up the values of names based on how a function is "defined", not how it is "called".

#**********
#*********
k <- 10   
g01 <- function() {
  k <- 20       ## The value of k inside the body of function is 20. Lexical scoping will use that value of K. What if we don't have the value of k in the body of function?
  k
}

g01() ## function g01() is called from the global environment. The value of variable (symbol) k in the global environment is 10. 


#**********
#**********

m <- 10   ## the value of "m" exists in the environment in which the function p11() is defined.
p11 <- function(d){
  m*d             ## m is a free variable with no binding inside the body of function.
}

p11(5) ## the variable m is bound to the value 10 in the global environment. And the function p11() is also created in the global environment.

## R's lexical scoping follows four primary rules
#1.Name masking
#2.Functions versus variables
#3.A fresh start
#4.Dynamic lookup

##*****************************1.Name masking*****************************************##
##************************************************************************************##
##*The basic principle of lexical scoping is that names defined inside a function mask names defined outside a function
q <- 10
r <- 20
g02 <- function() {
  q <- 1   
  r <- 2
  c(r, q) ## values bound to q and r inside the body of function will be displayed when function g02() is called.
}
g02()

##*****What if the name is not defined inside the body of functions?***********##
h <- 2
g03 <- function() {
  i <- 1
  c(i, h)  ##What is the value of h inside the body of function? What is the value of h in the global environment?
  }
g03() ## When we call this function g03(), R will look one level up in the parent environment of the execution environment because R did not find the value in the execution environment (body of function)

##***********What if the function is defined inside the body of another function?***********##
##******************************************************************************************##

##IMPORTANT: use the functions ls.str(), current_env(), env_parent() and env_parents() to make the concept of scoping more clear.
## fn_env() gives you the function environment i.e., the environment where the function is created.

x <- 1
g04 <- function() {  ##outer function g04
  y <- 2
  
  i <- function() {  ## inner function
    z <- 3
    c(x, y, z)  ## z is a local variable.x and y are free variable inside the body of function i(). However, the value of y exists in the parent environment of the execution environment of function i().
                ## And the value of x will be accessed from the parent of the parent of the execution environment of funciton i()
  }
  i()
}
g04()

##*********Functions versus variables********************************************************##
##*Functions are just like another object in R. This means scoping rules are also same for the function.
##*Function g07() exists in the two different environments. One exists in the global environment. The other exists inside the body of function. 
g07 <- function(x) x + 1
g08 <- function() {
  g07 <- function(x) x + 100 
  g07(10) ## Which g07() function will be called? What will be the result of this function call?
}
g08()

##***********A fresh start*******************************************************************##
##*******************************************************************************************##

## Every time function is called a new "temporary" environment is created to host the execution of function.
## The execution environment of function is temporary. All the values that exist in the execution environment are also temporary.
## When the function is called for the next time, then the function does not have access to the values that it created in the execution of earlier function calls.
## Each function call is completely independent. The values that are bound to the variables in the execution environment of function are also temporary.
g11 <- function() {
  if (!exists("a")) {
    a <- 1
  } else {
    a <- a + 1
  }
  a
}

g11() ## What will be the value of variable "a" when the function is called first time?
g11() ## What will be the value of variable "a" when the function is called the second time?


##***********************************Dynamic lookup***********************************************##
##************************************************************************************************##
##*****"WHERE" to look for the values******
## Lexical scoping tells us where to look for values 
#If the value for symbol is not found inside the body of function, then  R looks for the value for the same symbol in the parent environment of execution environment.
#The parent environment of the execution environment is the same in which the function was defined (or created). 

##**********But the question is "WHEN" do the R looks for the values*************##
##**Dynamic look up means R looks for the values for a symbol when the function is "called" not when the function is "defined"

##**Together, these two properties (where to look and when to look) tell us that the output of a function can differ depending on the objects outside the function's environment.

g12 <- function() x + 1 
x <- 15
g12()  


x <- 20
g12()

##******Difference between "LEXICAL SCOPING" versus "DYNAMIC SCOOPING"*************##
##*********************************************************************************##
##*********************************************************************************##

#************** Don't confuse the dynamic scooping with "dynamic lookup"
# R follows lexical scoping. Lexcial scoping: we look for values where the function was defined not where the function was called.
# Dynamic scoping: we look for the values where the function was called.

## In the example below, please figure out these two question
#  What is the value of y where the function g(x) was defined?
#  What is the value of y where the function g(x) was called?

y <- 10
 
f <- function(x) {
       y <- 2
       y^2 + g(x)
  }

g <- function(x) { 
         x*y
}

f(3) ## what is the result you would get? If R were following dynamic scoping, what result we would have gotten?


##****Discuss lm() example if there is a time in the class*******************##






