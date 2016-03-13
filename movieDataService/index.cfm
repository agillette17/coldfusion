<cfset movie1 = new movie(title="The Revenant", yearOfRelease="2015", actors=["Leonardo DeCaprio", "Tom Hardy"])>

<cfset movie2 = new movie(title="There Will Be Blood", yearOfRelease="2007", actors=["Danielle DeLewis"])>

<cfdump var="#movie1.areEqual(movie2)#">

