

create_sorting_animation <- function(sorting_steps_df) {

  # Convert the matrix to a data frame if it's not already
  if (!is.data.frame(sorting_steps_df)) {
    sorting_steps_df <- as.data.frame(sorting_steps_df)
  }

  N <- ncol(sorting_steps_df)

  # Ensure column names are set
  colnames(sorting_steps_df) <- seq_len(ncol(sorting_steps_df))

  # Initialize a ggplot
  p <- ggplot2::ggplot(mapping = ggplot2::aes(group = step)) +
    ggplot2::labs(title = 'Step: {frame_time}', x = 'Position', y = 'Value') +
    gganimate::transition_time(time = 1: nrow(sorting_steps_df)) +
    gganimate::ease_aes('linear')+
    ggplot2::ylim(0, N)

  # Add columns as separate geom_col layers
  for (i in seq_len(ncol(sorting_steps_df))) {
    p <- p + ggplot2::geom_col(data = data.frame(step = 1:nrow(sorting_steps_df),
                                        position = i,
                                        value = sorting_steps_df[[i]]),
                      ggplot2::aes(x = position, y = value, fill = position == find_differences_vectorized(sorting_steps_df)$left|position ==find_differences_vectorized(sorting_steps_df)$right),
                      show.legend = FALSE)}


  p <- p + ggplot2::scale_fill_manual(values = c(`TRUE` = "blue", `FALSE` = "grey"))


  gganimate::animate(p, end_pause = 10, height = 500, width = 800)
}




find_differences_vectorized <- function(matrix) {
  n_rows <- nrow(matrix)


  compare_rows <- function(index, mat) {
    if (index < nrow(mat)) {
      differences <- which(mat[index, ] != mat[index + 1, ])
      return(head(differences, 2))
    }
  }


  differences <- t(sapply(1:(n_rows-1), compare_rows, mat = matrix))

  left_vector <- c(NA, differences[, 1])
  right_vector <- c(NA, differences[, 2])

  return(list(left = left_vector, right = right_vector))
}




