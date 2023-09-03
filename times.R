tm_lst = times0(words)
saveRDS(tm_lst, "tm0.rds")

pre_tm_lst = times1(words)
saveRDS(pre_tm_lst, "tm1.rds")

v_tm_lst = times2(words)
saveRDS(v_tm_lst, "tm2.rds")

text = readRDS("txt.rds")

url_591k = system.time(URLdecode(text))
saveRDS(url_591k, "url_591k.rds")

pre_591k = system.time(preallocated(text))
saveRDS(pre_591k, "pre_591k.rds")

v_591k = system.time(vectorized(text))
saveRDS(v_591k, "v_591k.rds")
