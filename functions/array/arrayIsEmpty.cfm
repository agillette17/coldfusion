<cfscript>

	try {
		myArray = [1,2,3,4];

		writeDump(myArray.isEmpty());

		writeDump(myArray);
	} catch (any e) {
		writeOutput("Error :: " & e.type & " :: " & e.message);
	}

	try {
		myArray = [1,2,3,4];

		myArray.clear();

		writeDump(myArray.isEmpty());

		writeDump(myArray);
	} catch (any e) {
		writeOutput("Error :: " & e.type & " :: " & e.message);
	}

	try {
		myArray = [];

		myArray.resize(10);

		writeDump(myArray.isEmpty());

		writeDump(myArray);
	} catch (any e) {
		writeOutput("Error :: " & e.type & " :: " & e.message);
	}
	
</cfscript>