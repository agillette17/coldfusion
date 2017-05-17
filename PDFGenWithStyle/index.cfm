<!--- <cfdocument filename="output.pdf" src="freeformatter-out.html" format="PDF"></cfdocument> --->

<cftry>
<cfhtmltopdf source="https://dev6.creditntell.com/companyreport/autoreport.cfm?preview=1" destination="output.pdf" overwrite="true"/>

<cfcatch>
	<cfdump var="#cfcatch#"><cfabort>

</cfcatch>

</cftry>