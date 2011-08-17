<cfcomponent displayname="User Gateway" output="no">

	<cffunction name="init" access="public" output="false" returntype="userGateway">
		<cfargument name="objectAlias" type="string" required="yes">
		<cfargument name="datasource" type="any" required="yes">

		<cfset variables.objectAlias = arguments.objectAlias>

		<cfreturn this>
	</cffunction>

</cfcomponent>