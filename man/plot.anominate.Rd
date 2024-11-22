\name{plot.anominate}
\alias{plot.anominate}
\title{alpha-NOMINATE Coordinate Plot }

\description{
  \code{plot.anominate} reads an \code{anominate} object and plots the estimated ideal points.
}

\usage{
  \method{plot}{anominate}(x, \dots)
}

\arguments{
  \item{x}{ An \code{anominate} output object. }
  \item{...}{ Other arguments do nothing and are not passed to any functions. }
}

\value{
   A coordinate plot of estimated ideal points (with 95\% credible interval bars) of an \code{anominate} object.
}

\author{
Royce Carroll \email{rcarroll@rice.edu}

Christopher Hare \email{cdhare@ucdavis.edu}

Jeffrey B. Lewis \email{jblewis@ucla.edu}

James Lo \email{lo@uni-mannheim.de}

Keith T. Poole \email{ktpoole@uga.edu}

Howard Rosenthal \email{hl31@nyu.edu}
}

\seealso{
  '\link{anominate}','\link{summary.anominate}','\link{densplot.anominate}','\link{traceplot.anominate}','\link{sen111}', '\link{sen111_anom}'.
}

\examples{
  data(sen111)
  \donttest{
  sen111_anom <- anominate(sen111, dims=1, polarity=2, 
    nsamp=200, thin=1, burnin=100, random.starts=FALSE, 
    verbose=FALSE, constrain=FALSE)
  }
  # 'sen111_anom' can be retrieved quickly with: 
  data(sen111_anom)
  
  plot(sen111_anom)
}

\keyword{ ideal point estimation }
