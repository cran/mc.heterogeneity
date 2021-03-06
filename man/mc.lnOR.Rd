% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/mc.lnOR.R
\name{mc.lnOR}
\alias{mc.lnOR}
\title{Natural-Logarithm-Transformed Odds Ratio (lnOR): Monte Carlo Based Heterogeneity Test for Between-study Heterogeneity in Random- or Mixed- Effects Model}
\source{
C. Silagy (2003), Nicotine replacement therapy for smoking cessation (Cochrane Review). The Cochrane Library, 4, John Wiley \& Sons, Chichester.
}
\usage{
mc.lnOR(
  n_00,
  n_01,
  n_10,
  n_11,
  model = "random",
  mods = NULL,
  nrep = 10^4,
  p_cut = 0.05,
  mc.include = FALSE
)
}
\arguments{
\item{n_00}{a vector of number of participants who score negatively on both Y1 and Y2 (e.g., mortality cases in the control group).}

\item{n_01}{a vector of number of participants who score negatively on Y1 and positively on Y2  (e.g., recovery cases in the control group).}

\item{n_10}{a vector of number of participants who score positively on Y1 and negatively on Y2 (e.g., mortality cases in the experimental group).}

\item{n_11}{a vector of number of participants who score positively on both Y1 and Y2 (e.g., recovery cases in the experimental group).}

\item{model}{choice of random- or mixed- effects models. Can only be set to \code{"random"}, or \code{"mixed"}.}

\item{mods}{optional argument to include one or more moderators in the model. \code{mods} is NULL for random-effects model and a dataframe for mixed-effects model. A single moderator can be given as a vector of length \eqn{k} specifying the values of the moderator. Multiple moderators are specified by giving a matrix with \eqn{k} rows and as many columns as there are moderator variables. See \code{\link[metafor:rma.uni]{rma}} for more details.}

\item{nrep}{number of replications used in Monte Carlo Simulations. Default to 10^4.}

\item{p_cut}{cutoff for p-values, which is the alpha level. Default to 0.05.}

\item{mc.include}{if true, Monte Carlo simulation results are included in the output (e.g., Monte Carlo critical values).}

\item{lnOR}{a vector of natural-logarithm-transformed odds ratio in the included studies, which is calculated as ln(n11*n00/n01/n10)}
}
\description{
\code{mc.lnOR} returns the Monte Carlo based tests of the residual heterogeneity in random- or mixed- effects model of natural-logarithm-transformed observed odds ratio (lnOR).
}
\details{
For odds ratio, its standard error will be infinite if any one of the four cells in the contingency tables is zero. In this case, Haldane and Anscombe correction is used by adding 0.5 to each cell value (Anscombe, 1956; Haldane, 1940).
This function returns the test statistics as well as their p-value and significances using (1) Q-test, (2) Monte Carlo Based Heterogeneity Test with Maximum Likelihood (ML), and (3) Monte Carlo Based Heterogeneity Test with Restricted Maximum Likelihood (REML).

The results of significances are classified as "sig" or "n.s" based on the cutoff p-value (i.e., alpha level). "sig" means that the between-study heterogeneity is significantly different from zero whereas "n.s" means the between-study heterogeneity is not significantly different from zero. The default alpha level is 0.05.
}
\examples{
# A meta-analysis consists of 26 studies on nicotine replacement therapy for smoking cessation
library(HSAUR3)
data(smoking)
# Y1: receive treatment; Y2: stop smoking
n_00 <- smoking$tc - smoking$qc  # not receive treatement yet not stop smoking
n_01 <- smoking$qc # not receive treatement but stop smoking
n_10 <- smoking$tt - smoking$qt # receive treatement but not stop smoking
n_11 <- smoking$qt # receive treatement and stop smoking
lnOR <- log(n_11*n_00/n_01/n_10)
\dontrun{
mc.run <- mc.lnOR(n_00, n_01, n_10, n_11, model = 'random', p_cut = 0.05)
}
## Note: this mc.lnOR() function will soon be deprecated
## and replaced by \link[boot.heterogeneity]{boot.lnOR} in
## package [boot.heterogeneity](https://CRAN.R-project.org/package=boot.heterogeneity).
}
\references{
Anscombe, F. J. (1956). On estimating binomial response relations. Biometrika, 43(3/4), 461–464.

Haldane, J. (1940). The mean and variance of| chi 2, when used as a test of homogeneity, when expectations are small. Biometrika, 31(3/4), 346–355.

Viechtbauer, W. (2010). Conducting meta-analyses in R with the metafor package. Journal of Statistical Software, 36(3), 1-48. URL: https://www.jstatsoft.org/v36/i03/
}
