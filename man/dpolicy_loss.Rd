\name{dpolicy_loss}
\alias{dpolicy_loss}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Density of the policy loss
}
\description{Density of the policy loss 
}
\usage{
dpolicy_loss(l, mu, delta, lambda, theta, family, y.max = 300,zt=TRUE)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{l}{vector at which the density is evaluated
}
  \item{mu}{expectation of the Gamma distribution
}
  \item{delta}{dispersion parameter of the Gamma distribution
}
  \item{lambda}{parameter of the (zero-truncated) Poisson distribution
}
  \item{theta}{copula parameter
}
  \item{family}{an integer defining the bivariate copula family: 1 = Gauss, 3 = Clayton, 4=Gumbel, 5=Frank
}
  \item{y.max}{upper value of the finite sum that we use to approximate the infinite sum, see below for details
}
\item{zt}{logical. If \code{zt=TRUE}, we use a zero-truncated Poisson variable. Otherwise, we use a Poisson variable. Default is \code{TRUE}.
} 
}
\details{For a Gamma distributed variable X and a (zero truncated) Possion variable Y, the policy loss is defined as \eqn{L=X\cdot Y}. Its density is an infinite sum of weighted Gamma densities. The parameter \code{y.max} is the upper value of the finite sum that approximates the infinite sum.
}
\value{density, evaluated at the vector l
}
\references{N. Kraemer, E. Brechmann, D. Silvestrini, C. Czado (2013): Total loss estimation using copula-based regression models. Insurance: Mathematics and Economics 53 (3), 829 - 839.
}
\author{Nicole Kraemer
}
\note{
lambda and mu can be scalars, or vectors of the same length as l
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
\code{\link{epolicy_loss}}, \code{\link{qpolicy_loss}}
}
\examples{
# example taken from the paper
library(VineCopula)
mu<-1000
delta<-0.09
lambda<-2.5
family<-1
theta<-BiCopTau2Par(tau=0.5,family=family)
l<-seq(1,7000,length=100)
out<-dpolicy_loss(l,mu,delta,lambda,theta,family)
plot(l,out,type="l",lwd=3,xlab="loss",ylab="density")


}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{distribution}
