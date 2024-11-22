\name{quad_anom}
\alias{quad_anom}
\title{alpha-NOMINATE Result for Simulated Roll Call Matrix using Quadratic Utility}

\description{
  An object of class \code{anominate} that contains the estimated alpha-NOMINATE result for data simulated using quadratic utility. Although it can easily be obtained from calling the example in \code{simulateData}, it is included here to facilitate illustration of the examples for the plot and summary functions.
}

\usage{
data(quad_anom)
}

\value{
    An object of class \code{anominate}, which in this documentation is also referred to
    as an alpha-NOMINATE object.

    \item{alpha}{An object of class \code{mcmc} with the sampled values of the alpha parameter. }
    \item{beta}{An object of class \code{mcmc} with the sampled values of the beta parameter. }
    \item{legislators}{A object of class \code{mcmc} with the sampled values of the legislator ideal points, with each dimension stored in a separate list (e.g., the first dimension coordinates are stored in \code{legislators[[1]]}, the second dimension coordinates in \code{legislators[[2]]}, etc.). }
    \item{yea.locations}{A object of class \code{mcmc} with the sampled values of the Yea locations (midpoint - spread in W-NOMINATE) for each vote, with each dimension stored in a separate list (e.g., the first dimension coordinates are stored in \code{yea.locations[[1]]}, the second dimension coordinates in \code{yea.locations[[2]]}, etc.). }
    \item{nay.locations}{A object of class \code{mcmc} with the sampled values of the Nay locations (midpoint + spread in W-NOMINATE) for each vote, with each dimension stored in a separate list (e.g., the first dimension coordinates are stored in \code{nay.locations[[1]]}, the second dimension coordinates in \code{nay.locations[[2]]}, etc.). }
    \item{wnom.result}{An object of class \code{nomObject} with the W-NOMINATE (\code{wnominate}) results. }
}

\seealso{
  '\link{anominate}','\link{simulateData}','\link{norm_anom}'.
}

\author{
Royce Carroll \email{rcarroll@rice.edu}

Christopher Hare \email{cdhare@ucdavis.edu}

Jeffrey B. Lewis \email{jblewis@ucla.edu}

James Lo \email{lo@uni-mannheim.de}

Keith T. Poole \email{ktpoole@uga.edu}

Howard Rosenthal \email{hl31@nyu.edu}
}

\examples{
  \donttest{
  quadrartic.data <- simulateData(utility="quadratic") 
  quad_anom <- anominate(quadrartic.data, dims=1, polarity=1, 
    nsamp=200, thin=1, burnin=100, random.starts=FALSE, 
    verbose=FALSE, constrain=FALSE)
  }
  # 'quad_anom' can be retrieved quickly with: 
  data(quad_anom)
  
  summary(quad_anom)
  plot(quad_anom)
}

\keyword{ datasets }
