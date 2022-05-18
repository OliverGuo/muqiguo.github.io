library(quanteda)
library(readtext)
library(stringi)
library(stringr)
library(readr)
library(readtext)
library(tidyverse)
library(corpus)
soc <- "~/relavis/Corpora/socialsci"
bio <- "~/relavis/Corpora/bio"
app <- "~/relavis/Corpora/appliedsci"
corpusfiles <- list.files(here::here(app), # path to the corpus data
                          # file types you want to analyze, e.g. txt-files
                          pattern = ".*.txt",
                          # full paths - not just the names of the files
                          full.names = T)  

data <- sapply(corpusfiles, function(x){
  x <- readLines(x)
})

content <- sapply(data, function(text){
  
  start_idx <- grep("^1\\.\\s.*", text, ignore.case = T)
  end_idx <- grep("^2\\.\\s.*", text, ignore.case = T)
  if (identical(start_idx, integer(0)) | identical(end_idx, integer(0))){
    text <- "Fail"
  }
  else{
    text <- paste(text[start_idx:end_idx-1], collapse = '')
  }
  
})
tb <- str_count(content, "that|which|when|who|whose")
tb
sum(tb <=20 & tb >0 & !is.na(tb))
