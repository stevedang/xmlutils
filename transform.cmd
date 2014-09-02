@ECHO OFF

set args=0
for %%i in (%*) do set /A args+=1

if %args% LSS 3 (
 echo Missing arguments
 echo [USAGE]	: %~1 option inputfile outputfile args 
 echo option	: flat, search, sort, indent 
 echo transform.cmd flat input-file output-file
 echo transform.cmd search input-file output-file "my string"
 echo transform.cmd sort input-file output-file
 echo transform.cmd idnent input-file output-file
 GOTO :EOF
)
  
SET OPTION=%1

if "%OPTION%" == "flat" (
java -cp lib/saxon9he.jar net.sf.saxon.Transform -s:%2 -xsl:stylesheet/flat.xsl -o:%3
)
if "%OPTION%" == "search" (
java -cp lib/saxon9he.jar net.sf.saxon.Transform -s:%2 -xsl:stylesheet/search.xsl -o:%3 myparam=%4
)
if "%OPTION%" == "sort" (
java -cp lib/saxon9he.jar net.sf.saxon.Transform -s:%2 -xsl:stylesheet/sort.xsl -o:%3
)

if "%OPTION%" == "indent" (
java -cp lib/saxon9he.jar net.sf.saxon.Transform -s:%2 -xsl:stylesheet/indent.xsl -o:%3
)

:EOF
