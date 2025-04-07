# Prefix of URL where executables are available from
# i.e. - once PR accepted they'll be on Gib's master branch,
# - until PR accepted they are on PR branch of my fork
# - include my fork master branch as a fall back
urlprefix0 <- paste0("https://github.com/MRCIEU/genetics.binaRies/",
                     "raw/master/binaries/")
urlprefix1 <- paste0("https://github.com/explodecomputer/genetics.binaRies/",
                     "raw/master/binaries/")
urlprefix2 <- paste0("https://github.com/remlapmot/genetics.binaRies/",
                     "raw/master/binaries/")
urlprefix <- list(urlprefix0, urlprefix1, urlprefix2)

# Function to test for a try() error
# from http://adv-r.had.co.nz/Exceptions-Debugging.html
is.error <- function(x) inherits(x, "try-error")

# Function to check for and download executables
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
      err <- try(utils::download.file(url = fullurl, destfile = destfile, mode = "wb"))
      if (!is.error(err)) download_success <- TRUE
      i <- i + 1L
    }
  }
  Sys.chmod(destfile, "755")
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
          stop("Sorry, bcftools binary is not available for Windows",
          " at the moment.",
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
