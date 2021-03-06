% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/BuildEnv_fun.R
\name{buildEnv}
\alias{buildEnv}
\title{Build an environmental space to run the model across}
\usage{
buildEnv(temp, pct.rh, range.res.temp = 1, range.res.rh = 1, twinter,
  winter.res = 24)
}
\arguments{
\item{temp}{a \code{\link[raster]{raster}} or a list of two numbers representing the
minimum and maximum temperatures to run the model across.}

\item{pct.rh}{a \code{\link[raster]{raster}} or a list of two numebers representing
the minimum and maximum percent relative humidity to run the model across.}

\item{range.res.temp}{a single numeber representing the resultion of
\code{temp.range}.}

\item{range.res.rh}{a single numeber representing the resultion of \code{pct.rh.range}.}

\item{twinter}{the maximal length of winter to run the model across in either days or
months.}

\item{winter.res}{temporal resolution of the \code{twinter} vector. Default is
hourly, although other options can be selected.}
}
\value{
returns an expanded dataframe containing all possiable combinations of
temperature and humidity conditions across which the model will be run, as well
as vector to act as the temporal vector to run the model across
}
\description{
\code{buildEnv} builds the environmental parameters across which the
dynamic model will be applied. This does not necessairly need to
represent real-world condtions but can instead be used to explore all of
parameter space.
}
\details{
This step can be a major determinate of how fast the model will run
. If the \code{temp.range} and \code{pct.rh.range} and large or
\code{range.res} is especially fine, this may present computational
challenges downstream.
}
\examples{
##BuildEnv
m.env <- buildEnv(temp = c(1,100),
                  pct.rh = c(1,100),
                  range.res.temp = 1,
                  range.res.rh = 1,
                  twinter = 9,
                  winter.res = 24)
}
\seealso{
\code{\link{hibernationModel}}

Other Model Engine: \code{\link{batDynamic}},
  \code{\link{hibernationModel}}
}
\concept{Model Engine}
