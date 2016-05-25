/**
 * Logger
 * @description Provides functionality related to logging activity
 * @author Vipin Malik
 * @date 3/8/16
 **/
component accessors=true output=false persistent=false {
	function init (String logFileName) {
		variables.defaultLogFileName = arguments.logFileName;

		return this;
	}

	function logMessage (String message, String type) {
		writeLog(text = arguments.message, 
					type = arguments.type, 
					file = variables.defaultLogFileName,
					application = true);
	}
}