#' Convert Matrix to SortingStepsMatrix Object
#'
#' This function converts an input matrix into a SortingStepsMatrix object, which is used to represent sorting steps.
#'
#' @param x A matrix representing sorting steps.
#'
#' @return A SortingStepsMatrix object that represents the input matrix as sorting steps.
#'
#' @examples
#' steps_matrix <- matrix(1:9, ncol = 3)
#' sorted_steps <- as.SortingStepsMatrix(steps_matrix)

#' @export
as.SortingStepsMatrix <- function(x) {
  if (!is.matrix(x)) {
    stop("Input must be a matrix.")
  }

  class(x) <- c("SortingStepsMatrix", class(x))
  #class(x) <- append("SortingStepsMatrix", class(x))
  #class(x) <- "SortingStepsMatrix"
  return(x)
}

