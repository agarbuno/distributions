
#' Gaussian random variable object
#'
#' @description 
#' Normal random variable
#' 
#' 
#' @return A [`RandomVariable`] object.
#'

GaussianRandomVariable <- 
    R6::R6Class("RandomVariable",
          public = list(
            #' @field mean (double)\cr
            #' the center of the distribution.
            mean = NA,

            #' @field sd (positive)\cr
            #' the dispersion around the mean.
            sd = NA,

            #' @description
            #' Initializes the random variable
            #' 
            #' @param mean the center of the distribution.
            #' @param sd   the dispersion around the center of the distribution.
            initialize = function(mean = 0, sd = 1){
              self$mean = mean
              self$sd   = sd
            },
            
            #' @description
            #' Sampler 
            #' 
            #' @param n (integer) the number of random numbers. 
            sample = function(n = 1){
              stats::rnorm(n, self$mean, sd = self$sd)
            },
            
            #' @description 
            #' Density function
            #' 
            #' @param x   (array) to evaluate the density function. 
            #' @param log (Boolean) indicates if we are evaluating the `log-density`. 
            density = function(x, log = TRUE){
              stats::dnorm(x, self$mean, sd = self$sd, log = log)
            }
          ))