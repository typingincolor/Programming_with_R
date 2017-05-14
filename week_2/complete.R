complete <- function(directory, id = 1:332) {
  data <- data.frame(id=integer(), nobs=integer())
  
  for(file in id) {
    csv <- read.csv(paste0(directory,"/",formatC(file, width = 3, format = "d", flag = "0"),".csv"))
    cases <- csv[complete.cases(csv), ]
    row <- data.frame(id=file, nobs=NROW(cases))
    data <- rbind(data, row)
  }
  
  data
}