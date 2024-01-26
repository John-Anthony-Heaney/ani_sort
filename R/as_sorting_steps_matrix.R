#' Convert to SortingStepsMatrix
#'
#' This function takes a matrix and converts it into a SortingStepsMatrix object,
#' which is a matrix with an additional class attribute used for specialized
#' sorting step analysis and visualization in the package.
#'
#' @param x A matrix representing sorting steps.
#' @return A matrix of class 'SortingStepsMatrix'.
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
