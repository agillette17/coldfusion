<cfscript>

	myArray = [[11,12,13],[21,22,23],[31,32,33]];

	writeDump(myArray.len());

	myArray = [1,2,3,4,5,6];

	writeDump(myArray.len());

	myArray.resize(10);

	writeDump(myArray.len());

	myArray.resize(7);

	writeDump(myArray.len());
	
</cfscript>