##************Apply family of functions***************************##
##****************************************************************##

##******************************Matching the function arguments************************##
##*************************************************************************************##
##*************************************************************************************##

## We have been using function since the first lecture on programming. But let us be more organized. How to call a function in R?
vector_with_missing <- c(NA, 1 ,50, 25, 86, 95, rep(c(1,3), 5))

?mean ## What is the name of arguments that are passed to the mean function? Which arguments of the mean function have the default values? The default value is the most frequent value.

mean(vector_with_missing) ## Mean is a summary function. We cannot compute mean if there is a single missing value in the numeric vector.

mean(x=vector_with_missing,na.rm = T) ## We will compute the mean after removing the missing value from the above vector. na.rm means = T removes the missing value from the numeric vector.

mean(vector_with_missing, T) ## Why is the code not working? any guess. 

## Difference between passing named and unnamed arguments to the function.
mean(na.rm = T, x = vector_with_missing ) ## If we are giving named arguments, we can pass the named arguments to the function in any order. Order of the arguments does not matter if we are passing the named arguments.

mean(vector_with_missing, 0, T) ## Function arguments are un-named. Therefore, we cannot disturb the order of the arguments. This is also called matching the function arguments by position.

siblings <- c("Andy","Billy","Cathy","David","Emily","Frederick")

mean(siblings) ## Why are we getting error? Can we take the mean of Character vector? 

mean(mtcars) ## Why is this code not working? 

##Summary:Every function is designed to work with the particular data structure. Mean cannot work with character vector or data frame.Mean can work with numeric vector or logical.
## If we are passing the unnamed arguments to the function, then we should be careful about the "order" of the arguments.
## If we are passing the named argument to the function, then the order of the arguments does not matter.
##  Three dots mean function can take any number of named arguments.You will see many functions with three dots argument.
## Whatever function you are calling in R, the above points should always be in your mind.

?median  ## can you guys quickly compute the median of the numeric vector named above as "vector_with_missing"



##********************Apply family of functions*******************************##
## Welcome to functional programming: What is functional programming? Functions in R are first-class object. What is a first-class object?
## Apply family of functions eliminates the need to write for loop in R programming language.
## What is common in all apply family of functions? We pass a function as an argument to apply family of function. And the passed function is applied to each element of the list.

?apply
?lapply  ## returns the list of same length. What does the three dots do ?

lapply(mtcars, mean) ## Please note that we are passing the mean function without parentheses. Whenever we passes the function as an argument to another function, we don't put parentheses to the function passed as an argument.
## When we run the above code what is the data structure we got? Apply family of functions greatly reduces the need to write for loop.

lapply(mtcars, class) ## class function is applied to each column of mtcars. Returns the class of each column. Remember lapply returns the list.

lapply(iris, unique)

##passing additional argument
#****************************
#****************************
list_with_missing_values <- list(num1 =c(NA, 1:20), num2 = c(NA, NA, rep(c(1,2,3),4)), num3 = c(NA, NA, NA, seq(from=2, to=25, by=1)) ) ## Note that each element of this list has at least one NA value.

## Let us find the mean of each element of the list by lapply()

lapply(list_with_missing_values, mean) ## Why are we getting NA values for all of three elements of list? So what we do know. Remember lapply takes three dots argument. And mean takes na.rm argument.

?lapply ## This function takes three dot argument. These three dots will let you pass the additional argument to the mean function.
?mean   ## This function takes na.rm argument.

lapply(list_with_missing_values,mean, na.rm=T, trim = 0.15)

lapply(mtcars, mean, trim = 0.20)

##***********************Split() + lapply()********************************###
##*************************************************************************###
?split

##Split function along with lapply is very very powerful.
grouped_by_cylinder <- split(mtcars, mtcars$cyl) ## split the single dataframe into three sub-groups of dataframe. Why three groups of dataframe? we are getting back list

lapply(grouped_by_cylinder, function(x) lm(mpg~wt+disp+carb, data = x)) ## we are fitting a model to each of the three groups of dataframe. Dont worry about it now we will do it in Purr programming.

##*******************sapply()**********************************************###
## sapply() simplifies the output data structure when possible.
## What is the result of applying a function to each element of a list?
## If the result of applying a function to each element of input list is of length#1, then a vector is returned.
## If the result of applying a function to each element of input list is of the same length (> 1), a matrix is returned.
## If it can't figure things out, a list is returned.

sapply(mtcars, mean) ## Output is a named double vector because when we apply the mean to each element of mtcars, single value is returned
sapply(mtcars, range) ## Output is a matrix because when we apply the range function to each column (element) of mtcars two values (minimum and maximum) are returned.
sapply(mtcars, unique) ## returns a list.

##******************apply***************************************************###
##**************************************************************************###
?apply ## Apply() let us apply the function either to rows or columns. Margin = 1 indicates rows and Margin = 2 indicates column

apply(MARGIN = 1, X= mtcars, FUN= mean) ## What is this function doing? Am I matching the function arguments by position or names?

apply(mtcars, 1, mean) ## Am I matching the argument by position or names?

##*****************mapply***************************************************###
##**************************************************************************###
##***********************Mapply**************************************************###
## lapply() function let you iterate over the single R object (each element of the list). mapply() let you iterate over the multiple R objects in parallel.

rep(100,7) ## First argument is the number which we want to repeat. Second argument gives you the number of times we want to iterate. Therefore, this code means we are repeating number 100 seven times.

?mapply

mapply(rep,1:4,4:1) 

?rnorm

mapply(rnorm, c(5,10,15),c(0,1,2), c(1, 1.5, 2))
# the above command is equal to following three commands
# rnorm(5,0,1)
# rnorm(10,1,1.5)
# rnorm(15, 2, 2)

