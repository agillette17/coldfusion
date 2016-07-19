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
		variables.logReaderHelper = new com.LogReaderHelper();
		
		variables.logFilesArray = variables.logReaderHelper.getSortedLogFileList();
		
		variables.logFileContent = [];
		
		variables.filename = "";
		
		variables.severity = [];
		
		if (StructKeyExists(url, "filename") and Len(url.filename)) {
			variables.filename = url.filename;
		}
		
		if (StructKeyExists(form, "filter_fileName") and Len(form.filter_fileName)) {
			variables.filename = form.filter_fileName;
		}
		
		if (StructKeyExists(form, "filter_severity_information")) {
			ArrayAppend(variables.severity, "Information");
		}
		
		if (StructKeyExists(form, "filter_severity_warn")) {
			ArrayAppend(variables.severity, "Warn");
		}
		
		if (StructKeyExists(form, "filter_severity_error")) {
			ArrayAppend(variables.severity, "Error");
		}
		
		if (StructKeyExists(form, "filter_severity_fatal")) {
			ArrayAppend(variables.severity, "Fatal");
		}

		if (Len(variables.filename)) {
			variables.logFileContent = variables.logReaderHelper.getLogContent(logFilePath = variables.filename,
																				severity = variables.severity);
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
			<cfif not ArrayLen(variables.logFileContent)>
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
								<td><a class="openLogFile" href="#APPLICATION.basepath#/?filename=#variables.logFilesArray[logFileIndex].name#">Open</a></td>
							</tr>
						</cfloop>
					</table>
				</div>
			<cfelse>
				<h3>Logs from #variables.filename#</h3>
				<a class="back" href="#APPLICATION.basepath#/">Back</a>
			</cfif>
			<br /><br />
			<cfif ArrayLen(variables.logFileContent)>
				<div id="filterFormContainer">
					<form name="filterForm" action="#APPLICATION.basepath#/" method="post">
						<div class="filterItem">
							<div class="filterItemLabel">
								Log Level :
							</div>
							<div class="filterItemField">
								<span class="filterItemCheckboxSpan">
									<input type="checkbox" name="filter_severity_information" id="filterSeverityInformation" class="filter_checkbox" checked="true">
								</span>
								<span class="filterItemTextSpan">
									Information
								</span>
								<span class="filterItemCheckboxSpan">
									<input type="checkbox" name="filter_severity_warn" id="filterSeverityWarn" class="filter_checkbox" checked="true">
								</span>
								<span class="filterItemTextSpan">
									Warn
								</span>
								<span class="filterItemCheckboxSpan">
									<input type="checkbox" name="filter_severity_error" id="filterSeverityError" class="filter_checkbox" checked="true">
								</span>
								<span class="filterItemTextSpan">
									Error
								</span>
								<span class="filterItemCheckboxSpan">
									<input type="checkbox" name="filter_severity_fatal" id="filterSeverityFatal" class="filter_checkbox" checked="true">
								</span>
								<span class="filterItemTextSpan">
									Fatal
								</span>
							</div>
						</div>
						<div class="filterItem">
							<div class="filterItemField">
								<input type="hidden" name="filter_fileName" id="filterFileName" value="#variables.filename#">
								<input type="submit" name="filter_submit" id="filterSubmit" class="filter_submit" value="Filter">
							</div>
						</div>
					</form>
				</div>
			</cfif>
			<br /><br />
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