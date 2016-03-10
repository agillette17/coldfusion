<!---
	File Name 	: 	index.cfm
	Description :	main landing page for readLogs tool
	Created By	:	Vipin Malik
	Created	date:	10th march 2016
	Edited Date :
 --->

<cfsetting enablecfoutputonly="true">

<cfsilent>
	<cfscript>
		variables.logReaderHelper = new model.LogReaderHelper();
		
		variables.logFilesArray = variables.logReaderHelper.getSortedLogFileList();
		
		variables.logFileContent = [];
		
		if (StructKeyExists(url, "filename") and Len(url.filename)) {
			variables.logFileContent = variables.logReaderHelper.getLogContent(url.filename);
		}
	</cfscript>
</cfsilent>

<cfoutput>
	<!doctype html>

	<html lang="en">
		<head>
			<title>Logs</title>
		</head>
		<body>
			<h1>Logs</h1>
			<div id="filelistContainer">
				<table border="1" cellpadding="3" cellspacing="1">
					<tr>
						<th>Id</th>
						<th>Log File Name</th>
						<th>Last Modified Date</th>
						<th>File Size</th>
						<th>Action</th>
					</tr>
					<cfloop from="1" to="#ArrayLen(variables.logFilesArray)#" index="logFileIndex">
						<tr>
							<td>#logFileIndex#</td>
							<td>#variables.logFilesArray[logFileIndex].name#</td>
							<td>#variables.logFilesArray[logFileIndex].lastModifiedDate# #variables.logFilesArray[logFileIndex].lastModifiedTime#</td>
							<td>#variables.logFilesArray[logFileIndex].size#</td>
							<td><a class="openLogFile" href="#APPLICATION.basepath#/ReadLogs/?filename=#variables.logFilesArray[logFileIndex].name#">Open</a></td>
						</tr>
					</cfloop>
				</table>
			</div>
			<br /><br /><br />
			<cfif ArrayLen(variables.logFileContent)>
				<div id="fileContainer">
					<table border="1" cellpadding="3" cellspacing="1">
						<tr>
							<th>Id</th>
							<th>Severity</th>
							<th>Date</th>
							<th>Application</th>
							<th>Message</th>
						</tr>
						<cfloop from="1" to="#ArrayLen(variables.logFileContent)#" index="logIndex">
							<tr>
								<td>#logIndex#</td>
								<td>#variables.logFileContent[logIndex]["severity"]#</td>
								<td>#variables.logFileContent[logIndex]["logDate"]# #variables.logFileContent[logIndex]["logTime"]#</td>
								<td>#variables.logFileContent[logIndex]["application"]#</td>
								<td>#variables.logFileContent[logIndex]["message"]#</td>
							</tr>
						</cfloop>
					</table>
				</div>
			</cfif>
		</body>
	</html>
</cfoutput>

<cfsetting enablecfoutputonly="false">