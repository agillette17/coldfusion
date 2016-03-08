<!---
	Description :
	This file implements the custom tag for rendering javascript.
	It provides ability to render javascript inline, in head or at the end of body.
	It also checks if the external javascript file is already included on the page.

	Parameters :
	String outputType :: values("head", "append", "inline")
	String src :: valuse(path to the javascript file)

	Usage :
	An example with usage is given below ::

	<cfsetting enablecfoutputonly="true">

	<cfimport prefix="tags" taglib="pathToCustomTags">

	<cfoutput>
		<!doctype html>

		<html lang="en">
			<head>
				<title>Test :: Home</title>
			</head>
			<body>

				<div>

					<!-- Render external javascript file at the end of the body tag -->
					<tags:jscript src="pathToJavascriptFile " outputType="append" />

					<!-- Render external javascript file inline -->
					<tags:jscript src="pathToJavascriptFile" outputType="inline" />

					<!-- Render external javascript file in the head section -->
					<tags:jscript src="pathToJavascriptFile" outputType="head" />

					<!-- Render external javascript file in the head section of page -->
					<tags:jscript src="pathToJavascriptFile" />

					<!-- Inline javascript rendered at the end of the body tag -->
					<tags:jscript outputType="append">
						// js content
					</tags:jscript>

				</div>

				<!-- output the javascript to be rendered at the end of body -->
				<cfif structKeyExists(request, "pageScripts")>
					#request.pageScripts#
				</cfif>

			</body>
		</html>
	</cfoutput>

	<cfsetting enablecfoutputonly="false">
 --->

<cfsetting enablecfoutputonly="true">

<cfif  thisTag.executionMode is "start">

	<cfparam name="outputType" type="string" default="head">

	<cfparam name="src" type="string" default="">

	<cfif not structKeyExists(attributes, "outputType")>

		<cfset attributes.outputType = "head">

	</cfif>

<cfelse>
	<cfset variables.content = Trim(thisTag.GeneratedContent) />

	<cfset thisTag.GeneratedContent = "" />

	<cfif structKeyExists(attributes, "src")>

		<cfset variables.result = '<script type="text/javascript" src="#attributes.src#"></script>' />

	</cfif>

	<cfif len(variables.content)>

		<cfset variables.bodyContent = Chr(13) & '//<![CDATA[' & Chr(13) & variables.content & Chr(13) & '//]]>' & Chr(13)>

		<cfset variables.result = '<script type="text/javascript">#variables.bodyContent#</script>' />

	</cfif>

	<cfif attributes.outputType eq "append">

		<cfif not structKeyExists(request, "pageScripts") >

			<cfset request.pageScripts = "" />

		</cfif>

		<cfset request.pageScripts = request.pageScripts & variables.result />

	<cfelseif  attributes.outputType eq "inline">

		<cfset thisTag.GeneratedContent = variables.result />

	<cfelse>

		<cfhtmlhead text = #variables.result#>

	</cfif>

</cfif>

<cfsetting enablecfoutputonly="false">