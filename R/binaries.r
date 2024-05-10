#' Check if the location for BCFtools is set
#'
#' See set_bcftools() for more information
#' @examples 
#' check_bcftools()
#' @export
#' @return TRUE or FALSE
check_bcftools <- function()
{
	if(is.null(options()[["tools_bcftools"]]))
	{
		message("The path to BCFtools is not set, using native read which may be substantially slower. See 'set_bcftools' for information.")
		return(FALSE)
	}
	filecheck <- file.exists(options()[["tools_bcftools"]])
	if(filecheck)
	{
		return(TRUE)
	}
	pathcheck <- any(sapply(strsplit(Sys.getenv("PATH"), split=":"), function(x) file.exists(file.path(x, options()[["tools_bcftools"]]))))
	if(pathcheck)
	{
		return(TRUE)
	}
	message("The path set to BCFtools does not point to an existing file, using native read which may be substantially slower. See 'set_bcftools' for information.")
	return(FALSE)
}


#' Check if the location for the PLINK is set
#'
#' See set_plink() for more information
#' 
#' @examples
#' check_plink()
#' @export
#' @return TRUE or FALSE
check_plink <- function()
{
	if(is.null(options()[["tools_plink"]]))
	{
		message("The path to PLINK is not set. See 'set_plink' for information.")
		return(FALSE)
	}
	filecheck <- file.exists(options()[["tools_plink"]])
	if(filecheck)
	{
		return(TRUE)
	}
	pathcheck <- any(sapply(strsplit(Sys.getenv("PATH"), split=":"), function(x) file.exists(file.path(x, options()[["tools_plink"]]))))
	if(pathcheck)
	{
		return(TRUE)
	}
	message("The path set to PLINK does not point to an existing file. See 'set_plink' for information.")
	return(FALSE)
}

#' Check if the location for GCTA is set
#'
#' See set_gcta() for more information
#' @examples
#' check_gcta()
#' @export
#' @return TRUE or FALSE
check_gcta <- function()
{
	if(is.null(options()[["tools_gcta"]]))
	{
		message("The path to GCTA is not set. See 'set_gcta' for information.")
		return(FALSE)
	}
	filecheck <- file.exists(options()[["tools_gcta"]])
	if(filecheck)
	{
		return(TRUE)
	}
	pathcheck <- any(sapply(strsplit(Sys.getenv("PATH"), split=":"), function(x) file.exists(file.path(x, options()[["tools_gcta"]]))))
	if(pathcheck)
	{
		return(TRUE)
	}
	message("The path set to GCTA does not point to an existing file. See 'set_gcta' for information.")
	return(FALSE)
}

#' Set BCFtools binary location
#'
#' @param path If "" (default), then will use genetics.binaRies to get binaries that are appropriate for the detected operating system. Otherwise, provide the path to the BCFtools binary. If NULL then will unset the path.
#'
#' @examples
#' # Using the binaries in the genetics.binaRies package.
#' set_bcftools()
#' # Setting the binaries to a local path.
#' \dontrun{
#' set_bcftools('/path/to/bcftools')
#' }
#' # Unset the the path.
#' set_bcftools(NULL)
#' 
#' @export
#' @return NULL or sets the path to the BCFtools binary
set_bcftools <- function(path = "")
{
	if(is.null(path))
	{
		options(tools_bcftools = NULL)
	} else if(path == "")
	{
		message("Path not provided, using binaries in the genetics.binaRies package")
		options(tools_bcftools = get_bcftools_binary())
	
	} else {
		options(tools_bcftools = path)
	}
}

#' Set PLINK binary location
#'
#' @param path If "" (default), then will use genetics.binaRies to get binaries that are appropriate for the detected operating system. Otherwise, provide the path to the PLINK binary. If NULL then will unset the path.
#' 
#' @examples
#' # Using the binaries in the genetics.binaRies package.
#' set_plink() 
#' # Setting the binaries to a local path.
#' \dontrun{
#' set_plink('/path/to/plink') 
#' }
#' # Unset the the path.
#' set_plink(NULL) 
#'
#' @export
#' @return NULL or sets the path to the PLINK binary
set_plink <- function(path = "")
{
	if(is.null(path))
	{
		options(tools_plink = NULL)
	} else if(path == "")
	{
		message("Path not provided, using binaries in the genetics.binaRies package")
			options(tools_plink = get_plink_binary())
	} else {
		options(tools_plink = path)
	}
}

#' Set GCTA binary location
#'
#' @param path If "" (default), then will use genetics.binaRies to get binaries that are appropriate for the detected operating system. Otherwise, provide the path to the GCTA binary. If NULL then will unset the path.
#' 
#' @examples
#' # Using the binaries in the genetics.binaRies package.
#' set_gcta() 
#' # Setting the binaries to a local path.
#' \dontrun{
#' set_gcta('/path/to/gcta')
#' }
#' # Unset the the path.
#' set_gcta(NULL) 
#' 
#' @export
#' @return NULL or sets the path to the GCTA binary
set_gcta <- function(path = "")
{
	if(is.null(path))
	{
		options(tools_gcta = NULL)
	} else if(path == "")
	{
		message("Path not provided, using binaries in the genetics.binaRies package")
			options(tools_gcta = get_gcta_binary())
	} else {
		options(tools_gcta = path)
	}
}
