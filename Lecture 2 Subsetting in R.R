
###***********************LEVEL I Session II**********************************###

##*************************Boolean Operators*********************************###
##********AND**************###
TRUE & TRUE
TRUE & FALSE
FALSE & TRUE
FALSE & FALSE
###********* |*************###
TRUE | FALSE 
FALSE | TRUE
TRUE | TRUE   ## What is the difference between | or Xor?
FALSE | FALSE
###***********xor************###
xor(TRUE,FALSE)
xor(F,T)
xor(F,F)
xor(T,T)  ## This is the difference between "|" and "xor"

##*************************Basic calculations in R****************************###

1:10 + 10 ## How 10 will be added? It is true for other mathematical operations for example subtraction, multiplication and division
c(5,10,15,20,25,30,35,40) + c(4,5) ## vector of shorter length will be recycled. Vectorized nature of R eliminates the need to write for loop.

##******************************R PROGRAMMING LEVEL I SESSION II**************************##
##*******************************************************************************##
##*****************************SUBSETTING****************************************##
# What is sub-setting? Extraction of subset of values from (any data structure) vector, dataframe, matrix, array and list.
# For sub-setting you need to know the dimensions of the data structure 
# Vector and List has one dimension. Therefore, we need one index to subset vectors.
# Data frame and Matrix has two dimensions. Therefore, we need two indexes to subset data frame and matrices. Each index is separated by a comma.
# Arrays has more than two dimensions. Therefore, we need to supply more than two indexes to subset arrays. 
##***************************Vector sub-setting********************************###
# Pair of single square bracket [] is a sub-setting function. 

x <- c("one", "two", "three", "four", "five")

x[1] ## index for sub-setting starts with 1 in R. In Python, it starts with "0" 

# General form: R object name [index/position of the element which we want to extract].Position of the element is also called index of the element.

x[c(1,3,5)] # if we want to extract more than one element from vector x, then we can supply vector of integers corresponding to the position of elements in a vector.

x[-1] ## we can also supply negative index. Negative index in this case will extract all the elements in vector x except at the first position.

x[c(-1,-3)] ## we can also supply the vector of negative indices to subset the vector. This will extract all the elements in the vector x except elements at the positions 1 and 3

x[c(-1,3)] ## we cannot give positive and negative indices in the same index.It will throw an error.

x[x=="one"] ## we can also use logical expression to subset the vector.

x=="three"

named_vector<-c(abc=40, def=50, ghi= 60, jkl=70)

typeof(named_vector)

named_vector[c("abc","def")]
## Four methods to subset the vector:1. Positive index 2. Negative index 3. Logical expression 4. through names of elements if the vector is named.

y<- c(5, 10, 16, 18, 0, 19 )

##************** positive index

y[4] # counting of the index starts from 1. What type of output we get from this subsetting? we get back the VECTOR of length 1

y[2:5] # extract elements of vector y at the position 2,3,4,5. Useful if you want to extract multiple elements in a sequence. Please note index 2 and 5 are inclusive.

y[c(2,4,5)] # supplying index as an integer vector to extract the elements at position 2,4 and 5. Always pay close attention to what type of data is returned 

##************** Negative index

y[-4] # Extracts all the elements of vector y except at position y

y[c(-1,-3)] ## Here we are supplying vector of negative integers. We will extract all the elements except at the position 1 and 3.

##*************** sub-setting through logical index

y[y>10] # Sub-setting through logical expression is very powerful. you give logical expression in the pair of single square bracket.

y[y<=10]  # Extract all the values in vector y meeting the logical condition. We don't need to know the index (or position) of elements less than or equal to 10 in vector y.

y[y==5] # Extract an element equal to 5.When we use logical sub-setting, we don't need to know the position of 5 in vector y.

y[c(F, F, F, F, T, T)] 

# vector sub-setting through names
# vector y does not have names. Therefore, we cannot subset through names in this case. 

##**********************************VECTOR SUBSETTING AND ASSIGNMENT***********************###
##*****************************************************************************************###
# If we want to replace the element in a vector. It happens in two steps. First step is sub-setting i.e accessing the element you want to replace. And the second step is assigning the new value at the position.

x <- c("one", "two", "three", "four", "five") ## If we want to replace the element # 4 ("four") with "seven". How we will do this?

