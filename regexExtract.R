library(quanteda)
library(readtext)
library(stringi)
library(stringr)
library(readr)
library(readtext)
library(tidyverse)
library(corpus)
corpusfiles <- list.files(here::here("~/relavis/Corpora/bio"), # path to the corpus data
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
# start_idx = grep("^1\\.\\s.*", data, ignore.case = T)
# end_idx = grep("^2\\.\\s.*", data, ignore.case = T)
# a = paste(data[start_idx:end_idx-1], collapse = '')
# a
view(content)