#' Insertion Sort with Step-by-Step Tracking
#'
#' Performs an insertion sort on a randomly generated sequence of integers, recording each sorting step.
#'
#' @param N
#' An integer specifying the number of elements in the sequence to be sorted.
#' The sequence is generated as a random permutation of integers from 1 to N.
#'
#' @return A matrix where each row represents the state of the sequence at each step of the sorting process.
#' The first row is the initial, unsorted sequence, and subsequent rows show the sequence after each movement in the insertion sort algorithm.
#' If N is 1, a single-row matrix with the unsorted sequence is returned, as no sorting is needed.
#'
#' @examples
#' insertion_sort_steps(5)  # Sorts a sequence of 5 elements
#' insertion_sort_steps(1)  # Returns the unsorted single-element sequence
#'
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
