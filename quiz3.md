## Q1: Take a look at the 'iris' dataset that comes with R. The data can be loaded with the code:
```
library(datasets)
data(iris)
```
A description of the dataset can be found by running
```
?iris
```
There will be an object called 'iris' in your workspace. 
In this dataset, what is the mean of 'Sepal.Length' for the species virginica? 
(Please only enter the numeric result and nothing else.)
```
data<-iris[iris$Species=="virginica",]$Sepal.Length
mean(data)
```
OR
```
data<-subset(iris, Species=="virginica", select=Sepal.Length)
mean(data$Sepal.Length)
```
OR
```
data<-subset(iris, Species=="virginica")
mean(data$Sepal.Length)
```

## Q2:Continuing with the 'iris' dataset from the previous Question, what R code returns a vector of the means of the variables  'Sepal.Length', 'Sepal.Width', 'Petal.Length', and 'Petal.Width'?
```
apply(iris[, 1:4], 2, mean)
```
OR
```
colMeans(iris[,1:4])
```
## Q3:Load the 'mtcars' dataset in R with the following code
```
library(datasets)
data(mtcars)
```
There will be an object names 'mtcars' in your workspace. You can find some information about the dataset by running
```
?mtcars
```
## Q4 How can one calculate the average miles per gallon (mpg) by number of cylinders in the car (cyl)?
```
sapply(split(mtcars$mpg, mtcars$cyl), mean)
```
OR
```
tapply(mtcars$mpg, mtcars$cyl, mean)
```
## Q5: what is the absolute difference between the average horsepower of 4-cylinder cars and the average horsepower of 8-cylinder cars?
```
meanHP<-tapply(mtcars$hp, mtcars$cyl, mean)
abs(meanHP[1]-meanHP[3])
```
