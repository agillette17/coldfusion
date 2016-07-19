<cfscript>

	try {
		myArray = ["a","b","c"];

		writeDump(arrayContainsNoCase(myArray, "B"));

		writeDump(myArray);
	} catch (any e) {
		writeOutput("Error :: " & e.type & " :: " & e.message);
	}

	try {
		myArray = ["a","b","c"];

		myArray.clear();

		writeDump(arrayContainsNoCase(myArray, "ab"));

		writeDump(myArray);
	} catch (any e) {
		writeOutput("Error :: " & e.type & " :: " & e.message);
	}

	try {
		myArray = ["ab","bc","cd"];

		myArray.clear();

		writeDump(arrayContainsNoCase(myArray, "A"));

		writeDump(myArray);
	} catch (any e) {
		writeOutput("Error :: " & e.type & " :: " & e.message);
	}

</cfscript>