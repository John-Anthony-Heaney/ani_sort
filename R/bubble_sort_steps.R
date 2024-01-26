#' Takes positive integer N, creates random vector which is first step in the sort, appends each step to a matrix
#'
#' @param N positive integer
#' @return matrix of steps
#' @examples
#' bubble_sort_steps(10)
#' @export
bubble_sort_steps <- function(N) {
  x <- sample(N)

  # Initialize variables
  sorting_steps <- matrix(x ,nrow = 1)
  step <- 0

  if(N == 1){
    return(as.SortingStepsMatrix(sorting_steps))
  }
  else{


    # Bubble sort algorithm with step tracking
    for (i in 1:(length(x) - 1)) {
      for (j in 1:(length(x) - i)) {
        if (x[j] > x[j+1]) {
          step <- step + 1
          # Swap elements
          tmp <- x[j]
          x[j] <- x[j + 1]
          x[j + 1] <- tmp
          # Store the current state of the vector in the list
          sorting_steps <- rbind(sorting_steps, x)
        }
      }
    }
    return(as.SortingStepsMatrix(sorting_steps))
  }
}
