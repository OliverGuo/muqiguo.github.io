library(tm)
library(readr)
data <- read_csv("~/relavis/socialsci_content.csv")

count <- sapply(data, function(x){
  str_count(x["content"], "which")
}) 

count
