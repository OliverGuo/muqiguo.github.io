library(tidyverse)
library(tm)
library(corpus)
soc <- "~/relavis/Corpora/socialsci"
bio <- "~/relavis/Corpora/bio"
app <- "~/relavis/Corpora/appliedsci"
corpusfiles <- list.files(here::here(app), # path to the corpus data
                          # file types you want to analyze, e.g. txt-files
                          pattern = ".*.txt",
                          # full paths - not just the names of the files
                          full.names = T)   


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
x <- corpus[1]
str_count(x, "2. [A-Za-z]+")
# split_str <- str_split(x, "\\n")
# second_half_str <- str_split(split_str[[1]][2], "\\n2\\.\\s[A-Z]")
# second_half_str[[1]][1]
#saveRDS(corpus, "bio_corpus")
#saveRDS(corpus, "socialsci_corpus")
#saveRDS(corpus, "appliedsci_corpus")
# content <- sapply(corpus, function(x){
#   split_str <- str_split(x, "Abstract|ABSTRACT")
#   second_half_str <- str_split(split_str[[1]][2], "Introduction|INTRODUCTION|Background ")
#   x <- second_half_str[[1]][1]
# })


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
