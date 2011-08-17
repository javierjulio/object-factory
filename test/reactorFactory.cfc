<cfcomponent displayname="Reactor Factory" output="no">

	<cffunction name="init" access="public" output="false" returntype="reactorFactory">
		<cfargument name="configuration" type="string" required="yes">

		<cfset variables.configuration = arguments.configuration>

		<cfreturn this>
	</cffunction>

	<cffunction name="createGateway" access="public" output="false" returntype="any">
		<cfargument name="objectAlias" type="string" required="yes">
		<cfargument name="datasource" type="any" required="yes">

		<cfset var gateway = createObject("component", "javierjulio.test.library.test.#arguments.objectAlias#Gateway").init(arguments.objectAlias, arguments.datasource)>

		<cfreturn gateway>
	</cffunction>

	<cffunction name="getConfiguration" access="public" returntype="any" output="false">
		<cfreturn variables.configuration />
	</cffunction>
	<cffunction name="setConfiguration" access="public" returntype="void" output="false">
		<cfargument name="configuration" type="any" required="yes" hint="value of configuration" />
		<cfset variables.configuration = arguments.configuration />
	</cffunction>

</cfcomponent>