<cfscript>

	try {
		myArray = {};

		writeDump(isArray(myArray));
	} catch (any e) {
		writeOutput("Error :: " & e.type & " :: " & e.message);
	}

	try {
		myArray = [1,2,3,4];

		writeDump(isArray(myArray));
	} catch (any e) {
		writeOutput("Error :: " & e.type & " :: " & e.message);
	}
	
</cfscript>