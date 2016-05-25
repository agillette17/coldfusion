<cfscript>

	myArray = [1,2,3,4,5];

	writeDump(myArray);

	writeDump(arrayInsertAt(myArray, 4, 6));

	writeDump(myArray);

	try {
		myArray = ["2",2,"34",4];

		myArray.resize(7);

		writeDump(myArray);

		writeDump(arrayInsertAt(myArray, 6, 7));

		writeDump(myArray);
	} catch (any e) {
		writeOutput("Error :: " & e.type & " :: " & e.message);
	}

	try {
		myArray = ["2",2,"34",4];

		writeDump(myArray);

		writeDump(arrayInsertAt(myArray, 6, 7));

		writeDump(myArray);
	} catch (any e) {
		writeOutput("Error :: " & e.type & " :: " & e.message);
	}

</cfscript>