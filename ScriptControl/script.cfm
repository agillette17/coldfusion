<!---
	File Name 	: 	script.cfm
	Description :	This file implements the custom tag for rendering javascript.
					It provides ability to render javascript inline, in head or at the end of body.
					It also checks if the external javascript file is already included on the page.
	Created By	:	Vipin Malik
	Created	date:	9th march 2016
	Edited Date :
	Parameters :	String outputType :: values("head", "append", "inline")
					String src :: values(path to the javascript file)
 --->

<cfsetting enablecfoutputonly="true">

<cffunction name="writeToHTMLHead" access="public" output="false" returntype="void" 
			hint="function to emulate cfhtmlhead behaviour for use within the cfscript">
	<cfargument name="content" required="true" type="string">
	
	<cfhtmlhead text="#arguments.content#">

</cffunction>

<!--- Custom tag parameters --->
<cfparam name="attributes.outputType" type="string" default="head">
<cfparam name="attributes.src" type="string" default="">

<cfscript>
	if (not (thisTag.executionMode is "start")) {

		variables.content = Trim(thisTag.GeneratedContent);

		thisTag.GeneratedContent = "";
		
		// check if added_javascript exists, if not then initialize
		if (not StructKeyExists(request, "added_javascripts")) {
			request.added_javascripts = {};
		}

		// create script tag when src is given and file is not already included on page
		if (Len(attributes.src) 
				and not StructKeyExists(request.added_javascripts, attributes.src)) {
	
			variables.result = '<script type="text/javascript" src="#attributes.src#"></script>';
			
			request.added_javascripts[attributes.src] = true;
	
		}

		// process inline javascript
		if (len(variables.content)) {
	
			variables.bodyContent = Chr(13) & '//<![CDATA[' & Chr(13) & variables.content & Chr(13) & '//]]>' & Chr(13);
	
			variables.result = '<script type="text/javascript">#variables.bodyContent#</script>';
	
		}

		// block to output the script content
		if (attributes.outputType eq "append") {
	
			if (not structKeyExists(request, "htmlFooterScripts")) {
	
				request.htmlFooterScripts = "";
	
			}
	
			request.htmlFooterScripts = request.htmlFooterScripts & variables.result;
	
		} else if (attributes.outputType eq "inline") {
	
			thisTag.GeneratedContent = variables.result;
	
		} else {
			
			writeToHTMLHead(variables.result);
			
		}
	
	}
</cfscript>

<cfsetting enablecfoutputonly="false">