\name{stat_density2d}
\alias{stat_density2d}
\title{2d density estimation.}

\description{
  2d density estimation.
}
\arguments{
  \item{contour}{If \code{TRUE}, contour the results of the 2d density
estimation}
  \item{n}{number of grid points in each direction}
  \item{...}{other arguments passed on to \code{\link{kde2d}}}
}
\examples{m <- ggplot(movies, aes(x=rating, y=length)) + 
geom_point() + 
scale_y_continuous(limits=c(1, 500))
m + geom_density2d()

dens <- MASS::kde2d(movies$rating, movies$length, n=100)
densdf <- data.frame(expand.grid(rating = dens$x, length = dens$y),
z = as.vector(dens$z))
m + geom_contour(aes(z=z), data=densdf)

m + geom_density2d() + scale_y_log10()
m + geom_density2d() + coord_trans(y="log10")

m + stat_density2d(aes(fill = ..level..), geom="polygon")

qplot(rating, length, data=movies, geom=c("point","density2d")) +     
ylim(1, 500)

# If you map an aesthetic to a categorical variable, you will get a
# set of contours for each value of that variable
qplot(rating, length, data = movies, geom = "density2d", 
colour = factor(Comedy), ylim = c(0, 150))
qplot(rating, length, data = movies, geom = "density2d", 
colour = factor(Action), ylim = c(0, 150))
qplot(carat, price, data = diamonds, geom = "density2d", colour = cut)

# Another example ------
d <- ggplot(diamonds, aes(carat, price)) + xlim(1,3)
d + geom_point() + geom_density2d()

# If we turn contouring off, we can use use geoms like tiles:
d + stat_density2d(geom="tile", aes(fill = ..density..), contour = FALSE)
last_plot() + scale_fill_gradient(limits=c(1e-5,8e-4))

# Or points:
d + stat_density2d(geom="point", aes(size = ..density..), contour = FALSE)}