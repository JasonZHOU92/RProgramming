corr <- function(directory, threshold = 0) {
    ## 'directory' is a character vector of length 1 indicating
    ## the location of the CSV files
    
    ## 'threshold' is a numeric vector of length 1 indicating the
    ## number of completely observed observations (on all
    ## variables) required to compute the correlation between
    ## nitrate and sulfate; the default is 0
    
    ## Return a numeric vector of correlations
    corValue <- numeric(0)
    for(fileId in 1：332){
        dir <-paste(directory, "/", sprintf("%03d", fileId), ".csv", sep="")
        data <- na.omit(read.table(dir, sep=",", header=TRUE))
        if(nrow(data)>threshold){
            cr <- cor(data["sulfate"] , data["nitrate"])
            if(!is.na(cr)){
                corValue<-append(corValue, cr)
            }
            #print(paste(fileId, nrow(data)))
        }
    }
    corValue
}
