# Continuous random variables -------------------------------------------------
#' Continuous Random variable structure
#'
#' @noRd
#' @description
#' Sets the structure of random variables objects in the
#' continuous setting
#'
#' @return A [`ContinuousRandomVariable`] object.
#'
ContinuousRandomVariable <- R6::R6Class(
  "ContinuousRandomVariable",
  cloneable = FALSE,
  public = list(

    #' @description
    #' Generates random numbers from that behave like
    #' realizations of the random variable.
    #'
    #' @param nsamples (integer) number of samples to generate.
    #' @param ... allows for more inputs.
    #'
    sample = function(nsamples = 1, ...) {

    },

    #' @description
    #' Evaluates the `pdf` of the random variable.
    #'
    #' @param x [`array`] input on where to evaluate density function.
    #' @param log [`logical`] indicates if we need the log-density.
    #' @param ... allows for more inputs.
    density = function(x, log = TRUE, ...) {

    }
  )
)

# Gaussian random variables ---------------------------------------------------
#' GaussianRandomVariable object
#'
#' @name GaussianRandomVariable
#' @family continuous
#'
#' @description Defines a Normal random variable. It uses in the backend
#'  all functions that defines a [`Gaussian`][rnorm] random variable. As
#'  the other definitions in `distributions` this is an
#'  [`R6`][R6::R6Class] object. Tha parametrization used
#'  is from a \deqn{X \sim \mathsf{Normal}(\mu, \sigma)\,,}
#'  where the parameters \eqn{\mu} and \eqn{\sigma} are 
#'  the mean and standard deviation, respectively.
#'
#'  ## Note
#'   All random variables in `distributions` are defined as [`R6`]
#'   objects. The `fields` (referenced below) are needed for objects of
#'   [`R6::R6Class`]. In our context these are what defines
#'   which specific instance of a
#'   random variable is used. That is, the public `fields` are the
#'   parameters of the random variable \eqn{\theta \in \mathbb{R}^p}, for some
#'   \eqn{p}.
#'
#'
#' @export
GaussianRandomVariable <-
  R6::R6Class("Gaussian",
    inherit = ContinuousRandomVariable,
    cloneable = FALSE,
    public = list(
      #' @field mean (`double`) \cr
      #'  the center of the distribution, \eqn{\mu}.
      mean = NA,

      #' @field sd (`double`, positive) \cr
      #'  the dispersion around the mean, \eqn{\sigma \geq 0}.
      sd = NA,

      #' @description
      #' Generates a Gaussian [`ContinuousRandomVariable`] object with specified
      #' mean (`mean`) and standard deviation (`sd`).
      #'
      #' @param mean (`double`) the center of the distribution.
      #' @param sd   (`double`, positive) the dispersion around
      #'  the center of the distribution.
      initialize = function(mean = 0, sd = 1) {
        self$mean <- mean
        self$sd <- sd
      },
      #' @description
      #' Generates random variables using the [`stats::rnorm()`] function.
      #'
      #' @return (`array`) of random numbers from the distribution.
      #' @template sampler
      sample = function(nsamples = 1) {
        stats::rnorm(nsamples, self$mean, sd = self$sd)
      },

      #' @description
      #' Evaluates the density function using the [`stats::dnorm()`] function.
      #'
      #' @return (`array`) of evaluations at `x`.
      #' @template density
      density = function(x, log = TRUE) {
        stats::dnorm(x, self$mean, sd = self$sd, log = log)
      }
    )
  )
