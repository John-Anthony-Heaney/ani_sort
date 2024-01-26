#' This generic function generates an animated visualization of sorting steps.
#'
#' @param sorting_steps_df sorting steps object representing sorting steps.
#' @return Animation object depicting the sorting process.
#' @examples
#' #Not run because the resulting gif comes out as multiple .pngs which gives a note.
#' #create_sorting_animation(bubble_sort_steps(10))
#' @export
create_sorting_animation <- function(sorting_steps_df) {
  UseMethod("create_sorting_animation", sorting_steps_df)
}

#' Create Sorting Animation
#'
#' Generates an animated visualization of a sorting process, using the steps recorded during the sorting.
#'
#' @param sorting_steps_df
#' A data frame or matrix where each row represents the state of the sequence at a particular step of sorting.
#' The columns represent the elements in the sequence.
#'
#' @return An animation object that visually represents the sorting process step-by-step.
#' Each frame of the animation corresponds to one step in the sorting process.
#'
#' @importFrom utils head
#' @importFrom stats step
#'
#' @examples
#' #Not run because the resulting gif comes out as multiple .pngs which gives a note.
#' #create_sorting_animation(bubble_sort_steps(10))
#'
#' @export
create_sorting_animation.SortingStepsMatrix <- function(sorting_steps_df) {
  if (!is.data.frame(sorting_steps_df)) {
    sorting_steps_df <- as.data.frame(sorting_steps_df)
  }

  # Ensure column names are set
  colnames(sorting_steps_df) <- seq_len(ncol(sorting_steps_df))

  # Calculate N as the number of columns in sorting_steps_df
  N <- ncol(sorting_steps_df)

  # Initialize a ggplot
  p <- ggplot2::ggplot(mapping = ggplot2::aes_string(x = "position", y = "value", group = "step", fill = "fill")) +
    ggplot2::labs(title = 'Step: {frame_time}', x = 'Position', y = 'Value') +
    gganimate::transition_time(time = 1: nrow(sorting_steps_df)) +
    gganimate::ease_aes('linear') +
    ggplot2::ylim(0, N)

  # Add columns as separate geom_col layers
  for (i in seq_len(N)) {
    df_i <- data.frame(step = 1:nrow(sorting_steps_df),
                       position = i,
                       value = sorting_steps_df[[i]])
    df_i$fill = df_i$position == find_differences_vectorized(sorting_steps_df)$left | df_i$position == find_differences_vectorized(sorting_steps_df)$right
    p <- p + ggplot2::geom_col(data = df_i,
                               show.legend = FALSE)
  }

  p <- p + ggplot2::scale_fill_manual(values = c(`TRUE` = "blue", `FALSE` = "grey"))

  pg <- gganimate::animate(p, end_pause = 10, height = 500, width = 800)

  return(pg)
}


#' This takes in a matrix, checks for the differences between the rows in the matrix
#'
#' @param matrix the matrix of sorting steps
#' @return list of differences between the rows
find_differences_vectorized <- function(matrix) {
  n_rows <- nrow(matrix)


  compare_rows <- function(index, mat) {
    if (index < nrow(mat)) {
      differences <- which(mat[index, ] != mat[index + 1, ])
      return(utils::head(differences, 2))
    }
  }


  differences <- t(sapply(1:(n_rows-1), compare_rows, mat = matrix))

  left_vector <- c(NA, differences[, 1])
  right_vector <- c(NA, differences[, 2])

  return(list(left = left_vector, right = right_vector))
}




