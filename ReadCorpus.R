library(quanteda)
library(readtext)
library(stringi)
library(stringr)
library(readr)
library(readtext)
library(tidyverse)
library(corpus)
# data <- readLi("~/relavis/Corpora/mini corpus/RA1-2022-SIAM.txt")
# 
# 
# start_idx = grep("^1\\.\\s.*", data, ignore.case = T)
# end_idx = grep("^2\\.\\s.*", data, ignore.case = T)
# a = paste(data[start_idx:end_idx-1], collapse = '')
# a
# create list of files to read in
files <- list.files(path = "~/relavis/Corpora/socialsci",
                    pattern = "*.txt",
                    full.names = TRUE)
# read in all files
# first create empty data frame
df <- data.frame()
# for each file in our list of files
for (i in 1:length(files)){
  # read the tab separated file in
  
  data <- readLines(files[i])
  # create a column with the filename, do some clean up of the file name
  print(files[i])
  start_idx = grep("^1\\.\\s.*", data, ignore.case = T)
  print(start_idx)
  end_idx = grep("^2\\.\\s.*", data, ignore.case = T)
  if (identical(start_idx, integer(0))){
    next
  }
  text <- data[start_idx:end_idx]
  text <- trimws(text)
  a <- corpus_frame(text)
  a
  
}

# # change column names
# annotated_files <- annotated_files %>%
#   rename(content = X1)
         

glimpse(df)
head(df)

# write file out so we don't have to run the whole thing again
#write_csv(annotated_files, "bio.csv")