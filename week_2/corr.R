corr <- function(directory, threshold=0) {
  result = c()
  nobs <- complete(directory)
  valid <- nobs[nobs$nobs > threshold,]
  
  for(file in valid$id) {
    csv <- read.csv(paste0(directory,"/",formatC(file, width = 3, format = "d", flag = "0"),".csv"))
    result = c(result, cor(csv$sulfate, csv$nitrate, use = "complete.obs"))
  }
  
  result
}