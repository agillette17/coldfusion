<cfscript> 
	webService = CreateObject("webservice",  "http://localhost:8080/ws/countries.wsdl"); 
	result = webService.getCountry("Spain"); 
	
	writedump(result.getCapital());
	
	writedump(webService);

</cfscript>