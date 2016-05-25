<cfscript>

	myArray = [1,2,3,4];

	writeDump(myArray);

	writeDump(arraySum(myArray));

	try {
		myArray = ["1",2,"3",4];

		writeDump(myArray);

		writeDump(arraySum(myArray));
	} catch (any e) {
		writeOutput("Error :: " & e.type & " :: " & e.message);
	}

	try {
		myArray = ["a",2,"cd",4];

		writeDump(myArray);

		writeDump(arraySum(myArray));
	} catch (any e) {
		writeOutput("Error :: " & e.type & " :: " & e.message);
	}
	
</cfscript>