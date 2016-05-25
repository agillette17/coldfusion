<cfscript>

	try {
		myArray = [1,2,3,4];

		writeDump(myArray.toList());

		writeDump(myArray);
	} catch (any e) {
		writeOutput("Error :: " & e.type & " :: " & e.message);
	}

	try {
		myArray = [1,2,3,4];

		myArray.clear();

		writeDump(myArray.toList());

		writeDump(myArray);
	} catch (any e) {
		writeOutput("Error :: " & e.type & " :: " & e.message);
	}

	
</cfscript>