\name{stat_sum}
\alias{stat_sum}
\title{Sum unique values.  Useful for overplotting on scatterplots.}
\usage{
  stat_sum(mapping = NULL, data = NULL, geom = "point",
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
\value{
  a data.frame with additional columns \item{n}{number of
  observations at position} \item{prop}{percent of points
  in that panel at that position}
}
\description{
  Sum unique values.  Useful for overplotting on
  scatterplots.
}
\examples{
d <- ggplot(diamonds, aes(x = cut, y = clarity))
# Need to control which group proportion calculated over
# Overall proportion
d + stat_sum(aes(group = 1))
d + stat_sum(aes(group = 1)) + scale_size(range = c(3, 10))
d + stat_sum(aes(group = 1)) + scale_area(range = c(3, 10))
# by cut
d + stat_sum(aes(group = cut))
d + stat_sum(aes(group = cut, colour = cut))
# by clarity
d + stat_sum(aes(group = clarity))
d + stat_sum(aes(group = clarity, colour = cut))

# Instead of proportions, can also use sums
d + stat_sum(aes(size = ..n..))

# Can also weight by another variable
d + stat_sum(aes(group = 1, weight = price))
d + stat_sum(aes(group = 1, weight = price, size = ..n..))

# Or using qplot
qplot(cut, clarity, data = diamonds)
qplot(cut, clarity, data = diamonds, stat = "sum", group = 1)
}
\seealso{
  \code{\link{ggfluctuation}} for a fluctuation diagram,
}

