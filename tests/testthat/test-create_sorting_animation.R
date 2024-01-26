library(testthat)

test_that("create_sorting_animation handles different input types", {
  # Assuming bubble_sort_steps generates a matrix, convert it to different types
  N <- 5
  matrix_input <- bubble_sort_steps(N)
  df_input <- as.data.frame(matrix_input)

  # Test with matrix and data frame input
  expect_silent(create_sorting_animation(matrix_input))
  expect_silent(create_sorting_animation(df_input))
})

test_that("find_differences_vectorized correctly identifies differences", {
  test_matrix <- matrix(c(1, 3, 2, 4, 1, 2, 3, 4), nrow = 2)
  differences <- find_differences_vectorized(test_matrix)
  expect_equal(differences$left, c(NA, 1))
  expect_equal(differences$right, c(NA, 2))
})
