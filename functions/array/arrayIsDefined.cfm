<cfscript>

	myArray = [[11,12,13],[21,22,23],[31,32,33]];

	writeDump(myArray.isDefined(1));

	myArray = [1,2,3,4,5,6];

	writeDump(myArray.isDefined(7));

	myArray.resize(10);

	writeDump(myArray.isDefined(7));

	myArray.resize(4);

	writeDump(myArray.isDefined(7));

	writeDump(myArray.isDefined(4));
	
</cfscript>