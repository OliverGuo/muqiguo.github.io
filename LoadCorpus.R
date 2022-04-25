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
  x <- paste0(x, sep = " ", collapse = " ")
  x <- stringr::str_squish(x)
})

glimpse(corpus[1])
