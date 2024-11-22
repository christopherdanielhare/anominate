\name{traceplot.anominate}
\alias{traceplot.anominate}
\title{alpha-NOMINATE Trace Plot }

\description{
  \code{traceplot.anominate} reads an object and plots the density of sampled values of the alpha parameter using the \code{traceplot} function in \code{coda}.
}

\usage{
  \method{traceplot}{anominate}(x, \dots)
}

\arguments{
  \item{x}{ An \code{anominate} output object. }
  \item{...}{ Other arguments to \code{traceplot}. }
}

\value{
   A trace plot of sampled values of alpha.
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
  '\link{anominate}','\link{summary.anominate}','\link{plot.anominate}','\link{densplot.anominate}','\link{sen111}', '\link{sen111_anom}'.
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
  traceplot.anominate(sen111_anom)
}

\keyword{ideal point estimation}
