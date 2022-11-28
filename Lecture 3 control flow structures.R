
## Better to use excel if we are not comfortable with the list data structure in R. Extremely flexible and useful data structure.

x <- list(1:3, "a", 4:6) # Is it a named list?  How many elements we have in this list?

str(x) ## what information this function gives?

x[[1]] ## What will be the output data structure if I pull the first element in list x with [[]]?

x[1]  ## what will be the output data structure if I pull the first element in list x with []?

x[c(2,3)] ## what will be the output and its data structure?

x[[1]][[2]] ## output and its data structure? [[1]] will subset the first element (c(1,2,3)) of the list as an atomic vector and [[2]] will subset the second sub-elment of this atomic vector. Therefore we will get 2

x[[3]] ##what will be the length of this element?

length(x[[3]])

y<-list(1,2,3,4,5,7) ## this is a list but all the elements of the list have same datatype. Can I flatten this list to an atomic vector?

unlist(y) ## it gives you an atomic vector.

w<-list(list(1,2,5), c(1,2,3)) ## w is a list of one list and atomic vector. In other words, we have one nested list in another list.

w[[1]] ##obviously I am getting back the first element but the big question is whether I am going to get the first element as an atomic vector or list?

##If I want to get the all the sub-elements of first element as an atomic vector what should I do? Try to recall it you just have learnt it

unlist(w[[1]]) ## unlist it and you will get the atomic vector.

w[[1]][1] ## output and its structure?

w[[1]][[1]] ## output and its structure

w[[1]][c(1,2,3)] 

w[[2]] #output and its structure

w[2]  # output and its structure.

w[[3]] ##what do you think what would I get if I run this line? Do we have third element in the list w?

w[[3]]<-list(5,6,7) ## I am adding third element in the original list "w" using the combination of subsetting and assignment.

w

w[[3]]<-NULL ##what is this line of code doing? Removing the third element from the list

w[[2]]<- list("1","2","3") ## Replacing the second element in w (which is an atmoic vector) with the list("1","2","3"). We are modifying in place i.e. we are replacing the 2nd element with the new element in an original R object "w"
w

z<-list(nums=c(1,2,3,4),chars =c("A","B","C"), nested_list = list(1,2,3))

z$nested_list ##what will be the data structure?

(z$nested_list)[[1]] ##output and its data structure?

(z$nested_list)[1]   ##output and its data structure?

z$nums        ##output and its data structure please

(z$chars)[1]  ##output and its data structure.

df1 <- tibble(
  g = c(1, 2, 3),
  data = list(                  ##list of tibbles. That we will study in Level II
    tibble(x = 1, y = 2),
    tibble(x = 4:5, y = 6:7),
    tibble(x = 10)
  )
)

str(df1)
##**************************************LEVEL I SESSION III****************************##
##**************************************Control flow structure***********************##

##The basic form of an if statement in R is as follows:
## Syntax of the if statement in R programming language
## if (condition) true_action
## if (condition) true_action else false_action

## Typically the actions are compound statements contained within {}

x<-65     ## vector of length 1
##x <-c(80,50,60,70) ## vector of length 4. Read the warning message carefully.

  if (x > 90) {        ## Remember that the condition should evaluate to a single TRUE or FALSE.If the condition evaluates to a logical vector of length greater than 1, then the if statement is executed for the first element of logical vector. 
    "A"
  } else if (x > 80) {
    "B"
  } else if (x > 50) {
    "C"
  } else {
    "F"
  }


?Vectorize  ## The first argument of vectorize function is the function we want to vectorize

grade <- function(x){     ## grade is a scalar function
  if (x > 90) {       
    "A"
  } else if (x > 80) {
    "B"
  } else if (x > 50) {
    "C"
  } else {
    "F"
  }
}

grade(x) 
grade<-Vectorize(FUN=grade,"x") ## This is how you can vectorize a scalar function. After vectorizing the grade function, the grade function can now work with input vector greater than length 1
grade(x)

##******************* Invalid inputs*******************************###
#The condition should evaluate to a single TRUE or FALSE. Most other inputs will generate an error

if ("x") 1 ## What output will we get?

if (NA) 1  ## What output will we get?
##a Remember that logical vector of length greater than 1 generates a warning
if (c(TRUE, FALSE)) 50 else 100 ## What is the output we are going to get? 50 or 100. And are we going to get the warning in this case?

