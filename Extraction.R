# bio_corpus <- readRDS("bio_corpus")
# app_corpus <- readRDS("appliedsci_corpus")
# soc_corpus <- readRDS("socialsci_corpus")

getIntro <- function(corpus){
  sapply(corpus, function(x){
    x <- str_remove_all(x, "Figure\\s2\\.\\s")
    split_str <- str_split(x, "1. Introduction")
    second_half_str <- str_split(split_str[[1]][2], "\\s2\\.\\s[A-Za-z]+")
    x <- second_half_str[[1]][1]
  })
}
bio_content <- getIntro(bio_corpus)
soc_content <- getIntro(soc_corpus)
app_content <- getIntro(app_corpus)
# bio_content <- sapply(bio_corpus, function(x){
#   x <- str_remove_all(x, "Figure\\s2\\.\\s")
#   split_str <- str_split(x, "1. Introduction")
#   second_half_str <- str_split(split_str[[1]][2], "2\\.\\s[A-Za-z]+")
#   x <- second_half_str[[1]][1]
# })
# soc_content <- sapply(soc_corpus, function(x){
#   x <- str_remove_all(x, "Figure\\s2\\.\\s")
#   split_str <- str_split(x, "1. Introduction")
#   second_half_str <- str_split(split_str[[1]][2], "2\\.\\s[A-Za-z]+")
#   x <- second_half_str[[1]][1]
# })
# app_content <- sapply(app_corpus, function(x){
#   x <- str_remove_all(x, "Figure\\s2\\.\\s")
#   split_str <- str_split(x, "1. Introduction")
#   second_half_str <- str_split(split_str[[1]][2], "2\\.\\s[A-Za-z]+")
#   x <- second_half_str[[1]][1]
# })

# peek <- sapply(content, function(x){
#   item <- str_count(x, "that|which|when|who|whose")
#   if(!is.na(item) & item>200){
#     x
#   }
# })

bio_count <- str_count(bio_content, "that|which|when|who|whose")
bio_count
soc_count <- str_count(soc_content, "that|which|when|who|whose")
soc_count
app_count <- str_count(app_content, "that|which|when|who|whose")
app_count
sum(!is.na(bio_count))
sum(!is.na(soc_count))
sum(!is.na(app_count))
