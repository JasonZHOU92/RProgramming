pollutantmean <- function(directory, pollutant, id = 1:332) {
    ## 'directory' is a character vector of length 1 indicating
    ## the location of the CSV files
    
    ## 'pollutant' is a character vector of length 1 indicating
    ## the name of the pollutant for which we will calculate the
    ## mean; either "sulfate" or "nitrate".
    
    ## 'id' is an integer vector indicating the monitor ID numbers
    ## to be used
    
    ## Return the mean of the pollutant across all monitors list
    ## in the 'id' vector (ignoring NA values)
    pollutantData <- data.frame()
    for(fileId in rep(id)){
        filePath <-paste(directory, "/", sprintf("%03d", fileId), ".csv", sep="")
        data <- read.table(filePath, sep=",", header=TRUE)
        pollutantData <- rbind(pollutantData, data)
    }
    result <- mean(pollutantData[[pollutant]], na.rm=TRUE)
    round(result, digit=3)
}
