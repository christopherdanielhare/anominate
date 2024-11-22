\name{summary.anominate}
\alias{summary.anominate}
\title{alpha-NOMINATE Summary }
\description{
  \code{summary.anominate} reads an \code{anominate} object and prints a summary.
}

\usage{
\method{summary}{anominate}(object, \dots)
}

\arguments{
  \item{object}{ An \code{anominate} output object. }
  \item{...}{ Other arguments do nothing and are not passed to any functions. }
}

\value{
   A summary of an \code{anominate} object. Reports the number of legislators, votes, dimensions, and descriptive statistics for alpha.
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
  '\link{anominate}','\link{plot.anominate}','\link{densplot.anominate}','\link{traceplot.anominate}'.
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
  
  summary(sen111_anom)
}

\keyword{ ideal point estimation }
