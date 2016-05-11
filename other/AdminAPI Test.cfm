<cfscript>
	// create administrator instance
	cfAdmin = new cfide.adminapi.administrator();
	
	// login to cf administrator
	cfadmin.login(adminUserId = "admin", adminPassword = "mindfire");
	
	// crrate instance of your admin api object
	runtime = new cfide.adminapi.runtime();
	
	// perform operations using admin api
	runtime.setRuntimeProperty(propertyName = "googleMapKey", propertyValue = "AIzaSyBk-ZAzoB7avxUb0mG2HmnEuP3nNgMvDHc");
	
	// check that value is updated
	writedump(runtime.getRuntimeProperty("googleMapKey"));
	
	// logout from cf admistrator
	cfadmin.logout();

	// This will throw access denied exception
	writedump(runtime.getRuntimeProperty("googleMapKey"));
</cfscript>