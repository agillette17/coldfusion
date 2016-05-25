<cfscript>

	myArray = [2,2,20,4,1];

	writeDump(myArray);

	writeDump(arraySet(myArray, 5, 7, 10));

	writeDump(myArray);

	try {
		myArray = ["2",2,"34",4];

		writeDump(myArray);

		writeDump(arraySet(myArray, 1, 7, 10));

		writeDump(myArray);
	} catch (any e) {
		writeOutput("Error :: " & e.type & " :: " & e.message);
	}

	try {
		myArray = ["2",2,"34",4];

		writeDump(myArray);

		writeDump(arraySet(myArray, 0, 7, 10));

		writeDump(myArray);
	} catch (any e) {
		writeOutput("Error :: " & e.type & " :: " & e.message);
	}

</cfscript>