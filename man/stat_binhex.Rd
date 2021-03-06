\name{stat_binhex}
\alias{stat_binhex}
\title{Bin 2d plane into hexagons.}
\usage{
  stat_binhex(mapping = NULL, data = NULL, geom = "hex",
    position = "identity", bins = 30, na.rm = FALSE, ...)
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

  \item{bins}{Number of bins to create. Default: 30.}

  \item{na.rm}{If \code{FALSE} (the default), removes
  missing values with a warning.  If \code{TRUE} silently
  removes missing values.}

  \item{...}{other arguments passed on to the function.}
}
\description{
  Bin 2d plane into hexagons.
}
\examples{
d <- ggplot(diamonds, aes(carat, price))
d + stat_binhex()
d + geom_hex()

# You can control the size of the bins by specifying the number of
# bins in each direction:
d + stat_binhex(bins = 10)
d + stat_binhex(bins = 30)

# Or by specifying the width of the bins
d + stat_binhex(binwidth = c(1, 1000))
d + stat_binhex(binwidth = c(.1, 500))

# With qplot
qplot(x, y, data = diamonds, geom="hex", xlim = c(4, 10), ylim = c(4, 10))
qplot(x, y, data = diamonds, geom="hex", xlim = c(4, 10), ylim = c(4, 10),
  binwidth = c(0.1, 0.1))
}
\seealso{
  \code{\link{stat_bin2d}} for rectangular binning
}

