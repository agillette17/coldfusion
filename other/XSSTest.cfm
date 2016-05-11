<!--- 

	Test For XSS in cf
	http://localhost/coldfusion/other/?param=%3Cscript%3Ealert%28%27hello%27%29;%3C/script%3E
 --->

<cfoutput>#url.param#</cfoutput>