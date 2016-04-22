<cfscript>
	/**
	* @validate numeric
	* */
	myStruct = {key1 = "value1", key2 = "value2"};
	
	writedump(getMetadata(myStruct).getAnnotations());

</cfscript>