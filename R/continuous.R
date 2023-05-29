
#' Create random samples from a normal distribution
#'
#' @param nsamples an integer
#'
#' @return A vector with random numbers
#' @export
#'
#' @examples
#' x <- random(10)
random <- function(nsamples){
    rnorm(nsamples)
}
