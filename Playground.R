library(quanteda)
library(readtext)
library(stringi)
library(stringr)
library(readr)
library(readtext)
data <- readLines("~/relavis/Corpora/mini corpus/RA1-2022-SIAM.txt")


start_idx = grep("^1\\.\\s.*", data, ignore.case = T)
end_idx = grep("^2\\.\\s.*", data, ignore.case = T)
a = paste(data[start_idx:end_idx-1], collapse = '')
a
