<cfcomponent displayname="DumpArguments" hint="Dumps all arguments upon initilization" output="no">

	<cffunction name="init" access="public" output="false" returntype="dumpArguments">
		<cfdump var="#arguments#">
		<cfabort>

		<cfreturn this>
	</cffunction>

</cfcomponent>