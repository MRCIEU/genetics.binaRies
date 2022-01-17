# Create bin folder in package and download specified executable into it
#' @importFrom utils download.file
downloader <- function(url, exename) {
  dest <- file.path(system.file(package = "genetics.binaRies"), "bin")
  if (!dir.exists(dest)) dir.create(dest)
  destfile <- file.path(dest, exename)
  if (!file.exists(destfile)) download.file(url = url, destfile = destfile)
  destfile
}

# Prefix of URL where binaries are on Gib's GitHub
blobprefix <- paste0("https://github.com/explodecomputer/",
                     "genetics.binaRies/blob/",
                     "383764855a4346442a054388c35dfe5ad580bfc8/inst/bin/")
# https://github.com/explodecomputer/genetics.binaRies/blob/master/binaries/

#' Find binary for bcftools
#'
#' @examples 
#' get_bcftools_binary()
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
		  url <- paste0(blobprefix, "bcftools_linux")
		  downloader(url, "bcftools_linux")
		},
		Darwin = { 
		  url <- paste0(blobprefix, "bcftools_darwin")
		  downloader(url, "bcftools_darwin")
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
		  url <- paste0(blobprefix, "plink.exe")
		  downloader(url, "plink.exe")
		},
		Linux = {
		  url <- paste0(blobprefix, "plink_Linux")
		  downloader(url, "plink_Linux")		  
		},
		Darwin = {
		  url <- paste0(blobprefix, "plink_Darwin")
		  downloader(url, "plink_Darwin")
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
		  url <- paste0(blobprefix, "gcta.exe")
		  downloader(url, "gcta.exe")
		},
		Linux = { 
		  url <- paste0(blobprefix, "gcta_Linux")
		  downloader(url, "gcta_Linux")
		},
		Darwin = { 
		  url <- paste0(blobprefix, "gcta_Darwin")
		  downloader(url, "gcta_Darwin")
		})
}
