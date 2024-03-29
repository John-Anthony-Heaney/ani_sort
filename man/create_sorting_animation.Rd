% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/create_sorting_animation.R
\name{create_sorting_animation}
\alias{create_sorting_animation}
\title{This generic function generates an animated visualization of sorting steps.}
\usage{
create_sorting_animation(sorting_steps_df)
}
\arguments{
\item{sorting_steps_df}{sorting steps object representing sorting steps.}
}
\value{
Animation object depicting the sorting process.
}
\description{
This generic function generates an animated visualization of sorting steps.
}
\examples{
#Not run because the resulting gif comes out as multiple .pngs which gives a note.
#create_sorting_animation(bubble_sort_steps(10))
}
