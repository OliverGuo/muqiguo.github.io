library(quanteda)
library(readtext)
library(stringi)
library(readtext)
data_char <- texts(readtext("~/relavis/Corpora/mini corpus/RA1-2022-SIAM.txt"))
names(data_char) <- "test"

stri_sub(data_char, 1, 75)
data <- readLines("~/relavis/Corpora/mini corpus/RA1-2022-SIAM.txt")
data[grepl("^2.",data,ignore.case = T)]
