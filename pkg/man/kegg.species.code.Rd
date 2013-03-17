\name{kegg.species.code}
\alias{kegg.species.code}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
  Mapping species name to KEGG code
}
\description{
  This function maps species name to KEGG code.
}
\usage{
kegg.species.code(species = "hsa", na.rm = FALSE)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{species}{
character, either the KEGG code, scientific name or the common name of
the target species. Default species="hsa", it is equivalent to use either
"Homo sapiens" (scientific name) or "human" (common name). 
}
  \item{na.rm}{
logical, should unmapped entris be removed. Default na.rm = FALSE.
}
}
\value{
  a character vector of mapped KEGG code of species.
}
\references{
  Luo, W. et al. Pathview: a pathway based data integration and visualization
  tool. submitted, 2013.
}
\author{
  Weijun Luo <luo_weijun@yahoo.com>
}
\seealso{
  \code{\link{korg}} the species and KEGG code mapping data,
  \code{\link{cpd2kegg}} etc the auxillary compound ID mappers,
  \code{\link{download.kegg}} the downloader function.
}
\examples{
species=c("ptr", "Mus musculus", "dog", "happ")
kcode=kegg.species.code(species = species, na.rm = FALSE)
print(kcode)
}
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line