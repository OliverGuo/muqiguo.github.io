x <- "properties and complexity. 1. Introduction In section 5 we compare GaBP with classical iteration and,
in context of multigrid, with a diverse set of standard smoothers including ILU(0),
Chebyshev, and various pattern relaxation schemes. In section 6, we summarize the
main results and discuss possible 1.2. Future research. 2. GaBP. 2.1. GaBP from the elimination perspective. To build intuition about GaBP, we consider"
split_str <- str_split(x, " 1. Introduction")
second_half_str <- str_split(split_str[[1]][2], "\\s2\\.\\s[A-Za-z]+")
second_half_str[[1]][1]