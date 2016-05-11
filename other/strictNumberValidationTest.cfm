<!--- 
	Use the this.strictNumberValidation = true; switch in Application.cfc
	to see the results for cf11+ and for old versions
 --->
<cfscript>
	any function testNumeric (numeric num) {
		return arguments.num;
	}
	
	for (value in ["1,000","$1,000","$,1,2,$,2352345,$","0,6","1,2,3,4"]){
		
		writeoutput("IsValid() Numeric (#value#) : " & isValid("numeric", value));
		
		writeoutput("<br />");
		
		writeoutput("IsValid() Integer (#value#) : " & isValid("integer", value));
		
		writeoutput("<br />");
		
		try {
			writeoutput("Numeric argument (#value#) : " & testNumeric(value));
			writeoutput("<br />");
		} catch (any e) {
			writeoutput("Numeric argument (#value#) Fail : " & e.message);
			writeoutput("<br />");
		}
		
		writeoutput("<br /><br />");
	}
</cfscript>