##**************************Vectorized if**************************###
#Given that if statement only works with a single TRUE or FALSE, you might wonder what to do if you have a vector of logical values.
## Handling vector of values is the job of ifelse()

x <- 1:10
ifelse(x %% 5 == 0, "XXX", as.character(x)) ## ifelse function can work with vector of logical of any length.

ifelse(x %% 2 == 0, "even", "odd")

ifelse(TRUE, 1, "no") ## What is the output? Be quick
ifelse(FALSE, 1, "no") 
ifelse("p", 1, "no") 

##************************case_when()******************************###
##case_when uses a special syntax to allow any number of condition-vector pairs

x<- 1:50

dplyr::case_when(
  x %% 35 == 0 ~ "fizz buzz", ## observes the data type of output.
  x %% 5 == 0 ~ "fizz",
  x %% 7 == 0 ~ "buzz",
  is.na(x) ~ "???",
  TRUE ~ as.character(x)  ## last expression is executed for all other TRUE conditions. IN other words, if all the above conditions are FALSE, then the last condition will be executed.
)


mtcars

toy_mtcars <- mtcars
toy_mtcars

toy_mtcars$gear<- dplyr::case_when(
                  toy_mtcars$gear==4 ~ 8,
                  toy_mtcars$gear==3 ~ 10,
                  TRUE ~ mtcars$gear)



##***********Difference between & and && and difference between | and ||*********************###
# Single and (&) and Single (OR) are vectorized. Whereas double and (&&) and double or (||) are not vectorized.
# Recall we use single and (&) and single or (|) in subsetting. What if we use double and in the subsetting? Any idea what will happen if we use double and (&&) in subsetting ?

## Combining more than one logical conditions inside the if statement using the boolean operator.
logical_1<-c(T, F, T, F)
logical_2<-c(T, F, T, T )

logical_1 & logical_2  ## vectorized
logical_1 | logical_2  ## vectorized

logical_1 && logical_2 ## only first element of the two logical vectors will be used to get the single true or false.
logical_1 || logical_2 ## only first element of the two logical vectors will be used to get the single true or false.

math    <-    c(90, 80, 60, 95, 80)  
physics <-    c(83, 54, 98, 45, 92)

if ((math > 85) && (physics > 85)){ ## Good to combine the multiple logical conditions in the ifstatement() with && and ||
  
  print("brilliant student")
  
}else {
  
  print("Not so brilliant")
}

##*********************************Short Quiz********************************************###

## Without "executing them", determine which of the following
##if statements would result in the string being printed to the console
vec1 <- c(2,1,1,3,2,1,0)
vec2 <- c(3,8,2,2,0,0,0)

if((vec1[1]+vec2[2])==10){ 
  "I am learning R quickly"
}


if((vec1[2]+vec2[2]) == 10){ 
  "Vector Subsetting in R is confusing "
} else {
  "Vector Subsetting in R is awesome"
}


## What will be printed in console
## Example of nested if else()
## You need money and time to go to the parties in the US.

money <- FALSE
time  <- TRUE

if (money ==TRUE){
  if (time ==TRUE){
    "I will go to the party because I have money and time"
  }else{
    "I will not go to the party I have money but no time"
  }
}else {
  "I have no money I cannot go to the party"
}

## Using vec1 and vec2 from (a), write and execute a line of code
## that multiplies the corresponding elements of the two vectors
## together if their sum is greater than 3. Otherwise, the code
## should simply sum the two elements.

##***********************************  LOOPS        *************************************###
##*******FOR LOOPS***********************************************************************###
##****for loops are used to iterate over items in a vector. They have the following basic form
## for (item in vector) perform_action
for (i in 1:3) { ## we use for loop when we know the number of iterations in advance. How many iterations we are going to have in this for loop?
  print(i)
}

##When iterating over a vector of indices, it's conventional to use very short variable names like i, j, or k.)

## R is a vectorized language we rarely need to write for loop in R programming language.

num1 <- c(10, 15, 19, 34)
num2 <- c(5, 11, 13, 15)

num1 + num2 ## This + is a vectorized function known as infix function. If + is not a vectorized function, then we need to add the numbers in num1 and num2 by for loop


num_output <- vector("double", 4)

for (j in 1:length(num1)){
  num_output[j] <- num1[j] + num2[j] ## Here I am using + in a non-vectorized manner.
}

num_output


##***************    Practice question ********************************##
## Find the mean of each column in mtcars dataset using the for loop?
## Find the unique values of each column in mtcars dataset using the for loop?





