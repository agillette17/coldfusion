<cfscript>

	try {
		myArray = ArrayNew(1);

		writeDump(myArray);
	} catch (any e) {
		writeOutput("Error :: " & e.type & " :: " & e.message);
	}

	try {
		myArray = ArrayNew(2);

		writeDump(myArray);
	} catch (any e) {
		writeOutput("Error :: " & e.type & " :: " & e.message);
	}

	try {
		myArray = ArrayNew(3);

		writeDump(myArray);
	} catch (any e) {
		writeOutput("Error :: " & e.type & " :: " & e.message);
	}

	try {
		myArray = ArrayNew(4);

		writeDump(myArray);
	} catch (any e) {
		writeOutput("Error :: " & e.type & " :: " & e.message);
	}
	
</cfscript>