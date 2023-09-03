i = c(1, 20, 200, 2000, 20000, 100000, 150000, 200000)
words = sapply(i, create_str)
saveRDS(words, "words.rds")

txt = read_file("/Users/wanzhu_zheng/Desktop/PercentEncodedString.txt")
saveRDS(txt, "txt.rds")
