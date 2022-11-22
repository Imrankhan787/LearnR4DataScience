
###**************************R PROGRAMMING SEESSION**************************###
###**************************BASIC CONCEPTS ABOUT VECTORS********************###

##*** Traditional way of learning R is to start learning vectors first********##

## What is vector? What is scalar? There is no concept of scalar in R. Scalar is simply a vector of length 01

##********************      TYPES OF VECTORS   ***************************##
# 1. ATOMIC VECTORS  2. LISTS

# ATOMIC VECTORS are of six types: Logical, integer, character, double, complex and raw
# List: very powerful and flexible data structure in R programming

# Difference between atomic vector and List: What type of data can be stored in list and atomic vector?
# Atomic vectors are homogeneous i.e. Atomic vectors stores the data of same type. All the elements of the vector have same data type. 
# whereas the list can store heterogeneous data. Each element of the list could be of different data type. 

# we create atomic vector with c(). Each element of atomic vector is separated with the comma.

##************************DOUBLE****************************************##

number<-c(1,2,3,4,5,6) ## What is this operator, "<-" in R? It is an assignment operator. We can also use single equal to "=" for assignment.
# What is the type of atomic vector "number"? Function typeof() return the type of vector
### Two key properties of atomic vector are its 1. type and 2. length
number   ##check how the atomic vector is displayed in the console?
typeof(number)  ## number is of data type "double". By default, we create double (or floating point) number in R
class(number)
length(number)  ## Length gives you the number of elements in atomic vector
is.double(number) ## Another way of checking the class of double vector. It returns the single TRUE or FALSE

## named double vector

number_named<- c(dbl_1 =1, dbl_2 = 2, dbl_3 = 3, dbl_4 = 4, dbl_5 = 5, dbl_6 = 6) ## each element of the named vector is named. What is the name for the fifth element?
names(number_named) ## returns the names of all elements
names(number) ## returns you NULL because the elements of the vector were un-named
class(number_named)
length(number_named)
##*************************INTEGER*************************************##

number_integer<-c(5L, 6L, 7L)  ## Pay attention to data type of each element of the atomic vector: is each element of the vector is of same datatype?
number_integer     ## check how this vector is displayed in the console.
1L:200L            ## check how the larger vector is displayed in the console.
typeof(number_integer)
class(number_integer)
is.integer(number_integer) ## returns a logical vector of length 1 
length(number_integer)

number_integer_named <- c(int_1 = 5L, int_2 = 6L, int_3 = 7L) ## named integer vector. It is named because each element of the vector is named.
names(number_integer_named) # returns you the names of all elements
class(number_integer_named)
## Remember Integer and double are collectively known as "numeric" vectors

## We could have named logical, integer, character and double vector.

##**************************LOGICAL ************************************##
logical_vector<-c(T, F, FALSE, TRUE) ## Logical vector is the simplest vector. It has two values "TRUE" or "FALSE".IF we include "NA", three values.
typeof(logical_vector)
class(logical_vector)
length(logical_vector)
is.logical(logical_vector)
##************************CHARACTER************************************##
character_vector<-c("Name","Age","Gender","Citizenship") ## Again all atomic vectors are created using c(). Elements of vectors are separated by commas.
## Please note the double quotes around each element of the character vector. We can also use single quote. Just be consistent with the quoting style.
typeof(character_vector)
length(character_vector)

##******************No concept of scalar in R**************************##
## There is no concept of scalar in R. It is a vector of length 1. Easiest way to create scalar in R.
dbl<-1.5   # it is a double vector of length 1
charac<-"Imran" #it is a character vector of length 1.
integ<-2L        # it is an integer vector of length 1
log<-TRUE         # it is a logical vector of length 1


##*****************List****************************************************##
##**************Most flexible and powerful data structure in R*************##
## How we create list? we create list with list()
## What is the difference between atomic vector and list? Each element of the list could be of data type.

p <- list(1:3, "a", 4:6) ## How many element this list have? What is the data type of each element? Is this list named or un-named?
p     ##check how the list is displayed in console
class(p)

g <- list(            ## is g named or un-named list? How many elements this list "g" have? Whether the first element is a vector or list?
  a = list(1, 2, 3),  ## Lists are flexible. Elements of a list could be atomic vector. Here the first elements is a list. List can even store dataframe.
  b = list(3, 4, 5)  
)


