# Prefix of URL where binaries currently are on Gib's GitHub
# urlprefix1 <- paste0("https://github.com/explodecomputer/",
#                      "genetics.binaRies/blob/",
#                      "383764855a4346442a054388c35dfe5ad580bfc8/inst/bin/")
# Prefix of URL where binaries will be
urlprefix2 <- paste0("https://github.com/remlapmot/genetics.binaRies/",
                     "raw/cran-fixes-01-2022/binaries/")
urlprefix1 <- paste0("https://github.com/explodecomputer/genetics.binaRies/",
                     "raw/master/binaries/")
urlprefix3 <- paste0("https://github.com/remlapmot/genetics.binaRies/",
                     "raw/master/binaries/")
urlprefix <- list(urlprefix1, urlprefix2, urlprefix3)

# function to test for a try error
is.error <- function(x) inherits(x, "try-error")

#' @importFrom utils download.file
downloader <- function(exename) {
  os <- Sys.info()[["sysname"]]
  dest <- file.path(system.file(package = "genetics.binaRies"), "bin")
  # Create bin folder in package and download specified executable into it -
  # looping over the 4 possible URLs
  if (!dir.exists(dest)) dir.create(dest)
  destfile <- file.path(dest, exename)
  if (!file.exists(destfile)) {
    download_success <- FALSE
    i <- 1L
    while (isFALSE(download_success)) {
      cat("\n")
      if (i > length(urlprefix)) {
        stop(exename, " not found at all ", length(urlprefix), " URLs.")
      }
      fullurl <- paste0(urlprefix[[i]], os, "/", exename)
      err <- try(download.file(url = fullurl, destfile = destfile))
      if (!is.error(err)) download_success <- TRUE
      i <- i + 1L
    }
  }
  destfile
}

#' Find binary for bcftools
#'
#' @examples
#' if (Sys.info()[["sysname"]] != "Windows") get_bcftools_binary()
#' @export
#' @return Path to bcftools
get_bcftools_binary <- function()
{
    switch(Sys.info()[['sysname']],
        Windows = {
          stop("Sorry, bcftools binary is not available for Windows at the moment.",
          " Use the other native functions for querying, ",
          "or for faster speeds use this package on Mac or Linux")},
        Linux = {
          downloader("bcftools")
        },
        Darwin = {
          downloader("bcftools")
        })
}


#' Find binary for plink
#'
#' @examples
#' get_plink_binary()
#' @export
#' @return Path to plink
get_plink_binary <- function()
{
    switch(Sys.info()[['sysname']],
        Windows = {
          downloader("plink.exe")
        },
        Linux = {
          downloader("plink")
        },
        Darwin = {
          downloader("plink")
        })
}


#' Find binary for gcta
#'
#' @examples
#' get_gcta_binary()
#' @export
#' @return path to gcta
get_gcta_binary <- function()
{
    switch(Sys.info()[['sysname']],
        Windows = {
          downloader("gcta.exe")
        },
        Linux = {
          downloader("gcta")
        },
        Darwin = {
          downloader("gcta")
        })
}
