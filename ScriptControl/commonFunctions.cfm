<cffunction name="writeToHTMLHead" access="public" output="false" returntype="void" hint="">
	<cfargument name="content" required="true" type="string">
	
	<cfhtmlhead text="#arguments.content#">

</cffunction>