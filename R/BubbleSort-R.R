array = c(34, 56, 4, 10, 77, 51, 93, 30, 5, 52)

cat("Unsorted Array")
for (i in 1:n)
  cat(array[i], "")

n<-length(array)

for (i in 1:(n-1))
  for (j in (i+1):n)
    if (array[i] > array[j]) {
      temp<-array[i]
      array[i]<-array[j]
      array[j]<-temp
    }

cat("Sorted Array")
for (i in 1:n)
  cat(array[i], "")

