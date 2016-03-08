<cffunction name="getSortedLogFileList" access="public" output="false" returntype="query"
	hint="I return the list of coldfusion log file sorted in order of last modified date">
	<cfscript>
		var rootPath = Server.ColdFusion.RootDir;

		var logFileList = directorylist("#rootPath#\logs", false, "query");

		var sortedLogFiles = new Query(
			sql = "select * from logFileList where name like '%#application.applicationname#%' order by dateLastModified desc",
			dbtype = "query",
			logFileList = logFileList
		);

		return sortedLogFiles.execute().getResult();
	</cfscript>
</cffunction>

<cfset filePath = "#Server.ColdFusion.RootDir#\logs\#getSortedLogFileList().name#">

<cfset fileContent = rereplace(fileread(filePath), "\n", "<br />", "all")>

<cfoutput>#fileContent#</cfoutput>