#' Line specified by slope and intercept.
#' 
#' The abline geom adds a line with specified slope and intercept to the
#' plot.
#' 
#' With its siblings \code{geom_hline} and \code{geom_vline}, it's useful for
#' annotating plots.  You can supply the parameters for \code{geom_abline}, 
#' its intercept and slope, in two ways: either explicitly as fixed values or as variables 
#' in a data frame.  If you specify the fixed values
#' (\code{geom_abline(intercept=0, slope=1)}) then the line will be the same
#' in all panels.  If the intercept and slope are stored in a data frame, then 
#' they can vary from panel to panel in a facetted plot.  See the examples for more ideas.
#'
#' @seealso \code{\link{stat_smooth}} to add lines derived from the data,
#'  \code{\link{geom_hline}} for horizontal lines,
#'  \code{\link{geom_vline}} for vertical lines
#'  \code{\link{geom_segment}}
#' @inheritParams geom_point
#' @export
#' @examples
#' p <- qplot(wt, mpg, data = mtcars)
#'
#' # Fixed slopes and intercepts
#' p + geom_abline() # Can't see it - outside the range of the data
#' p + geom_abline(intercept = 20)
#'
#' # Calculate slope and intercept of line of best fit
#' coef(lm(mpg ~ wt, data = mtcars))
#' p + geom_abline(intercept = 37, slope = -5)
#' p + geom_abline(intercept = 10, colour = "red", size = 2)
#' 
#' # See ?stat_smooth for fitting smooth models to data
#' p + stat_smooth(method="lm", se=FALSE)
#' 
#' # Slopes and intercepts as data
#' p <- ggplot(mtcars, aes(x = wt, y=mpg), . ~ cyl) + geom_point()
#' df <- data.frame(a=rnorm(10, 25), b=rnorm(10, 0))
#' p + geom_abline(aes(intercept=a, slope=b), data=df)
#'
#' # Slopes and intercepts from linear model
#' library(plyr)
#' coefs <- ddply(mtcars, .(cyl), function(df) { 
#'   m <- lm(mpg ~ wt, data=df)
#'   data.frame(a = coef(m)[1], b = coef(m)[2]) 
#' })
#' str(coefs)
#' p + geom_abline(data=coefs, aes(intercept=a, slope=b))
#' 
#' # It's actually a bit easier to do this with stat_smooth
#' p + geom_smooth(aes(group=cyl), method="lm")
#' p + geom_smooth(aes(group=cyl), method="lm", fullrange=TRUE)
geom_abline <- function (mapping = NULL, data = NULL, stat = "abline", position = "identity", ...) { 
  GeomAbline$new(mapping = mapping, data = data, stat = stat, position = position, ...)
}

GeomAbline <- proto(Geom, {
  objname <- "abline"

  new <- function(., mapping = NULL, ...) {
    mapping <- compact(defaults(mapping, aes(group = 1)))
    class(mapping) <- "uneval"
    .super$new(., ..., mapping = mapping, inherit.aes = FALSE)
  }
  
  draw <- function(., data, scales, coordinates, ...) {
    xrange <- scales$x.range
    
    data <- transform(data,
      x = xrange[1],
      xend = xrange[2],
      y = xrange[1] * slope + intercept,
      yend = xrange[2] * slope + intercept
    )
    
    GeomSegment$draw(unique(data), scales, coordinates)
  }

  icon <- function(.) linesGrob(c(0, 1), c(0.2, 0.8))
  guide_geom <- function(.) "abline"

  default_stat <- function(.) StatAbline
  default_aes <- function(.) aes(colour="black", size=0.5, linetype=1, alpha=1)
  
  draw_legend <- function(., data, ...) {
    data <- aesdefaults(data, .$default_aes(), list(...))

    with(data, 
      ggname(.$my_name(), segmentsGrob(0, 0, 1, 1, default.units="npc",
      gp=gpar(col=alpha(colour, alpha), lwd=size * .pt, lty=linetype,
        lineend="butt")))
    )
  }
})
