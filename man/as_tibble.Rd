% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/data_dict.R
\name{as_tibble}
\alias{as_tibble}
\alias{as_tibble.dictionary}
\title{as_tibble}
\usage{
\method{as_tibble}{dictionary}(
  x,
  n = length(x),
  include_other = TRUE,
  code_sep = ifelse(interactive(), "|", "\\n"),
  ...
)
}
\arguments{
\item{x}{a `dictionary` object}

\item{n}{number of rows to convert}

\item{include_other}{if `TRUE` other variables with be included in the tibble}

\item{code_sep}{the separator used between codes and values}
}
\description{
as_tibble

Convert dictionary object to a 'tibble'
}
\keyword{internal}
