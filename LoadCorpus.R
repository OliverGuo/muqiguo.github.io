library(tidyverse)
library(tm)
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
  
  # words <- str_split(x, "1\\. Introduction")
  # second <- str_split(words[[1]][2], "2\\. ")
  words <- str_split(x, "Abstract")
  second <- str_split(words[[1]][2], "Introduction|INTRODUCTION|Background")
  x <- second[[1]][1]
  
})

# words <- str_split(corpus[13], "Abstract")
# second <- str_split(words[[1]][2], "Introduction|INTRODUCTION")
# x <- second[[1]][1]
# x

count <- str_count(corpus, "which")
count
#corpus[[2]]
