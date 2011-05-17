\name{stat_function}
\alias{stat_function}
\title{Superimpose a function.}

\description{
  Superimpose a function.
}
\value{a data.frame with additional columns:
\item{x}{x's along a grid}
\item{y}{value of function evaluated at corresponding x}}
\arguments{
  \item{fun}{function to use}
  \item{n}{number of points to interpolate along}
  \item{args}{list of additional arguments to pass to \code{fun}}
}
\examples{x <- rnorm(100)
base <- qplot(x, geom="density")
base + stat_function(fun = dnorm, colour = "red")
base + stat_function(fun = dnorm, colour = "red", arg = list(mean = 3))}