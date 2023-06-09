# Discrete random variables -------------------------------------------------
#' Discrete Random variable structure
#'
#' @noRd
#' @description
#' Sets the structure of random variables objects in the
#' discrete setting
#'
#' @return A [`DiscreteRandomVariable`] object.
#'
DiscreteRandomVariable <- R6::R6Class(
  "DiscreteRandomVariable",
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

# Binomial random variables ---------------------------------------------------
#' BinomialRandomVariable object
#'
#' @name BionomialRandomVariable
#' @family discrete
#'
#' @description Defines a Binomial random variable. It uses in the backend
#'  all functions that defines a [`Binomial`][rbinom] random variable. As
#'  the other definitions in `distributions` this is an
#'  [`R6`][R6::R6Class] object. Tha parametrization used
#'  is from a \deqn{X \sim \mathsf{Binomial}(n, \theta)\,,}
#'  where the parameters \eqn{n} and \eqn{\theta} are
#'  the number of independent trials and the rate (probability) of success.
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
BinomialRandomVariable <-
  R6::R6Class("Binomial",
    inherit = DiscreteRandomVariable,
    cloneable = FALSE,
    public = list(
      #' @field n (`integer`) \cr
      #'  the number of independent trials, \eqn{n}.
      n = NA,

      #' @field theta (`double`, constrained) \cr
      #'  the probability of success of an independent trial,
      #' \eqn{\theta \in [0,1]}.
      theta = NA,

      #' @description
      #' Generates a Binomial [`DiscreteRandomVariable`] object with specified
      #' number of trials (`n`) and probability of success (`theta`).
      #'
      #' @param n (`integer`) the center of the distribution.
      #' @param theta   (`double`, constrained) the dispersion around
      #'  the center of the distribution.
      initialize = function(n = 10, theta = 0.5) {
        self$n <- n
        self$theta <- theta
      },
      #' @description
      #' Generates random variables using the [`stats::rbinom()`] function.
      #'
      #' @return (`array`) of random numbers from the distribution.
      #' @template sampler
      sample = function(nsamples = 1, nreps = 1) {
        return(
          stats::rbinom(nsamples, self$n, self$theta) |>
            format_samples(nreps)
        )
      },

      #' @description
      #' Evaluates the density function using the [`stats::dbinom()`] function.
      #'
      #' @return (`array`) of evaluations at `x`.
      #' @template density
      density = function(x, log = TRUE) {
        stats::dbinom(x, self$n, self$theta, log = log)
      }
    )
  )

# Poisson random variables ---------------------------------------------------
#' PoissonRandomVariable object
#'
#' @name PoissonRandomVariable
#' @family discrete
#'
#' @description Defines a Poisson random variable. It uses in the backend
#'  all functions that defines a [`Poisson`][rpois] random variable. As
#'  the other definitions in `distributions` this is an
#'  [`R6`][R6::R6Class] object. Tha parametrization used
#'  is from a \deqn{X \sim \mathsf{Poisson}(\lambda)\,,}
#'  where the parameter \eqn{\lambda >0} denotes the rate of ocurrence
#'  of events.
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
PoissonRandomVariable <-
  R6::R6Class("Poisson",
    inherit = DiscreteRandomVariable,
    cloneable = FALSE,
    public = list(
      #' @field lambda (`double`, positive) \cr
      #'  the number of independent trials, \eqn{\lambda > 0}.
      lambda = NA,

      #' @description
      #' Generates a Poisson [`DiscreteRandomVariable`] object with specified
      #' rate of ocurrence of events \eqn{\lambda > 0}.
      #'
      #' @param lambda   (`double`, positive) the rate of events.
      initialize = function(lambda = 1) {
        self$lambda <- lambda
      },
      #' @description
      #' Generates random variables using the [`stats::rpois()`] function.
      #'
      #' @return (`array`) of random numbers from the distribution.
      #' @template sampler
      sample = function(nsamples = 1, nreps = 1) {
        return(
          stats::rpois(nsamples, self$lambda) |>
            format_samples(nreps)
        )
      },
      #' @description
      #' Evaluates the density function using the [`stats::dpois()`] function.
      #'
      #' @return (`array`) of evaluations at `x`.
      #' @template density
      density = function(x, log = TRUE) {
        stats::dpois(x, self$lambda, log = log)
      }
    )
  )
