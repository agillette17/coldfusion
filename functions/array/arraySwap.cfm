<cfscript>

	myArray = [2,2,20,4,1];

	writeDump(myArray);

	writeDump(myArray.swap(2,4));

	writeDump(myArray);

	try {
		myArray = ["2",2,"34",4];

		writeDump(myArray);

		writeDump(arraySwap(myArray, 2, 6));

		writeDump(myArray);
	} catch (any e) {
		writeOutput("Error :: " & e.type & " :: " & e.message);
	}

	try {
		myArray = ["2",2,"34",4];

		myArray.resize(6);

		writeDump(myArray);

		writeDump(arraySwap(myArray, 2, 6));

		writeDump(myArray);
	} catch (any e) {
		writeOutput("Error :: " & e.type & " :: " & e.message);
	}

</cfscript>