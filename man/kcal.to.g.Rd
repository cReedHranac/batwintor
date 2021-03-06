% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/CoversionFunctions.R
\name{kcal.to.g}
\alias{kcal.to.g}
\title{\code{kcal.to.g} converts kCal to grams of fat.}
\usage{
kcal.to.g(energy, k1 = 20.1, k2 = 39.3, k3 = 1000)
}
\arguments{
\item{energy}{amount of enegry to convert in kCal}

\item{k1}{constant 1}

\item{k2}{constant 2}

\item{k3}{constant 3}
}
\description{
\code{kcal.to.g} converts kCal to grams of fat.
}
\examples{
# ConvertToFat
e <- 1:100

r <- kcal.to.g(e)

plot(e, r, xlab = "Energy (kJ)", ylab = "Energy KCal",
     main = "kcal.to.g")
}
