

insertion_sort_steps <- function(N)
{

  x <- sample(N)

  # Initialize variables
  sorting_steps_is <- matrix(x, nrow = 1)

  for(i in 2:length(x))
  {
    j <- i
    while(x[j]<x[j-1] && j-1 > 0)
    {
      tmp <- x[j]
      x[j] <- x[j -1]
      x[j - 1] <- tmp
      j <- j-1
      sorting_steps_is <- rbind(sorting_steps_is, x)
    }
  }
  return(sorting_steps_is)
}
