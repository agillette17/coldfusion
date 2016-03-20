/**
 * LogReaderHelper
 * 
 * @author Vipin Malik
 * @date 3/10/16
 **/
component accessors=false output=false persistent=false {
	
	public LogReaderHelper function init () {
		variables.rootPath = Server.ColdFusion.RootDir;

		variables.logDirectoryPath = ReReplace("#variables.rootPath#/logs", "\\", "/", "all");
		
		return this;
	}
	
	/**
	 * @hint I return the list of coldfusion log file sorted in order of last modified date
	 **/
	public array function getSortedLogFileList () {
		var logFileList = DirectoryList(variables.logDirectoryPath, false, "query");

		var sortedLogFiles = new Query(
			sql = "select 
						Cast(DateLastModified AS DATE) lastModifiedDate,  
						Cast(DateLastModified AS TIME) lastModifiedTime, 
						name, 
						size
					from 
						logFileList 
					where
						type = 'File'
					order by dateLastModified desc",
			dbtype = "query",
			logFileList = logFileList
		);

		return queryToArray(sortedLogFiles.execute().getResult());
	}

	public array function getLogContent (required string logFilePath,
											array severity=[]) {
		var logContent = fileRead(variables.logDirectoryPath & "/" & arguments.logFilePath);
		
		var logsAsQuery = logStringToQuery(logContent);
		
		var filterQuery = "select Severity, ThreadID, LogDate, LogTime, Application, Message from logsAsQuery order by LogDateTime desc";

		if (ArrayLen(arguments.severity)) {
			var severityArray = [];

			for (i in arguments.severity) {
				ArrayAppend(severityArray, "'" & i & "'");				
			}

			var filterQuery = "select Severity, ThreadID, LogDate, LogTime, Application, Message from logsAsQuery where severity in (#ArrayToList(severityArray)#) order by LogDateTime desc";
		}
		
		var sortedLogQuery =  new Query(
			sql = filterQuery,
			dbtype = "query",
			logsAsQuery = logsAsQuery
		);
		
		return queryToArray(sortedLogQuery.execute().getResult());
	}
	
	
	/**
	 * @hint I convert query to array
	 **/
	 private array function queryToArray (Query inputQuery) {
	 	var resultantArray = [];

	 	if (arguments.inputQuery.RecordCount) {
	 		var queryRow = {};
	 		
	 		for (queryRowIndex in arguments.inputQuery) {
		 		ArrayAppend(resultantArray, queryRowIndex);
		 	}	
	 	}

	 	
	 	return resultantArray;
	 }
	 
	 /**
	  * @hint I convert log file content into JSON format
	  **/
	 private query function logStringToQuery (String logFileContent) {
		arguments.logFileContent = ReReplace(arguments.logFileContent, "\n", ";", "all");
		
		var logContentItems = ListToArray(arguments.logFileContent, ";");
		
		var logQry = QueryNew("Severity, ThreadID, LogDate, LogTime, Application, Message, logDateTime");

		for (logItem in logContentItems) {
			logItemArray = ListToArray(ReReplace(logItem, """", "", "all"));

			if (not Arrayfindnocase(logItemArray, "Severity") and ArrayLen(logItemArray) eq 6) {
				QueryAddRow(logQry);

				QuerySetCell(logQry, "Severity", logItemArray[1]);
				QuerySetCell(logQry, "ThreadID", logItemArray[2]);
				QuerySetCell(logQry, "LogDate", logItemArray[3]);
				QuerySetCell(logQry, "LogTime", logItemArray[4]);
				QuerySetCell(logQry, "Application", logItemArray[5]);
				QuerySetCell(logQry, "Message", logItemArray[6]);
				QuerySetCell(logQry, "logDateTime", logItemArray[3] & " " & logItemArray[4]);
			}
		}

		return logQry;
	}

}