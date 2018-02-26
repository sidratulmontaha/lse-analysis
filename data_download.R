library(quantmod)

symbols <- read.csv("LSE_AIM.CSV", stringsAsFactors = FALSE, header = FALSE)

for(n in 1:length(symbols[,1])){
  tryCatch({
    s <- symbols[n,1]
    print(paste("Symbol: ", s))
    
    data <- getSymbols(s, from = "2016-01-01", auto.assign = FALSE, src = "google")
    data <- data.frame(date=index(data), coredata(data))
    data$full_name <- symbols[n,2]
    data$ticket <- s
    colnames(data) <- c('date', 'open', 'high', 'low', 'close', 'volume', 'full_name', 'ticker')
    
    write.csv(data, file = paste0("C:/Users/Sidratul/Desktop/LSEAnalysis/data/", gsub(x = s, pattern = "LON:", replacement = ""), ".csv"), row.names = FALSE)
  }, error=function(e){cat(s, " ERROR :",conditionMessage(e), "\n")})
}

rm(data)