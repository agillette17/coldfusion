<cfscript> 
	webService = CreateObject("webservice",  "http://localhost/coldfusion/other/MyTestWebService.cfc?wsdl"); 
	result = webService.getName(); 
	writeoutput(result);
	
	writedump(webService);

</cfscript>