typeof(g)
##class(g)
length(g)
str(g) ## very useful command, gives you lot of information.

##*********************TWO Dimensional dataframes: MATRIX AND DATA FRAMES**********************##

# You will also import dataframes but you can also create dataframe with data.frame()

df <- data.frame(face = c("ace", "two", "six"),
                 suit = c("clubs", "clubs", "clubs"), value = c(1, 2, 3))
df
names(df) ## give the column names on the data frame.
colnames(df) ## also gives the column names of the dataframes
dim(df) ##number of rows and number of column.
nrow(df) ## number of rows of dataframe
ncol(df) ## number of column of dataframe
class(df) ## gives the class of dataframe.
str(df) ## Very useful command for complex data structures like dataframe and list.


##****************matrix************##

vec_number <- 1:9

mat <- matrix(vec_number, ncol=3) ## creates matrix with three rows and three column
class(mat)   ##
str(mat)
dim(mat)

##************************R is a vectorized language****************************##
## What does this mean when we say R is a vectorized language? 
##Many operations in R are vectorized, meaning that operations occur in parallel (element-wise). You can write very concise code because of vectorized nature of R

a <- c(1, 2, 4, 5, 6)
b <- c(7, 5, 3, 4, 3)

a + b ## What will happen when we add the two vectors? R will add the corresponding elements in the two vectors in parallel.

a - b ## What will happen when we subtract the vector named b from vector named a? 

##************************R recycles the shorter length vector*****************##
## vector a and vector b were of equal length. What if the two vectors (we are adding) are not of equal length?

p <- 15  ## scalar or vector of length one in R.
a + p ## Did you notice what happen when we add the vector of length one to another larger vector? Smaller vector was "implicitly" recycled to the size of larger vector

z <- c(a, b) ## what is the length of this vector?
y <- c(2, 3) 
z + y  ## y is a vector of length 02 whereas the z is a vector of length 10. So the length of vector y is a multiple of length of vector z. vector y is recycled implictly.

x <- c(3, 4, 5)
z + x ## recycles x but with the warning in the console.

##************** Logical operators**************************************###

1 > 2      ## Comparing a number with the number. What will be the result?
1 > c(0, 1, 2) ## comparing a number with the vector. What will be th result? Remember elementwise comparison
c(1, 2, 3) == c(3, 2, 1) ##comparing a vector with the vector.

## All logical operators makes element wise comparison except the logical vector (%in%)

1 %in% c(3, 4, 5) ## %in% simply checks whether each element in the left exists in the group on the right.

c(1, 2) %in% c(3, 4, 5)

c(1, 2, 3) %in% c(3, 4, 5)

c(1, 2, 3, 4) %in% c(3, 4, 5)

##*******************Implicit coercion**********************************###
## What if we have more than one data type in atomic vector? We know that the atomic vectors can only accommodate the data of one type?
char_int <- c("Imran", 5L, "Khan", 7L) ## How many types of data we have in this vector?
char_int  ## character data type is more flexible therefore the integers 5L and 7L were implicitly coerced to the more character data type in the atomic vector
typeof(char_int)

dbl_int <- c( 5L, 5) ## How many types of data we have in this vector? Which type of data is more flexible?
typeof(dbl_int)

lgl_int <- c(TRUE, FALSE, 1L) ## How many types of data we have in this vector? integer is more flexible. Under the hood, TRUE is one and FALSE is zero
typeof(lgl_int) ## vector is implicitly coerced to integer type because integer is more flexible than logical

## From the least to the most flexible data type: logical ----->>>> integer ---------->>>double----------->>>Character

##*****************Explicit coercion*************************************###
##Explicitly converting the atomic vector of one type into another using "as" family of functions

number_integer<-c(5L, 6L, 7L) ## let us convert this atomic vector explicitly into 1. double atomic vector 2. character atomic vector


##***********************Short Quiz**********************************************##

m<-c("TRUE","FALSE","T","F") ## is it a logical vector?
is.logical(m)
is.character(m)

n<- c("TRUE", 1, 2.2, "Imran") ## What will be the type of this vector?
typeof(n)

o<- list(1, 2, 3, 4) ## Is this the list? please run the str()

q <- c(1.5, 2.5, 3.5) ## How can we convert the vector from double to integer?
#as.integer(q)

##Home work assignment
##Play with the inbuilt dataset "mtcars". Please find the dimensions, names of column and data type of mtcars dataset.
mtcars




