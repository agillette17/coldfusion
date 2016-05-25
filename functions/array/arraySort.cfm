<cfscript>

	myArray = [2,2,20,4,1];

	writeDump(myArray);

	writeDump(myArray.sort("numeric", "ASC"));

	writeDump(myArray);

	try {
		myArray = ["2",2,"34",4];

		writeDump(myArray);

		writeDump(arraySort(myArray, "numeric", "DESC"));

		writeDump(myArray);
	} catch (any e) {
		writeOutput("Error :: " & e.type & " :: " & e.message);
	}

	try {
		myArray = ["a",2,"cd",4,"za"];

		writeDump(myArray);

		writeDump(arraySort(myArray, "numeric", "ASC"));

		writeDump(myArray);
	} catch (any e) {
		writeOutput("Error :: " & e.type & " :: " & e.message);
	}

	try {
		myArray = ["a",2,"cd",4,"za", "AS"];

		writeDump(myArray);

		writeDump(arraySort(myArray, "text", "ASC"));

		writeDump(myArray);
	} catch (any e) {
		writeOutput("Error :: " & e.type & " :: " & e.message);
	}

	try {
		myArray = ["a",2,"cd",4,"za", "AS"];

		writeDump(myArray);

		writeDump(arraySort(myArray, "textNoCase", "ASC"));

		writeDump(myArray);
	} catch (any e) {
		writeOutput("Error :: " & e.type & " :: " & e.message);
	}

	try {
		public boolean function mySortFunc (struct a, struct b) {
			return compareNoCase(Asc(a.name), Asc(b.name));
		}

		myArray = [{"name" = "Vipin"}, {"name" = "Abhinav"}, {"name" = "Ashish"}, {"name" = "Tanul"}];

		writeDump(myArray);

		writeDump(arraySort(myArray, mySortFunc));

		writeDump(myArray);
	} catch (any e) {
		writeOutput("Error :: " & e.type & " :: " & e.message);
	}

</cfscript>