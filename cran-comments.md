### Test environments (tested on 21.06.2022)
* local macOS install, R 4.2.0
* macOS 11.5.2 |Mac mini|Apple M1 (on macOS builder ), R devel 4.2.0
* Ubuntu Linux 20.04.1 LTS (on R-hub), R-release
* Fedora Linux (on R-hub) R-devel
* Windows (on R-hub and winbuilder) R devel and release


### R CMD CHECK
There were no ERRORs or WARNINGs.

##### There is 1 NOTE common to both Linux and Windows environments:

* Possibly misspelled words in DESCRIPTION

All the words are acronyms to institutions or programs names. 
  
##### There is one NOTE that is only found on Windows (Server 2022, R-devel 64-bit), when using rhub:

* checking for detritus in the temp directory ... NOTE

Found the following files/directories:
  'lastMiKTeXException'
  
As noted in R-hub issue #503, this could be due to a bug/crash in MiKTeX and can likely be ignored.


     
