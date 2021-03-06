#' Scale for shapes, aka glyphs.
#' 
#' A continuous variable can not be mapped to shape.
#'
#' @param ... potential scale parameters: \code{name}, \code{breaks},
#'  \code{labels}, \code{na.value}, \code{limits} and \code{trans}.  See
#'  the argument list of \code{\link{discrete_scale}}.
#' @param solid Are the shapes solid? Default: TRUE.
#'
#' @rdname scale_shape
#' @export
#' @examples
#' dsmall <- diamonds[sample(nrow(diamonds), 100), ]
#' 
#' (d <- qplot(carat, price, data=dsmall, shape=cut))
#' d + scale_shape(solid = TRUE) # the default
#' d + scale_shape(solid = FALSE)
#' d + scale_shape(name="Cut of diamond")
#' d + scale_shape(name="Cut of\ndiamond")
#' 
#' # To change order of levels, change order of 
#' # underlying factor
#' levels(dsmall$cut) <- c("Fair", "Good", "Very Good", "Premium", "Ideal")
#' 
#' # Need to recreate plot to pick up new data
#' qplot(price, carat, data=dsmall, shape=cut)
#' 
#' # Or for short:
#' d %+% dsmall
scale_shape <- function(..., solid = TRUE) {
  discrete_scale("shape", "shape_d", shape_pal(solid), ...)
}

#' @rdname scale_shape
#' @export
scale_shape_discrete <- scale_shape

#' @rdname scale_shape
#' @export
scale_shape_continuous <- function(...) {
  stop("A continuous variable can not be mapped to shape", call. = FALSE)
}

icon.shape <- function(.) {
  gTree(children=gList(
    circleGrob(0.7, 0.7, r=0.1),
    segmentsGrob(0.2, 0.3, 0.4, 0.3),
    segmentsGrob(0.3, 0.2, 0.3, 0.4),
    polygonGrob(c(0.2, 0.2, 0.4, 0.4), c(0.8, 0.6, 0.6, 0.8)),
    polygonGrob(c(0.6, 0.7, 0.8), c(0.2, 0.4, 0.2))
  ))
}
