% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/methods.R
\name{coef.mplus.model}
\alias{coef.mplus.model}
\alias{coef.mplusObject}
\title{Return coefficients for an mplus.model object}
\usage{
\method{coef}{mplus.model}(
  object,
  type = c("un", "std", "stdy", "stdyx"),
  params = c("regression", "loading", "undirected", "expectation", "variability", "new"),
  ...,
  raw = FALSE
)

\method{coef}{mplusObject}(object, ...)
}
\arguments{
\item{object}{An object of class mplusObject}

\item{type}{A character vector indicating the type of coefficients to return.
One of \dQuote{un}, \dQuote{std}, \dQuote{stdy}, or \dQuote{stdyx}.}

\item{params}{A character vector indicating what type of parameters to
extract.  Any combination of \dQuote{regression}, \dQuote{loading},
\dQuote{undirected}, \dQuote{expectation}, \dQuote{variability}, and
\dQuote{new}.  A
single one can be passed or multiple.  By default, all are used and
all parameters are returned.}

\item{\dots}{Additional arguments to pass on (not currently used)}

\item{raw}{A logical defaulting to \code{FALSE} indicating whether to
parse and return coefficients based on the type (regression, etc.) and
relabel using an arrow notation, or to return the raw coefficients in a named
vector.}
}
\value{
Either a data frame of class \sQuote{mplus.model.coefs}, or in
  the case of multiple group models, a list of class \sQuote{mplus.model.coefs},
  where each element of the list is a data frame of class \sQuote{mplus.model.coefs},
  or a named vector of coefficients, if \code{raw=TRUE}.
}
\description{
This is a method for returning the coefficients of an mplus.model object.
It works directly on an object stored from \code{readModels} such as:
\code{object <- readModels("/path/to/model/model.out")}.

Method that calls \code{coef.mplus.model}.
See further documentation there.
}
\examples{
\dontrun{
# simple example of a model using builtin data
# demonstrates use
test <- mplusObject(
  TITLE = "test the MplusAutomation Package;",
  MODEL = "
    mpg ON wt hp;
    wt WITH hp;",
  OUTPUT = "STANDARDIZED;",
  usevariables = c("mpg", "wt", "hp"),
  rdata = mtcars)

res <- mplusModeler(test, "mtcars.dat", modelout = "model1.inp", run = 1L)

# example of the coef method on an mplud.model object
# note that res$results holds the results of readModels()
coef(res$results)
coef(res$results, type = "std")
coef(res$results, type = "stdy")
coef(res$results, type = "stdyx")

# there is also a method for mplusObject class
coef(res)

# remove files
unlink("mtcars.dat")
unlink("model1.inp")
unlink("model1.out")
unlink("Mplus Run Models.log")
}
}
\seealso{
\code{\link{readModels}}

Other Mplus-Formatting: 
\code{\link{confint.mplus.model}()},
\code{\link{extract}()},
\code{\link{print.MplusRstructure}()},
\code{\link{summary.mplusObject}()}
}
\author{
Joshua F. Wiley <jwiley.psych@gmail.com>
}
\concept{Mplus-Formatting}
\keyword{interface}
