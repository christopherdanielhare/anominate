\name{anominate}
\alias{anominate}
\title{alpha-NOMINATE: Ideal Point Estimator}
\description{ 
  \code{anominate} is the function that takes a \code{rollcall} object and fits the Bayesian (MCMC-based) alpha-NOMINATE model described in Carroll et al. (2013). The method estimates the structure of political actors' utility functions from roll call data with the inclusion of a separate parameter denoted as alpha. alpha values of 1 indicate normal (Gaussian) utility, while alpha values of 0 indicate quadratic utility.
}

\usage{
anominate(rcObject, dims=1, nsamp=1000, thin=1, burnin=500, minvotes=20, 
	lop=0.025, polarity=1, random.starts=TRUE, verbose=FALSE, constrain=FALSE)
}

\arguments{
  \item{rcObject}{An object of class \code{rollcall}, from Simon Jackman's \code{pscl} package.}
  \item{dims}{integer, number of dimensions to estimate. Must be nonnegative and cannot
                exceed 10 dimensions.}
  \item{nsamp}{interger, total number of iterations for the sampler. \code{nsamp} divided by \code{thin} must be larger than \code{burnin}.}
  \item{thin}{integer, thinning interval for the MCMC samples.}
  \item{burnin}{integer, number of iterations to be discarded.}
  \item{minvotes}{integer, minimum number of votes required for a legislator to be included in the analysis.}
  \item{lop}{ A proportion between 0 and 1, the cut-off used for excluding lopsided
                votes, expressed as the proportion of non-missing votes on the minority side.
                The default, \code{lop=0.025}, eliminates votes where the minority is smaller
                than 2.5%. Inputting a valid proportion will generate a new vector that
                overwrites the \code{lopsided} attribute in the \code{rollcall} object inputted. }
  \item{polarity}{ a vector specifying the legislator in the data set who is conservative on
                    each dimension. For example, \code{c(3,5)} indicates legislator 3 is conservative
                    on dimension 1, and legislator 5 is conservative on dimension 2.
                    Alternatively, polarity can be specified as a string for legislator names
                    found in \code{legis.names} (i.e., \code{c("Bush", "Gore")}) if every legislative name in
                    the data set is unique.  Finally, polarity can be specified as a list (i.e.,
                    \code{list("cd",c(4,5))}) where the first list item is a variable from the roll
                    call object's \code{legis.data}, and the second list item is a conservative
                    legislator on each dimension as specified by the first list item.
                    \code{list("cd",c(4,5))} thus specifies the legislators with congressional
                    district numbers of 4 and 5. }
  \item{random.starts}{logical, indicating whether initial values for the legislator and bill parameters should be randomly drawn from a uniform distribution. If \code{FALSE}, the W-NOMINATE estimates are used as the initial values. }
  \item{verbose}{ logical, indicates whether the progress of W-NOMINATE and alpha-NOMINATE (at each 100th iteration of the MCMC sampler) should be printed to the screen. }
  \item{constrain}{logical, indicates whether alpha should be constrained to equal 1 rather than estimated. This option should be used if more than one dimension is being estimated, which makes the method equivalent to a Bayesian implementation of Poole and Rosenthal's (1997) NOMINATE model. }
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

\author{
Royce Carroll \email{rcarroll@rice.edu}

Christopher Hare \email{cdhare@ucdavis.edu}

Jeffrey B. Lewis \email{jblewis@ucla.edu}

James Lo \email{lo@uni-mannheim.de}

Keith T. Poole \email{ktpoole@uga.edu}

Howard Rosenthal \email{hl31@nyu.edu}
}

\references{
Royce Carroll, Jeffrey B. Lewis, James Lo, Keith T. Poole and Howard Rosenthal. 2013. ``The Structure of Utility in Spatial Models of Voting.''' \emph{American Journal of Political Science} 57(4): 1008-1028.

Jeffrey B. Lewis. \url{ https://voteview.com/ }

Keith Poole and Howard Rosenthal. 1997. \emph{Congress: A Political-Economic History of Roll Call Voting.} New York: Oxford University Press.
}

\seealso{
  '\link{summary.anominate}','\link{plot.anominate}','\link{densplot.anominate}','\link{traceplot.anominate}','\link{simulateData}', '\link{sen111}', '\link{sen111_anom}', '\link[pscl]{rollcall}'.
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
  
  # Summary statistics:
  summary(sen111_anom)
  # Graphical summaries:
  plot(sen111_anom)
  densplot.anominate(sen111_anom)
  traceplot.anominate(sen111_anom)
}

\keyword{ ideal point estimation }
