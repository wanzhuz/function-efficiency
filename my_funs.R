create_str = function(n) {
  str_len = n
  chars = sample(c(letters, 0:9, mapping$`From UTF-8`), str_len, replace = TRUE)
  paste(chars, collapse = "")
}

create_n_str = function(n) {
  str_len = sample(1:200000, n, replace = TRUE)
  chars = sample(c(letters, 0:9, mapping$`From UTF-8`), sum(str_len), replace = TRUE)
  tapply(chars, rep(1:n, str_len), paste, collapse = "")
}

times0 = function(s) {
  k = 1
  t = vector("list", length(s))
  while (k <= length(s)){
    t[k] = system.time(URLdecode(s[k]))[3]
    k = k + 1
  }
  return(unlist(t))
}

times1 = function(s) {
  k = 1
  t = vector("list", length(s))
  while (k <= length(s)){
    t[k] = system.time(preallocated(s[k]))[3]
    k = k + 1
  }
  return(unlist(t))
}

times2 = function(s) {
  k = 1
  t = vector("list", length(s))
  while (k <= length(s)){
    t[k] = system.time(vectorized(s[k]))[3]
    k = k + 1
  }
  return(unlist(t))
}




