# Ani_sort: R package for visualisating sorting algorithms 

## Function Descriptions:

### as.SortingStepsMatrix:
This function takes a matrix as input and returns a SortingStepsMatrix object with an extra class attribute for more advanced sorting step analysis and display inside the package. Sorting steps are represented by the input matrix, and this information is preserved in the resulting SortingStepsMatrix It is an essential data structure that allows for deeper understanding of sorting algorithms by allowing users to use functions specifically designed for sorting steps.

### create_sorting_animation:
The generation of an animated representation that shows the sorting procedure is coordinated by this generic function. It serves as a link to methods depending on the sorting steps object’s type of input. By offering many sorting phases, users can create animations that help in the understanding of sorting algorithms. The result is a useful tool for analysis and teaching and can be seen in R’s viewer window or saved as a GIF or video file.

### create_sorting_animation.SortingStepsMatrix:
Specifically designed for SortingStepsMatrix objects, this function makes use of ggplot2 and gganimate to generate an aesthetically pleasing animation that shows the development of a sorting algorithm. This generated animation improves understanding of the sorting process by representing each row in the given matrix as a stage in the sorting process, it is a helpful tool for teaching and studying sorting algorithms since user can see how items move and rearrange throughout the process.

### find_differences_vectorized:
This function returns a list containing vectors that show the places of differences after analysing a matrix of sorting steps to discover discrepancies between consecutive rows. It makes effective use of vectorized operations to improve efficiency. The positions where values vary between subsequent stages by the left and right vectors, which offer important insights into the changes that take place during the sorting process. This feature helps users comprehend how items change while the algorithm runs by contributing to the in-depth study and visualization of sorting algorithms.

### insertion_sort_steps:
This function, which is intended for analytical reasons, creates a matrix that shows the insertion sort algorithms step-by-step development visually. The function generates a matrix of integer ‘N’ and using the insertion sort algorithm on a randomly generated vector of length N . The insertion sort process can be visualized with the help of the matrix, as each row shows the vector’s state following a sorting phase. The final matrix, contained within a SortingStepsMatrix object, serves as a very helpful tool for learning and instructing insertion sort.

## Completed Tasks

- [x] Add method to code base.
- [x] fix description to remove warning error
- [x] Roxygen help documentation including examples for all functions
- [x] A vignette which explains the use of the package in an informative way.
- [x] Make Descritipion file informative and concise and include link to github
- [x] create testthat unit tests
- [x] create vignette
- [x] update gitignore
- [x] update Rbuildignore
- [x] update testthat unit test for create_sorting_animation to include verification that a .gif was created
- [x] Function Descriptions:



  
      
