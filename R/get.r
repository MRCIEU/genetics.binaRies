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
		Linux = { system.file("bin", "bcftools_linux", package="genetics.binaRies") },
		Darwin = { system.file("bin", "bcftools_darwin", 
		                       package="genetics.binaRies") })
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
		Windows = { system.file("bin", "plink.exe", package="genetics.binaRies") },
		Linux = { system.file("bin", "plink_Linux", package="genetics.binaRies") },
		Darwin = { system.file("bin", "plink_Darwin", package="genetics.binaRies") })
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
		Windows = { system.file("bin", "gcta.exe", package="genetics.binaRies") },
		Linux = { system.file("bin", "gcta_Linux", package="genetics.binaRies") },
		Darwin = { system.file("bin", "gcta_Darwin", package="genetics.binaRies") })
}
