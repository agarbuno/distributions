#' Continuous Random variable structure
#'
#' @description
#' Sets the structure of random variables objects in the
#' continuous setting
#'
#' @return A [`RandomVariable`] object.
#'
#' @export

ContinuousRandomVariable <- R6::R6Class(
  "ContinuousRandomVariable",
  cloneable = FALSE,
  public = list(

    #' @description
    #' Generates random numbers from that behave like
    #' realizations of the random variable.
    #'
    #' @param nsamples number of samples to generate.
    #' @param ... allows for more inputs.
    #'
    sample = function(nsamples = 1, ...) {

    },

    #' @description
    #' Evaluates the `pdf` of the random variable.
    #'
    #' @param x [`array(double)`] input on where to evaluate density function.
    #' @param log [`Boolean`] indicates if we need the log-density.
    #' @param ... allows for more inputs.
    density = function(x, log = TRUE, ...) {

    }
  )
)



#' Gaussian random variable object
#'
#' @description
#' Defines a Normal random variable
#'
#' @return A [`ContinuousRandomVariable`] object of type [`Gaussian`] type.
#'
#' @export

GaussianRandomVariable <-
  R6::R6Class("Gaussian",
    inherit = ContinuousRandomVariable,
    cloneable = FALSE,
    public = list(
      #' @field mean (`double`)\cr
      #'  the center of the distribution.
      mean = NA,

      #' @field sd (`positive`)\cr
      #'  the dispersion around the mean.
      sd = NA,

      #' @description
      #' Initializes the random variable
      #'
      #' @param mean the center of the distribution.
      #' @param sd   the dispersion around the center of the distribution.
      initialize = function(mean = 0, sd = 1) {
        self$mean <- mean
        self$sd <- sd
      },

      #' @description
      #' Generates random variables using the `rnorm` function.
      #'
      #' @param n (integer) the number of random numbers.
      #' @return [array]
      sample = function(nsamples = 1) {
        stats::rnorm(nsamples, self$mean, sd = self$sd)
      },

      #' @description
      #' Evalluates the density function using the `pnorm` function.
      #'
      #' @param x   (array) to evaluate the density function.
      #' @param log (Boolean) indicates if we are evaluating the `log-density`.
      #' @return [array]
      density = function(x, log = TRUE) {
        stats::dnorm(x, self$mean, sd = self$sd, log = log)
      }
    )
  )
