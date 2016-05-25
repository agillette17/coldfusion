<cfscript>

	try {
		myArray = [1,2,3,4];

		writeDump(myArray.clear());

		writeDump(myArray);
	} catch (any e) {
		writeOutput("Error :: " & e.type & " :: " & e.message);
	}

	try {
		myArray = [1,2,3,4];

		myArray.resize(10);

		writeDump(myArray.clear());

		writeDump(myArray);
	} catch (any e) {
		writeOutput("Error :: " & e.type & " :: " & e.message);
	}

	try {
		myArray = [];

		myArray.resize(10);

		writeDump(myArray.clear());

		writeDump(myArray);
	} catch (any e) {
		writeOutput("Error :: " & e.type & " :: " & e.message);
	}
	
</cfscript>