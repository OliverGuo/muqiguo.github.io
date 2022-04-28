library(tidyverse)
library(tm)
library(corpus)
corpusfiles <- list.files(here::here("~/relavis/Corpora/bio"), # path to the corpus data
                          # file types you want to analyze, e.g. txt-files
                          pattern = ".*.txt",
                          # full paths - not just the names of the files
                          full.names = T)      

complete_corpus <- sapply(corpusfiles, function(x){
  x <- stringr::str_trim(x, side = "both") # remove superfluous white spaces at the edges of strings
  x <- stringr::str_squish(x)              # remove superfluous white spaces within strings
  x <- paste0(x, collapse = " ")           # paste all utterances in a file together
  # split files into individual utterances
  x <- strsplit(gsub("([%|*][a-z|A-Z]{2,4}[0-9]{0,1}:)", "~~~\\1", x), "~~~")
})

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


content <- sapply(corpus, function(x){
  words <- str_split(x, "Abstract|a b s t r a c t|abstract")
  second <- str_split(words[[1]][2], "1. Introduction|INTRODUCTION|Background|Introduction|SUMMARY")
  x <- second[[1]][1]
})

str_count(content, "which")

text_locate(content[2], c("which", "that", "when", "who", "whose"))
# fileinfo <- sapply(complete_corpus, function(x){
#   x <- x[1]
# })
# 
# count <- sapply(content, function(x){
#   str_count(x, "which")
# }) 
# count


# fileinfo <- rep(fileinfo)
# content <- as.vector(unlist(content))
# df <- data.frame(1:length(content),
#                     fileinfo,
#                     content)
# 
# write_csv(df, "socialsci_content.csv")
