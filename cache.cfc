<cfcomponent displayname="Cache" hint="Handles data caching operations" output="false">

	<!--- private object properties --->
	<cfset variables.cache = structNew()>
	<cfset variables.timeout = 0>

	<cffunction name="init" access="public" output="false" returntype="cache">
		<cfargument name="timeout" type="numeric" required="yes" hint="Cache timeout in minutes">

		<!--- set the default timeout in minutes --->
		<cfset setTimeout(arguments.timeout)>

		<cfreturn this>
	</cffunction>

	<cffunction name="getCache" access="public" output="false" returntype="struct">
		<cfreturn variables.cache>
	</cffunction>
	<cffunction name="setCache" access="private" output="false" returntype="void">
		<cfargument name="cache" type="struct" required="yes">
		<cfset variables.cache = arguments.cache>
	</cffunction>

	<cffunction name="getTimeout" access="public" output="false" returntype="numeric">
		<cfreturn variables.timeout>
	</cffunction>
	<cffunction name="setTimeout" access="private" output="false" returntype="void">
		<cfargument name="timeout" type="numeric" required="yes" hint="Cache timeout in minutes">
		<cfset variables.timeout = arguments.timeout>
	</cffunction>

	<cffunction name="clear" access="public" output="false" returntype="void">
		<cfset structClear(getCache())>
	</cffunction>

	<cffunction name="delete" access="public" output="false" returntype="boolean">
		<cfargument name="name" type="string" required="yes" hint="Name of the value to be deleted">
		<cfreturn structDelete(getCache(), arguments.name)>
	</cffunction>

	<cffunction name="exists" access="public" output="false" returntype="boolean">
		<cfargument name="name" type="string" required="yes" hint="Name of the value to test for existence">

		<!--- define local function variables --->
		<cfset var cache = getCache()>

		<!--- if cached variable has had its cache time out, delete it from the cache first --->
		<cfif structKeyExists(cache, arguments.name) AND now() * 1 GTE cache[arguments.name].expires>
			<cfset delete(arguments.name)>
		</cfif>

		<cfreturn structKeyExists(cache, arguments.name)>
	</cffunction>

	<cffunction name="get" access="public" output="false" returntype="any">
		<cfargument name="name" type="string" required="yes" hint="Name of the cached value to return">
		<cfargument name="defaultValue" type="any" required="no" hint="Default value to set and return">

		<!--- define local function variables --->
		<cfset var cache = getCache()>

		<!--- if cached value exists return it, otherwise return default or empty string --->
		<cfif exists(arguments.name)>
			<cfset cache[arguments.name].lastAccessedOn = now()>
			<cfreturn cache[arguments.name].value>
		<cfelseif structKeyExists(arguments, "defaultValue")>
			<cfset set(arguments.name, arguments.defaultValue)>
			<cfreturn arguments.defaultValue>
		<cfelse>
			<cfreturn "">
		</cfif>
	</cffunction>

	<cffunction name="set" access="public" output="false" returntype="void">
		<cfargument name="name" type="string" required="yes" hint="Name of the value to be added">
		<cfargument name="value" type="any" required="yes" hint="The value to be cached">
		<cfargument name="timeout" type="numeric" required="no" default="#getTimeout()#" hint="Cache timeout in mins">

		<!--- define local function variables --->
		<cfset var cache = getCache()>

		<!--- add the value to the cache and set its expiration time --->
		<cfset cache[arguments.name] = structNew()>
		<cfset cache[arguments.name].expires = now() * 1 + createTimeSpan(0, 0, arguments.timeout, 0)>
		<cfset cache[arguments.name].lastAccessedOn = now()>
		<cfset cache[arguments.name].cachedOn = now()>
		<cfset cache[arguments.name].value = arguments.value>
	</cffunction>

</cfcomponent>