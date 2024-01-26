library(testthat)

# Load the function if not already loaded
# source("path_to_your_function/insertion_sort_steps.R")

test_that("insertion_sort_steps sorts correctly", {
  set.seed(123) # Setting seed for reproducibility
  N <- 5
  result <- insertion_sort_steps(N)
  sorted_vector <- result[nrow(result), ]

  # Check if the final row (sorted vector) is indeed sorted
  expect_false(is.unsorted(sorted_vector))
})

test_that("insertion_sort_steps returns a matrix", {
  N <- 5
  result <- insertion_sort_steps(N)

  # Check if the result is a matrix
  expect_true(is.matrix(result))
})

test_that("insertion_sort_steps handles edge cases", {

  # Test with N = 1 (only one element to sort)
  result_one <- insertion_sort_steps(1)
  expect_equal(nrow(result_one), 1)
  expect_equal(ncol(result_one), 1)

})
