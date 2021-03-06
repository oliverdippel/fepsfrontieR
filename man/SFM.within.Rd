% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/sfm_within.R
\name{SFM.within}
\alias{SFM.within}
\title{< Within transformation & calculation of log.likelihood >}
\usage{
SFM.within(par = c(), xv, y, z, N, Time, mu = 0, optim = F)
}
\arguments{
\item{par}{is a vector of regression coefficients & variance parameters.
1st parameter: sigma_u, 2nd parameter: sigma_v, followed by K beta & R delta coefficients}

\item{xv}{is a n*t x k matrix (explantatory variables)}

\item{y}{is a n*t x 1 vector (response)}

\item{z}{is a n*t x r matrix (inefficency determinants)}

\item{N}{is a number (n - panels)}

\item{mu}{is a number (mean of the truncated normal distribution of the inefficency)}

\item{optim}{is a boolean (set F to obtain a list of model variables.
T to obtain the -sum of log.likelihood)}

\item{T}{is a number (observations per panel)}
}
\value{
< Describe what is returned when applying this functino >
}
\description{
< Within transformation & calculation of log.likelihood >
}
\examples{
< create an example (look at lm() or something like that) >
}
