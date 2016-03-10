<cfsetting enablecfoutputonly="true">
	<cfsilent>
		<cfscript>
			variables.pathToJavascriptFile = "scriptControlExamle.js";
		</cfscript>
	</cfsilent>
	<cfoutput>
		<!doctype html>

		<html lang="en">
			<head>
				<title>Javascript Custom Tag</title>
			</head>
			<body>
				<h1>Javascript Custom Tag Usage</h1>
				<!--- Render external javascript file in the head section of page --->
				<cf_script src="#variables.pathToJavascriptFile#" outputType="append" />

				<!--- Inline javascript rendered at the end of the body tag --->
				<cf_script outputType="head">
					// js content
					alert("Inline javascript loaded.");
				</cf_script>

				<!-- output the javascript to be rendered at the end of body -->
				<cfif StructKeyExists(request, "htmlFooterScripts")>
					#request.htmlFooterScripts#
				</cfif>

			</body>
		</html>
	</cfoutput>

<cfsetting enablecfoutputonly="false">
