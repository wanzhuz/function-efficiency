preallocated = function (URL) {
  vapply(URL, function(URL) {
    x = charToRaw(URL)
    pc = charToRaw("%")
    out = raw(length(x))
    i = 1L
    while (i <= length(x)) {
      if (x[i] != pc) {
        out[i] = x[i]
        i = i + 1L
      }
      else {
        y = as.integer(x[i+1L:2L])
        y[y > 96L] = y[y > 96L] - 32L
        y[y > 57L] = y[y > 57L] - 7L
        y = sum((y - 48L) * c(16L, 1L))
        out[i] = as.raw(as.character(y))
        i = i + 3L
      }
    }
    rawToChar(out[out != 00])
  }, character(1), USE.NAMES = FALSE)
}
