library(quanteda)
library(readtext)
library(stringi)
library(stringr)
library(readr)
library(readtext)
library(tidyverse)
library(corpus)
# data <- readLines("~/relavis/Corpora/mini corpus/RA1-2022-SIAM.txt")
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
count = vector(mode = "integer", length = length(files))
# for each file in our list of files
for (i in 1:length(files)){
  # read the tab separated file in
  
  data <- readLines(files[i])
  # create a column with the filename, do some clean up of the file name
  print(files[i])
  start_idx = grep("^1\\.\\s.*", data, ignore.case = T)
  print(start_idx)
  end_idx = grep("^2\\.\\s.*", data, ignore.case = T)
  # start_I = grep("^I\\.\\s.*", data, ignore.case = T)
  # end_II = grep("^II\\.\\s.*", data, ignore.case = T)
  
  if (identical(start_idx, integer(0)) | identical(end_idx, integer(0))){
    # start_idx = grep("^I\\.\\s.*", data, ignore.case = T)
    # end_idx = grep("^II\\.\\s.*", data, ignore.case = T)
    text <- "No Intro"
    df <- rbind(df, c(files[i], text))
  }
  # else if(identical(start_I, integer(0))){
  #   print("no intro")
  # }
  else{
    text <- data[start_idx:end_idx]
    #text <- trimws(text)
    print(text)
    v = c(files[i], text)
    df <- rbind(df, v)
    df$file_name[i] <- files[i]
    # df$text[i] <- text
    
  }
  
  
}

# # change column names
# annotated_files <- annotated_files %>%
#   rename(content = X1)
         

glimpse(df)
head(df)
# write file out so we don't have to run the whole thing again
#write_csv(df, "~/relavis/test.csv")