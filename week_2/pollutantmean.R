pollutantmean <- function(directory, pollutant, id = 1:332) {
  data <- data.frame(Date=as.Date(character()), sulfate=numeric(), nitrate=numeric(), ID=integer())
  for(file in id) {
    csv <- read.csv(paste0(directory,"/",formatC(file, width = 3, format = "d", flag = "0"),".csv"))
    data <- rbind(data, csv)
  }  
  
  mean(subset(data, !is.na(data[[pollutant]]))[[pollutant]])

}