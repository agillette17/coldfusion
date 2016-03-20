/**
 * Log
 * 
 * @author Vipin Malik
 * @date 3/11/16
 **/
component accessors=true output=false persistent=false {
	property string severity;
	
	property string threadID;
	
	property date logDate;
	
	property time logTime;
	
	property date logDateTime;
	
	property string applicationName;
	
	property string message;
	
	/**
	 * @hint I initialize log
	 **/
	public LogFile function init (required string severity,
									required string threadID,
									required date logDate, 
									required time logTime,
									required string applicationName,
									required string message) {
		setSeverity(arguments.severity);
		setThreadID(arguments.threadID);
		setLogDate(arguments.logDate);
		setLogTime(arguments.logTime);
		setlogDateTime();
		setApplicationName(arguments.applicationName);
		setMessage(arguments.message);

		return this;
	}
	
	/**
	 * @hint I set logDateTime property
	 **/
	public void function setLogDateTime () {
		this.logDateTime = this.logDate & " " & this.logTime;
	}
}