vectorized = function(URL) {
  x = charToRaw(URL)
  pc = charToRaw("%")
  out = raw(length(x))
  
  pcidx = unlist(gregexpr("%", URL))
  pct = rep(pcidx, each=2)
  
  pc_pair = pct + c(1,2)
  y = as.integer(x[pc_pair])
  y[y > 96L] = y[y > 96L] - 32L
  y[y > 57L] = y[y > 57L] - 7L
  
  proc = (y - 48L) * c(16L, 1L)
  m = matrix(proc, ncol=2, byrow=TRUE)
  sum = rowSums(m)
  out[pcidx] = as.raw(as.character(sum))
  
  non_pc = c(pcidx, pc_pair)
  nonidx = setdiff(1:length(x), non_pc)
  out[nonidx] = x[nonidx]
  
  return(rawToChar(out[out != 00]))
}

vectorized(words[2])
