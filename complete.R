complete <- function(directory, id = 1:332) {
    ## 'directory' is a character vector of length 1 indicating
    ## the location of the CSV files
    
    ## 'id' is an integer vector indicating the monitor ID numbers
    ## to be used
    
    ## Return a data frame of the form:
    ## id nobs
    ## 1  117
    ## 2  1041
    ## ...
    ## where 'id' is the monitor ID number and 'nobs' is the
    ## number of complete cases
    nobsNum <- numeric(0)
    for(fileId in rep(id)){
        dir <-paste(directory, "/", sprintf("%03d", fileId), ".csv", sep="")
        data <- read.table(dir, sep=",", header=TRUE)
        nobsNum <- c(nobsNum, nrow(na.omit(data)))
    }
    data.frame(id=id, nobs=nobsNum)
}