x[4]<-"seven"  ##

x        ## The original vector is modified. This is called modification in place.
## if we want to replace more than one element simultaneously in vector x. Let us suppose we want to replace element 1 and 2 with "twelve" and "thirteen" respectively.

x[c(1,2)]<-c("twelve","thirteen")

x[x=="five"]<-"10" ## we can subset the vector through logical expression. And then assigning the value.

##NOTE: We can use the positive, negative and logical subsetting methods for all atomic vectors (Character, Integer, Double and Logical).

##****************************Short quiz**************************************************###
z<-c( 56, 75, 98, 125, 0, 1)

## Use three sub-setting methods (positive integer, negative integer and logical vector) to access the first and third element in vector z. You can subset the data structures in many ways.

z[c(1,3)]  # positive integer sub-setting method.

z[c(T,F,T,F,F,F)] ## Logical sub-setting method. Returns the elements of z vector corresponding to the TRUEs.

z[c(-2,-4,-5,-6)] ## Negative integer subsetting

z[c(1,3)] ## what type of data structure will be returned if I subset the elements at position 1 and 3? Single Square bracket

z[c(1,-3)] ## Vector has one dimension. Can we give positive and negative index in the same dimension?

z[7]<-50
z ## Therefore we can add new element(s) in the vector z. we can also remove elements from the vector 

z<-z[c(-1,-3)] ## what will be the length of vector z now? How many elements I have removed from the original vector z?

z 
# How we call "help" in R? Please call help for sum function. ?sum
# How we create atomic vectors?
# Difference between "=" and "= ="


##***********************************SUBSETTING DATAFRAME***********************************###
##******************************************************************************************###
##******************************************************************************************###
mtcars ## mtcars is an inbuilt data-frame. Remember data frame has two dimensions. 
## mtcars[index for selecting rows , index for selecting columns] 
head(mtcars)
## We can subset the dataframe as a list because the data frame is a list of special kind with all the elements of that list having same length
## We can also subset he dataframe as a two dimensional object.

#
#********** Sub-setting data frame as a list with the single dimension*******
mtcars[c("mpg", "cyl")] ## We will provide the names of column as a character vector. Here we are sub-setting two columns by names. 
str(mtcars[c("mpg", "cyl")]) ##What is the data structure of output? 

mtcars["mpg"] ## we are subsetting the single column by name. Note that we provided the name of a column as a string.
str(mtcars["mpg"]) ##What is the data structure of output?

# The dimensionality of the output data structure is "preserved" when we subset the dataframe with a single dimension (subset as a list) no matter we extract a single column or multiple columns. 

#************Sub-setting data frame with two dimensions************************

mtcars[, c(1,2)]  ## so we are accessing the first and second column and all rows
str(mtcars[, c(1,2)]) ## What is the data structure of output? The dimensionality of output data structure is "preserved".

mtcars[, 7]  ## I am subsetting the single column i.e., column#07
str(mtcars[, 7]) ## What is the data structure of output? The dimensionality of output data structure is "simplified"

## How to "always" preserve the dimensionality of output data structure? Use drop = FALSE argument
mtcars[,7, drop = F] ## Although we are accessing the single column from the mtcars dataset using two dimensions, the dimensionality of output data structure is preserved.
#**********************Positive integer subsetting******
mtcars[1, ] ## second index is empty (blank space). Second index is for selecting columns. When the second index is empty, then everything is selected. All columns will be extracted.

str(mtcars[1,]) ## Pay close attention to the data structure returned. It is dataframe

mtcars[c(2,3),] ## Extract 2nd and 3rd rows. Again check the data structure.

mtcars[,1] ## first index is empty, first index is for selecting rows. When the first index is empty, then all row values for the selected column(s) will be extracted.

str(mtcars[,1]) ## return a vector of double. Each column is a vector of one data type.

mtcars[,c(2,3)]

str(mtcars[,c(2,3)]) ## if we are extracting more than one column, the data structure we will get back is "data frame"
##Pay close attention to the data structure returned by sub-setting. Using single square bracket we get get back sometimes dataframe and sometimes atomic vector. 

mtcars[c(1,3),] ## Extracting one and third rows simultaneously and all columns.

mtcars[c(1,3),1] ## How many values it would extract?

