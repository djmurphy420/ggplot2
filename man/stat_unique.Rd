\name{stat_unique}
\alias{stat_unique}
\title{Remove duplicates.}
\usage{
  stat_unique(mapping = NULL, data = NULL, geom = "point",
    position = "identity", ...)
}
\arguments{
  \item{mapping}{The aesthetic mapping, usually constructed
  with \code{\link{aes}} or \code{\link{aes_string}}. Only
  needs to be set at the layer level if you are overriding
  the plot defaults.}

  \item{data}{A layer specific dataset - only needed if you
  want to override the plot defaults.}

  \item{geom}{The geom to apply to the data for this
  layer.}

  \item{position}{The position adjustment to use for
  overlapping points on this layer.}

  \item{...}{other arguments passed on to the function.}
}
\description{
  Remove duplicates.
}
\examples{
ggplot(mtcars, aes(vs, am)) + geom_point(alpha = 0.1)
ggplot(mtcars, aes(vs, am)) + geom_point(alpha = 0.1, stat="unique")
}

