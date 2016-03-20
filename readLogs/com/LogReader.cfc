/**
 * LogReader
 * 
 * @author Vipin Malik
 * @date 3/20/16
 **/
component accessors=false output=false persistent=false {

	/**
	 * @hint returns all logs as array for all or specific application and by log type
	 **/
	public array function getAllLogs (String applicationName="", String type="") {
		var allLogsArray = [];
		
		if (CompareNocase(arguemnts.type, "errors") eq 0) {
			allLogsArray = getAllErrors(arguments.applicationName);
		}
		
		return allLogsArray;
	}

	/**
	 * @hint returns all error logs for all or specific application
	 **/
	 private array function getAllErrors (String applicationName="") {
	 	var allErrorsArray = [];
	 	
	 	return allErrorsArray;
	 }

}