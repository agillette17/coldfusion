<cfscript>

	try {
		function helloTranslator(string a) 
		    { 
		    	
		    	writeDump(arguments);
		    } 

		helloTranslator("hi");
	} catch (any e) {
		writeOutput("Error :: " & e.type & " :: " & e.message);
	}

</cfscript>