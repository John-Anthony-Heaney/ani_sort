#' Bubble Sort with Step-by-Step Tracking
#'
#' Performs a bubble sort on a random sequence of integers, recording each sorting step.
#'
#' @param N
#' Integer for the number of elements to sort. The function creates a random sequence from 1 to N.
#'
#' @return A matrix where each row shows the sequence at a particular step of sorting.
#' The first row is the original sequence, and subsequent rows show the sequence after each swap.
#' If N is 1, returns the original single element as no sorting is needed.
#'
#' @examples
#' bubble_sort_steps(5)  # Sorts a sequence of 5 elements
#' bubble_sort_steps(1)  # Returns a single-element sequence
#'
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
