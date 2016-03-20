<cfhttp method="get" result="result" url="http://vipinmalik.com/rest/restService/movieDataService/1.json">
	<cfhttpparam type="header" name="Accept" value="application/json">
</cfhttp>

<cfdump var="#result#">
