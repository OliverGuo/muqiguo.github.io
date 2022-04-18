library(tm)

data <- readLines("~/relavis/Corpora/bio/Firmansyah et al. (2019).txt")
start_idx = grep("^1\\.\\s.*", data, ignore.case = T)
end_idx = grep("^2\\.\\s.*", data, ignore.case = T)
text <- data[start_idx:end_idx-1]
text <- trimws(text)
text_sample(text, "rose", 3)