#************************Negative Integer sub-setting*****
mtcars[-1, -11] ## extracting all the rows except first row. And extracting all columns except column #11.

mtcars[c(-5,-7),c(-4,-8)] ## we can exclude more than one rows and more than one columns simultaneously. Therefore, we will get back everything except 5th and 7th row and except 4th and 8th column

mtcars[c(-1,-2), c(1,2)] ## we can supply vector of positive integer in one dimension and vector of negative integers in another dimension. However, we cannot use positive and negative integer simultaneously in the same dimension

mtcars[c(1,-5),] ## error because we are providing positive 1 and negative 5 in the same row dimension. it will give an error.

mtcars[,c(1,-11)] ## error because we are providing positive 1 and negative 11 in the same column dimension. We cannot use positive and negative integer (for sub-setting) simultaneously in the same dimension.

#***********************Logical sub-setting****************
#*very very powerful sub-setting idea.
#* For example, I want to extract all the cars having six cylinders. Extremely important for sub-setting rows that meet certain logical test.

mtcars[mtcars$cyl==6,] ## it is equivalent to filtering rows. Very very powerful sub-setting idea.Test the condition for each row. If the logical condition is true for the row, it will be included in the output result.

mtcars[mtcars$gear != 4,] ## select all cars having gears not equal to 4. 

mtcars[mtcars$disp >400,]  ## Select all cars with engine displacement greater than 400. 

## we can also use Boolean operators for example, & or | for logical sub-setting.
## if we want to inspect about the cars having 6 cylinders and 4 gears, we need to use Boolean operator &

mtcars[mtcars$cyl==6 & mtcars$gear==4,] ## return cars with 6 cylinder and 4 gears.

#*************************Sub-setting dataframe with $ and [[]]******
# Remember in the first lecture I told you that the data frame is a named list whose elements have equal length. We can subset data frame by column name using "$" operator.
# When we use $ operator to subset the column, the data structure we get back is atomic vector. The data type of atomic vector depends on the type of data stored in that column.

mtcars$mpg  ## gives us back the double vector. We can apply different functions on data stored in columns. For numeric data type column, we can apply mathematical functions.
typeof(mtcars$mpg)

## we can pull "only" one element of a dataframe with $ operator and [[]].
mtcars[[1]] ## What is the similarity when you subset the data frame with double square bracket and $ operator. Both Simplifies the structure of output.


##***********************MODIFYING THE PARTS OF DATA FRAME***************************###
# We can modify the parts of data frame through the combination of sub-setting and assignment (<-)

toy_mtcars<-mtcars

toy_mtcars
## let us suppose I want to replace the values of gears value "4" with "8". Hypothetical example.

toy_mtcars[toy_mtcars$gear==4,"gear"]<-8 
## Let us suppose I want to replace all the values in the first row with NA

toy_mtcars[1,]<-NA 

toy_mtcars ## check all the values in first row are converted to NA.

##************************SUBSETTING LISTS*********************************************###
##* List is the most powerful data structure in R. It can store heterogeneous elements. Each element of the list could be of different data type.
##* Lists are very flexible. It can even store data frame as an element. It can even store sub-lists as an element. Lists can contain nested lists.
##* str() gives you the internal structure of list. It gives you clearer picture of what type of data is stored in each element of list.
##* we create list by list(). And each element of the list is separated by the next element by a comma.Total number of elements is the length of list.
##* We can only use $ operator with a named list.

##* IMPORTANT: UNDERSTAND THE difference between [, [[, and $ when applied to a list.

example_list<- list(logical_vector = c(T, F, TRUE, FALSE), lucky_numbers= c(1,2,5,25,30), Presidents= c("Clinton","Bush","Obama","Trump","Biden"), ls= list(5,10,25) )

str(example_list) ## gives the internal structure of list. Very informative function for complex data structures. 1. Number of elements, data type of each element of list, number of sub-element

example_list$logical_vector## What is the data structure of output? 

class(example_list$logical_vector)

example_list[[1]] ## What is the data structure of output?

class(example_list[[1]])

example_list[1]

class(example_list[1]) # subsetting with single square bracket gives you back list.

example_list[[4]]
example_list[4]

##***************** How to access the sub-element(s) of an element of a list*****************###
example_list[[3]][[1]] # gives you back????.
















