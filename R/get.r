#' Find binary for bcftools
#'
#' @export
#' @return Path to bcftools
get_bcftools_binary <- function()
{
	switch(Sys.info()[['sysname']],
		Windows = { stop("Sorry, bcftools binary is not available for Windows at the moment. Use the other native functions for querying, or for faster speeds use this package on Mac or Linux")},
		Linux = { system.file("bin", "bcftools_Linux", package="genetics.binaRies") },
		Darwin = { system.file("bin", "bcftools_Darwin", package="genetics.binaRies") })
}

#' Find binary for plink
#'
#' @export
#' @return Path to plink
get_plink_binary <- function()
{
	switch(Sys.info()[['sysname']],
		Windows = { system.file("bin", "plink.exe", package="genetics.binaRies") },
		Linux = { system.file("bin", "plink_Linux", package="genetics.binaRies") },
		Darwin = { system.file("bin", "plink_Darwin", package="genetics.binaRies") })
}
