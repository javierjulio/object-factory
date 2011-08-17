<cfcomponent displayname="Datasource" hint="Handles datasource and dsn login settings" output="false">

	<!--- private object properties --->
	<cfset variables.name = "">
	<cfset variables.username = "">
	<cfset variables.password = "">
	<cfset variables.type = "">

	<cffunction name="init" access="public" output="false" returntype="datasource">
		<cfargument name="name" type="string" required="yes" hint="Datasource name (DSN)">
		<cfargument name="username" type="string" required="no" default="" hint="Username for DSN if needed">
		<cfargument name="password" type="string" required="no" default="" hint="Password for DSN if needed">
		<cfargument name="type" type="string" required="no" default="" hint="Database type - MSSQL, MYSQL, etc.">

		<!--- overwrite datasource properties with specified values --->
		<cfset setName(arguments.name)>
		<cfset setUsername(arguments.username)>
		<cfset setPassword(arguments.password)>
		<cfset setType(arguments.type)>

		<cfreturn this>
	</cffunction>

	<cffunction name="getName" access="public" output="false" returntype="string">
		<cfreturn variables.name>
	</cffunction>
	<cffunction name="setName" access="private" output="false" returntype="void">
		<cfargument name="name" type="string" required="yes">
		<cfset variables.name = arguments.name>
	</cffunction>

	<cffunction name="getUsername" access="public" output="false" returntype="string">
		<cfreturn variables.username>
	</cffunction>
	<cffunction name="setUsername" access="private" output="false" returntype="void">
		<cfargument name="username" type="string" required="yes">
		<cfset variables.username = arguments.username>
	</cffunction>

	<cffunction name="getPassword" access="public" output="false" returntype="string">
		<cfreturn variables.password>
	</cffunction>
	<cffunction name="setPassword" access="private" output="false" returntype="void">
		<cfargument name="password" type="string" required="yes">
		<cfset variables.password = arguments.password>
	</cffunction>

	<cffunction name="getType" access="public" output="false" returntype="string">
		<cfreturn variables.type>
	</cffunction>
	<cffunction name="setType" access="private" output="false" returntype="void">
		<cfargument name="type" type="string" required="yes">
		<cfset variables.type = arguments.type>
	</cffunction>

</cfcomponent>