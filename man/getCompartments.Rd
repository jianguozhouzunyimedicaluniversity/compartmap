% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/getCompartments.R
\name{getCompartments}
\alias{getCompartments}
\title{Estimate A/B compartments}
\usage{
getCompartments(obj, type = c("atac", "array"), res = 1e+06,
  parallel = FALSE, chrs = "chr1", genome = "hg19", targets = NULL,
  run_examples = FALSE, ...)
}
\arguments{
\item{obj}{The object with which to perform compartment inference}

\item{type}{The type of data that obj represents (e.g. atac or array)}

\item{res}{Resolution of compartments in base pairs (default is 1e6)}

\item{parallel}{Should the estimates be done in parallel (default is FALSE)}

\item{chrs}{Chromosomes to operate on (can be individual chromosomes, a list of chromosomes, or all)}

\item{genome}{Genome to use (default is hg19)}

\item{targets}{Specify samples to use as shrinkage targets}

\item{run_examples}{Whether to run ATAC-seq and 450k example analysis}

\item{...}{Other parameters to pass to internal functions}
}
\value{
A p x n matrix (samples as columns and compartments as rows) to pass to embed_compartments
}
\description{
\code{getCompartments} returns estimated A/B compartments from ATAC-seq and methylation array data
}
\details{
This is a wrapper function to perform A/B compartment inference. Compartmentalizer implements a Stein estimator to shrink per-sample compartment estimates towards a global mean. The expected input for this function can be generated using packages like SeSAMe and ATACseeker.
}
\examples{

library(GenomicRanges)
library(SummarizedExperiment)
library(Homo.sapiens)

#ATAC-seq data
data(bulkATAC_raw_filtered_chr14, package = "compartmap")
atac_compartments <- getCompartments(filtered.data.chr14, type = "atac", parallel = FALSE, chrs = "chr14")
\dontrun{
#450k data
data(meth_array_450k_chr14, package = "compartmap")
array_compartments <- getCompartments(array.data.chr14, type = "array", parallel = FALSE, chrs = "chr14")}
}
