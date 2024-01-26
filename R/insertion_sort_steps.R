#' Takes positive integer N, creates random vector which is first step in the sort, appends each step to a matrix
#'
#' @param N positive integer
#' @return matrix of steps
#' @export
insertion_sort_steps <- function(N) {
  x <- sample(N)

  # Initialize variables
  sorting_steps_is <- matrix(x, nrow = 1)

  if(N == 1)
  {
    return(as.SortingStepsMatrix(sorting_steps_is))
  }
  else{

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
    return(as.SortingStepsMatrix(sorting_steps_is))
  }
}
