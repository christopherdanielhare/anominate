\name{sen111}
\alias{sen111}
\title{111th U.S. Senate Roll Call Vote Matrix}

\description{
  This dataframe contains a matrix of votes cast by U.S. Senators
  in the 111th Congress.  The data are formatted consistent with the
  \code{rollcall} object format in Simon Jackman's \code{pscl} package.}

\usage{
data(sen111)
}


\value{
  The dataframe contains roll call data for all Senators in the 111th Senate.
  The data is formatted as a \code{rollcall} object with the following elements.

  \item{votes}{ data frame, containing all data from the old \code{nom31.dat} file about
        legislators. For a typical W-NOMINATE object run with an ORD file read using
        \code{readKH}, it will contain the following:
    \describe{
    \item{\code{state}}{ State name of legislator.}
    \item{\code{icpsrState}}{ ICPSR state code of legislator.}
    \item{\code{cd}}{ Congressional District number.}
    \item{\code{icpsrLegis}}{ ICPSR code of legislator.}
    \item{\code{party}}{ Party of legislator.}
    \item{\code{partyCode}}{ ICPSR party code of legislator.}
    }
    }

  \item{codes}{ list of four vectors. \code{yea} shows the codes in \code{votes} that are yea
        votes, 'nay' shows nay codes, \code{notInLegis} shows absences, and \code{missing}
        shows the missing codes. }
  \item{n}{ numeric, number of legislators }
  \item{m}{ numeric, number of roll calls }
  \item{legis.data}{ data frame, containing the following information on legislators:
    \describe{
    \item{\code{state}}{ State name of legislator.}
    \item{\code{icpsrState}}{ ICPSR state code of legislator.}
    \item{\code{cd}}{ Congressional District number.}
    \item{\code{icpsrLegis}}{ ICPSR code of legislator.}
    \item{\code{party}}{ Party of legislator.}
    \item{\code{partyCode}}{ ICPSR party code of legislator.}
   }
   }
  \item{vote.data}{ null, would otherwise be a data frame containing data on the votes. }
  \item{desc}{ null, would otherwise be a string describing the data set. }
  \item{source}{ string, describing where data set was read from. }

}

\source{
  Keith Poole. 2014. \emph{111th Senate Roll Call Vote Data}.
  \url{https://www.voteview.com/}.
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
  '\link{anominate}'.
}

\examples{
  data(sen111)
  summary(sen111)
   
  \donttest{
  sen111_anom <- anominate(sen111, dims=1, polarity=2, 
    nsamp=200, thin=1, burnin=100, random.starts=FALSE, 
    verbose=FALSE, constrain=FALSE)
  }
  # 'sen111_anom' can be retrieved quickly with: 
  data(sen111_anom)

  summary(sen111_anom)
  plot(sen111_anom)
}

\keyword{ datasets }
