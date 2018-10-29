###
process txt files with multiple header lines



ref https://stackoverflow.com/questions/32615039/how-to-parse-text-file-with-multiple-sections-of-headers-in-r

setwd("XX/")

f<- readLines("XXX.dat")
head(f)
headers = which(grepl("^Sequence:", f))
headers

ff = split(f, cumsum(seq_along(f) %in% headers))
class(ff)
l.in = lapply(ff, function(x) read.table(text=x, header=T, sep="|", fill=T, stringsAsFactors=F))

names(l.in) = sapply(l.in, function(x) names(x)[1])

