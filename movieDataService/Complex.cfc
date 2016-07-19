<cfcomponent hint="echoes back the input specified">

<!---
The purpose of these functions merely is to demo accepting
and returning a complex object
--->

    <cffunction name="echoStruct" returntype="struct" access="remote">
    <cfargument type="struct" name="argStruct"/>

        <!---
        outputs argument passed to this function to console
        good for debugging while developing the service
        --->
        <cfdump var="#argStruct#" output="console">
        <!--- typically your logic goes here --->
        <cfreturn argStruct>
    </cffunction>

    <cffunction name="echoQuery" returntype="query" access="remote">
    <cfargument type="query" name="argQuery"/>

    <cfreturn argQuery>
    </cffunction>

    <cffunction name="echoDocument" returntype="xml" access="remote">
    <cfargument type="xml" name="argDocument"/>

    <cfreturn argDocument>
    </cffunction>

    <cffunction name="echoAny" returntype="any" access="remote">
    <cfargument type="any" name="argAny"/>

    <cfreturn argAny>
    </cffunction>

    <cffunction name="concatenateString" returntype="any" access="remote">
    <cfargument type="string" name="argAny"/>
    <cfargument type="string" name="argAny2"/>

    <cfreturn argAny & argAny2>
    </cffunction>

</cfcomponent>