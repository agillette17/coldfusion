<cfif StructKeyExists(server, "executionTime")>
	<cfoutput>
		Total Execution Time = #server.executionTime#
		<br />
		Total Execution Count = #server.executionCount#
		<br />
		Average Execution Time = #server.avgTime#
		<br />
	</cfoutput>
<cfelse>
	Nothing to display
</cfif>

<cfif StructKeyExists(url,"delete")>
	<cfset StructDelete(server, "executionTime")>
	<cfset StructDelete(server, "executionCount")>
	<cfset StructDelete(server, "avgTime")>
</cfif>

<!--- 
<cffunction name="onRequestEnd">
	<cfif cgi.PATH_INFO eq "/private.common.mergeSelectedFiles/">
		<cfset var request.end = getTickCount()>

		<cflock scope="Server" type="exclusive" timeout="30">
			<cfif not StructKeyExists(server, "executionTime")>
				<cfset Server.executionTime = 0>
				<cfset Server.executionCount = 0>
			</cfif>
			
			<cfset Server.executionTime = Server.executionTime + request.end - request.start>
			<cfset Server.executionCount++>
			<cfset Server.avgTime = Server.executionTime/Server.executionCount>
		</cflock> 
	</cfif>
</cffunction>
--->