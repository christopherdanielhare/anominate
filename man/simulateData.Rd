\name{simulateData}
\alias{simulateData}
\title{Simulated Roll Call Vote Matrices Generated with Normal (Gaussian) or Quadratic Utility for alpha-NOMINATE }

\description{
 \code{simulateData} generates a matrix of roll call votes based on the assumption that legislators possess either normal (Gaussian) or quadratic utility functions. The roll call votes can then be analyzed using the alpha-NOMINATE ideal point model. The estimated value of the alpha parameter can then be compared to the known true value (1 for normal (Gaussian) utility, 0 for quadratic utility).
}

\usage{
  simulateData(nvotes=500, nlegis=101, seed=123345, utility="normal")
}

\arguments{
  \item{nvotes}{ integer, number of roll call votes ('m'). }
  \item{nlegis}{ integer, number of legislators ('n'). }
  \item{seed}{ a single value, interpreted as an integer, used to set the seed.
		If seed is NULL, current seed is used. }
  \item{utility}{ String set to either ``normal'' or ``quadratic'', specifying the utility function used to generate the roll call data. }
}

\value{
  An object of class \code{rollcall}
  
  \item{votes}{ n x m roll call vote matrix in 0/1/NA format. }

  \item{codes}{a list with named components \code{yea},
    \code{nay}, \code{notInLegis} and \code{missing}, each component a
    numeric vector (possibly of length 1 and possibly \code{NA}),
    indicating how entries in the \code{votes} component of the
    \code{rollcall} object should be considered.  This list simply gathers
    up the values in the \code{yea}, \code{nay}, \code{notInLegis} and
    \code{missing} arguments passed to the function. }
  
  \item{n}{integer, number of legislators. }

  \item{m}{integer, number of roll call votes. }

  \item{legis.data}{ matrix, user-supplied data on legislators, containing data from
                    an ORD file.  Legislator names are rownames to this matrix.}

  \item{vote.data}{ user-supplied data on roll call votes, set to NULL. }

  \item{desc}{ user-supplied description, set to NULL. }
  
  \item{source}{ user-supplied source information, set to NULL. }
  
}

\seealso{
  '\link{anominate}','\link{summary.anominate}','\link{plot.anominate}','\link{densplot.anominate}','\link{traceplot.anominate}', '\link{norm_anom}', '\link{quad_anom}','\link[pscl]{rollcall}'.
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
  quadratic.data <- simulateData(utility="quadratic") 
  quad_anom <- anominate(quadratic.data, dims=1, polarity=1, 
    nsamp=200, thin=1, burnin=100, random.starts=FALSE, 
    verbose=FALSE, constrain=FALSE)
  }
  # 'quad_anom' can be retrieved quickly with: 
  data(quad_anom)

  summary(quad_anom)
  plot(quad_anom)

  \donttest{
  normal.data <- simulateData(utility="normal") 
  norm_anom <- anominate(normal.data, dims=1, polarity=1, 
    nsamp=200, thin=1, burnin=100, random.starts=FALSE, 
    verbose=FALSE, constrain=FALSE)
  }
  # 'norm_anom' can be retrieved quickly with: 
  data(norm_anom)

  summary(norm_anom)
  plot(norm_anom)
}

\keyword{ideal point estimation}
