library(tidyverse)
library(tm)
library(corpus)
soc <- "~/relavis/Corpora/socialsci"
bio <- "~/relavis/Corpora/bio"
app <- "~/relavis/Corpora/appliedsci"
corpusfiles <- list.files(here::here(bio), # path to the corpus data
                          # file types you want to analyze, e.g. txt-files
                          pattern = ".*.txt",
                          # full paths - not just the names of the files
                          full.names = T)   

#use saveRDS
complete_corpus <- sapply(corpusfiles, function(x){
  x <- stringr::str_trim(x, side = "both") # remove superfluous white spaces at the edges of strings
  x <- stringr::str_squish(x)              # remove superfluous white spaces within strings
  x <- paste0(x, collapse = " ")       # paste all utterances in a file together
})

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

# content <- sapply(corpus, function(x){
#   split_str <- str_split(x, "Abstract|ABSTRACT")
#   second_half_str <- str_split(split_str[[1]][2], "Introduction|INTRODUCTION|Background ")
#   x <- second_half_str[[1]][1]
# })

content <- sapply(corpus, function(x){
  split_str <- str_split(x, "1. Introduction")
  second_half_str <- str_split(split_str[[1]][2], "2. ")
  x <- second_half_str[[1]][1]
})
content[2]
peek <- sapply(content, function(x){
  item <- str_count(x, "that|which|when|who|whose")
  if(!is.na(item) & item>200){
    x
  }
})

tb <- str_count(content, "that|which|when|who|whose")
tb
sum(tb <=20 & tb >0 & !is.na(tb))

#text_locate(content[2], c("which", "that", "when", "who", "whose"))
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
