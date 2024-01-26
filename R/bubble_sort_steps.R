
bubble_sort_steps <- function(N)
{


  x <- sample(N)

  # Initialize variables
  sorting_steps <- matrix(x ,nrow = 1)
  step <- 0

  if(N == 1){
    return(sorting_steps)
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
    return(sorting_steps)
  }
}
