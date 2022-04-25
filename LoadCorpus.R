library(tidyverse)
corpusfiles <- list.files(here::here("~/relavis/Corpora/bio"), # path to the corpus data
                          # file types you want to analyze, e.g. txt-files
                          pattern = ".*.txt",
                          # full paths - not just the names of the files
                          full.names = T)            

corpus <- sapply(corpusfiles, function(x){
  x <- scan(x,
            what = "char",
            sep = "",
            quote = "",
            quiet = T,
            skipNul = T)
  #x <- stringr::str_trim(x, side = "both")
  x <- paste0(x, sep = " ", collapse = " ")
  x <- stringr::str_squish(x)
})

data <- corpus[2]
#str_detect(data, "^1\\.\\s.")
start_match <- "1. *"
str_detect(data, "1. ")
#str_subset(data, "1. ")
#str_subset(data, start_match)
#start_idx = str_detect(data, "1. ")
#end_idx = grep("^2\\.\\s.*", corpus, ignore.case = T)
#print(start_idx)

fileinfo <- sapply(corpus, function(x){ 
  # extract first element of each corpus file because this contains the file info
  x <- x[1]
})
#inspect
#fileinfo[2]

str(corpus[2])
