% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/bin_character_completeness.R
\name{bin_character_completeness}
\alias{bin_character_completeness}
\title{Phylogenetic character completeness in time-bins}
\usage{
bin_character_completeness(
  cladistic_matrix,
  time_tree,
  time_bins,
  plot = FALSE,
  confidence.interval = 0.95
)
}
\arguments{
\item{cladistic_matrix}{A cladistic matrix in the form imported by \link{read_nexus_matrix}.}

\item{time_tree}{A time-scaled phylogenetic tree containing all the taxa in \code{cladistic_matrix}.}

\item{time_bins}{A set of time bin boundaries (oldest to youngest) in millions of years.}

\item{plot}{An optional choice to plot the results (default is \code{FALSE}).}

\item{confidence.interval}{The confidence interval to be used as a proportion (0 to 1). Default is 0.95 (i.e., 95\%).}
}
\value{
A list summarising the mean, upper and lower confidence interval, and per character proportional character completeness in each time bin.
}
\description{
Given a cladistic matrix, time-scaled tree, and set of time bin boundaries will return the proportional character completeness in each bin.
}
\details{
Character completeness metrics have been used as an additional metric for comparing fossil record quality across time, space, and taxa. However, these only usually refer to point samples of fossils in bins, and not our ability to infer information along the branches of a phylogenetic tree.

This function returns the proportional phylogenetic character completeness for a set of time bins.
}
\examples{

# Create a random tree for the Day et al. 2016 data set:
day_2016tree <- ape::rtree(n = nrow(day_2016$matrix_1$matrix))
day_2016tree$tip.label <- rownames(x = day_2016$matrix_1$matrix)
day_2016tree$root.time <- max(diag(x = ape::vcv(phy = day_2016tree)))

# Get proportional phylogenetic character completeness in ten equal-length
# time bins:
bin_character_completeness(
  cladistic_matrix = day_2016,
  time_tree = day_2016tree, time_bins = seq(
    from =
      day_2016tree$root.time, to = day_2016tree$root.time -
      max(diag(x = ape::vcv(phy = day_2016tree))), length.out = 11
  )
)

# Same, but with a plot:
bin_character_completeness(
  cladistic_matrix = day_2016,
  time_tree = day_2016tree, time_bins = seq(
    from =
      day_2016tree$root.time, to = day_2016tree$root.time -
      max(diag(x = ape::vcv(phy = day_2016tree))), length.out = 11
  ), plot = TRUE
)
}
\author{
Graeme T. Lloyd \email{graemetlloyd@gmail.com}
}
