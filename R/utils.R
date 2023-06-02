# misc ------------------------------------------------------------------------
#'
#' @family utils
#' @export
#'
format_samples <- function(samples, nreps) {
  if (nreps > 1) {
    return(samples |> matrix(nrow = nreps))
  } else {
    return(samples)
  }
}
