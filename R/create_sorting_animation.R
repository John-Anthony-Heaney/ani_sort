#' This generic function generates an animated visualization of sorting steps.
#'
#' @param sorting_steps_df sorting steps object representing sorting steps.
#' @return Animation object depicting the sorting process.
#' @export
create_sorting_animation <- function(sorting_steps_df) {
  UseMethod("create_sorting_animation", sorting_steps_df)
}

#' Create Sorting Animation for SortingStepsMatrix
#'
#' This function takes a `SortingStepsMatrix` object, which typically represents
#' the steps involved in a sorting algorithm, and creates an animated visualization
#' using `ggplot2` and `gganimate`. The animation shows the progression of the
#' sorting process step by step.
#'
#' @param sorting_steps_df A data frame or matrix of class `SortingStepsMatrix`,
#' typically representing the steps in a sorting algorithm. Each row should
#' represent a step, and each column a different element being sorted.
#'
#' @return An animation object created by `gganimate`, visualizing the sorting steps.
#' The animation can be played in R's viewer pane or saved as a GIF or video file.
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




