<cfscript>

	myArray = [1,2,3];

	writeDump(myArray);

	writeDump(ArrayDeleteAt(myArray, 1));

	writeDump(myArray);

	try {
		writeDump(ArrayDeleteAt(myArray, 5));
	} catch (any e) {
		writeOutput("Error :: " & e.type & " :: " & e.message);
	}

	writeDump(myArray);

	arrayResize(myArray, 5);

	try {
		writeDump(ArrayDeleteAt(myArray, 4));
	} catch (any e) {
		writeOutput("Error :: " & e.type & " :: " & e.message);
	}

	writeDump(myArray);

</cfscript>