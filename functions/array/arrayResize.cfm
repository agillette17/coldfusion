<cfscript>

	myArray = [2,2,20,4,1];

	writeDump(myArray);

	writeDump(arrayResize(myArray, 10));

	writeDump(myArray);

	try {
		myArray = ["2",2,"34",4];

		writeDump(myArray);

		writeDump(arrayResize(myArray, 1));

		writeDump(myArray);
	} catch (any e) {
		writeOutput("Error :: " & e.type & " :: " & e.message);
	}

	try {
		myArray = ["2",2,"34",4];

		writeDump(myArray);

		writeDump(arrayResize(myArray, 0));

		writeDump(myArray);
	} catch (any e) {
		writeOutput("Error :: " & e.type & " :: " & e.message);
	}

</cfscript>