<cfscript>

	try {
		myArray = [1,2,3,4];

		writeDump(myArray.contains(2));

		writeDump(myArray);
	} catch (any e) {
		writeOutput("Error :: " & e.type & " :: " & e.message);
	}

	try {
		myArray = [1,2,3,4];

		myArray.clear();

		writeDump(myArray.contains(""));

		writeDump(myArray);
	} catch (any e) {
		writeOutput("Error :: " & e.type & " :: " & e.message);
	}

	try {
		myArray = [1,2,3,4];

		writeDump(arrayContains(myArray, []));

		writeDump(myArray);
	} catch (any e) {
		writeOutput("Error :: " & e.type & " :: " & e.message);
	}

	try {
		myArray = [1,2,3,4,""];

		writeDump(arrayContains(myArray, ""));

		writeDump(myArray);
	} catch (any e) {
		writeOutput("Error :: " & e.type & " :: " & e.message);
	}

	try {
		myArray = ["a","b","c"];

		writeDump(arrayContains(myArray, "B"));

		writeDump(myArray);
	} catch (any e) {
		writeOutput("Error :: " & e.type & " :: " & e.message);
	}

</cfscript>