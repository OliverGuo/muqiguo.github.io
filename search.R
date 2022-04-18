library(tm)

data <- readLines("~/relavis/Corpora/socialsci/CAN-2018-79.txt")
# start_idx = grep("^Introduction\\s.*", data, ignore.case = T)
# end_idx = grep("Method*", data, ignore.case = T)
print(start_idx)
print(end_idx)
start_idx = grep("^1\\.\\s.*", data, ignore.case = T)
end_idx = grep("^2\\.\\s.*", data, ignore.case = T)
text <- data[start_idx:end_idx-1]
text <- trimws(text)
text
#text_sample(text, "which", 10)
