<!---
	File Name 	: 	logView.cfm
	Description :	log view page
	Created By	:	Vipin Malik
	Created	date:	20th march 2016
	Edited Date :
 --->

<cfsetting enablecfoutputonly="true">

<cfsilent>
	<cfscript>
	</cfscript>
</cfsilent>

<cfoutput>
	<!doctype html>
	<html lang="en">
		<head>
			<title>View Logs</title>
			<link type="text/css" href="#application.basepath#/assets/css/log-main.css" rel="stylesheet" media="screen">
		</head>
		<body>
			<div id="container" class="container">
				<div class="header">
					<div class="appname">Cf Log</div>
					<div class="pageInfo">
						<div class="pageName">View Logs</div>
					</div>
					<div class="lineSeparator"></div>
				</div>
				<div id="content" class="content">
					<div class="conciseViewContainer">
						<div class="logItem">
							<div class="type">
								<span class="icon error">E</span>
							</div>
							<div class="logAppName">
								vipinmalik_logReader
							</div>
							<div class="lineSeparator"></div>
							<div class="message">
								Exception Occurred.Could not find the ColdFusion component or interface model.LogReaderHelper.
							</div>
						</div>
					</div>
					<div class="extendedLogView">
					</div>
				</div>
				<div class="footer">
				</div>
			</div>
		</body>
	</html>
</cfoutput>>

<cfsetting enablecfoutputonly="false">