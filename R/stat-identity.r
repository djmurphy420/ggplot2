#' Identity statistic.
#' 
#' @param mapping The aesthetic mapping, usually constructed with
#'    \code{\link{aes}} or \code{\link{aes_string}}. Only needs to be set
#'    at the layer level if you are overriding the plot defaults.
#' @param data A layer specific dataset - only needed if you want to override
#'    the plot defaults.
#' @param geom The geom to apply to the data for this layer. 
#' @param position The position adjustment to use for overlapping points
#'    on this layer.
#' @param ... other arguments passed on to the function.
#'
#' @export
#' @examples
#' # Doesn't do anything, so hard to come up a useful example
stat_identity <- function (mapping = NULL, data = NULL, geom = "point", position = "identity", ...) { 
  StatIdentity$new(mapping = mapping, data = data, geom = geom, 
  position = position, ...)
}

StatIdentity <- proto(Stat, {
  objname <- "identity"

  default_geom <- function(.) GeomPoint
  calculate_groups <- function(., data, scales, ...) data
  icon <- function(.) textGrob("f(x) = x", gp=gpar(cex=1.2))
  
  desc_outputs <- list()
  
})
