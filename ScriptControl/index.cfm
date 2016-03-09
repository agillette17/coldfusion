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
				<div>
<!--- 
					<!-- Render external javascript file at the end of the body tag -->
					<script src="#variables.pathToJavascriptFile# " outputType="append" />

					<!-- Render external javascript file inline -->
					<script src="#variables.pathToJavascriptFile#" outputType="inline" />

					<!-- Render external javascript file in the head section -->
					<script src="#variables.pathToJavascriptFile#" outputType="head" /> --->

					<!-- Render external javascript file in the head section of page -->
					<cf_script src="#variables.pathToJavascriptFile#" />
<!--- 
					<!-- Inline javascript rendered at the end of the body tag -->
					<script outputType="append">
						// js content
					<script> --->

				</div>

				<!-- output the javascript to be rendered at the end of body -->
				<cfif StructKeyExists(request, "htmlFooterScripts")>
					#request.htmlFooterScripts#
				</cfif>

			</body>
		</html>
	</cfoutput>

<cfsetting enablecfoutputonly="false">
