% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/drop_time_tip.R
\name{drop_time_tip}
\alias{drop_time_tip}
\title{Drop tips from a time-scaled tree}
\usage{
drop_time_tip(time_tree, tip_names, ...)
}
\arguments{
\item{time_tree}{A time-scaled tree in phylo format where branch lengths are durations and where a \code{$root.time} value indicates the root age.}

\item{tip_names}{A vector of tip names to be pruned from the tree.}

\item{...}{Additional options to be passed to \code{ape::drop.tip}.}
}
\value{
Returns a tree (phylo object) with pruned tips and corrected \code{$root.time}.
}
\description{
Drop tips from a time-scaled tree and update root.time accordingly
}
\details{
(NB: This function is designed to only cope with trees containing at least three tips.)

Usually ape formatted trees are pruned with the \link[ape]{drop.tip} function in \link[ape]{ape}. However, trees time-scaled using either the \code{paleotree} or \code{strap} packages have an additional important component, the root age (\code{$root.time}) that may need updating when tips are removed. (See \link{fix_root_time}.) Thus this function is a modified version of \link[ape]{drop.tip} that also performs the \link{fix_root_time} step.

Note that \code{dropPaleoTip} in the \code{paleotree} package performs the exact same function, but is not called here to reduce the number of dependencies for \code{Claddis}.
}
\examples{

# Create a simple four-taxon tree with branch lengths:
tree <- ape::read.tree(text = "(A:1,(B:1,(C:1,D:1):1):1);")

# Set root age as 20 Ma:
tree$root.time <- 20

# Now prune taxon A:
pruned_tree <- ape::drop.tip(phy = tree, tip = "A")

# Show that drop.tip has not updated the tree's root time:
pruned_tree$root.time

# Use the function to fix the root time:
pruned_tree <- drop_time_tip(time_tree = tree, tip_names = "A")

# Show that the root time is now fixed (19 Ma):
pruned_tree$root.time

}
\seealso{
\link{fix_root_time}
}
\author{
Graeme T. Lloyd \email{graemetlloyd@gmail.com}
}
