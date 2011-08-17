<cfcomponent displayname="User" hint="User - Class Object">

	<!--- propertie(s) --->
	<cfscript>
		variables.id = 0;
		variables.organization = 0;
		variables.group = 0;
		variables.roles = 0;
		variables.firstName = "";
		variables.lastName = "";
		variables.title = "";
		variables.email = "";
		variables.username = "";
		variables.password = "";
		variables.createdDate = now();
		variables.createdBy = "";
		variables.updatedDate = now();
		variables.updatedBy = "";
		variables.datasource = 0;
		variables.logicalDelete = 0;
	</cfscript>

	<!--- constructor init() method --->
	<cffunction name="init" access="public" returntype="User" output="false" hint="initiates instance of User">
		<cfargument name="datasource" type="any" required="yes" default="0" />
		<cfargument name="id" type="numeric" required="no" />
		<cfargument name="createdBy" type="any" required="no" default="" />
		<cfargument name="updatedBy" type="any" required="no" default="" />

		<cfscript>
			setDatasource(arguments.datasource);
			setCreatedBy(arguments.createdBy);
			setUpdatedBy(arguments.updatedBy);
			if (structKeyExists(arguments, "id")) {
				setId(arguments.id);
			}
		</cfscript>

		<cfreturn this />
	</cffunction>

	<!--- getters/setters accessor and mutator methods --->
	<cffunction name="getId" access="public" returntype="numeric" output="false" hint="gets id property" >
		<cfreturn variables.id />
	</cffunction>
	<cffunction name="setId" access="public" returntype="Void" output="false" hint="sets id property" >
		<cfargument name="id" type="numeric" required="yes" hint="value of user id" />
		<cfset variables.id = arguments.id />
	</cffunction>

	<cffunction name="getOrganization" access="public" returntype="ags.cfc.Organization" output="false" hint="gets organization property">
		<cfreturn variables.organization />
	</cffunction>
	<cffunction name="setOrganization" access="public" returntype="Void" output="false" hint="sets organization property">
		<cfargument name="organization" type="ags.cfc.Organization" required="yes" hint="value of organization" />
		<cfset variables.organization = arguments.organization />
	</cffunction>

	<cffunction name="getGroup" access="public" returntype="ags.cfc.Group" output="false" hint="gets group property">
		<cfreturn variables.group />
	</cffunction>
	<cffunction name="setGroup" access="public" returntype="Void" output="false" hint="sets group property">
		<cfargument name="group" type="ags.cfc.Group" required="yes" hint="value of group" />
		<cfset variables.group = arguments.group />
	</cffunction>

	<cffunction name="getFirstName" access="public" returntype="string" output="false" hint="gets first name property" >
		<cfreturn variables.firstName />
	</cffunction>
	<cffunction name="setFirstName" access="public" returntype="Void" output="false" hint="sets first name property" >
		<cfargument name="firstName" type="string" required="yes" hint="value of first name" />
		<cfset variables.firstName = arguments.firstName />
	</cffunction>

	<cffunction name="getLastName" access="public" returntype="string" output="false" hint="gets last name property" >
		<cfreturn variables.lastName />
	</cffunction>
	<cffunction name="setLastName" access="public" returntype="Void" output="false" hint="sets last name property" >
		<cfargument name="lastName" type="string" required="yes" hint="value of last name" />
		<cfset variables.lastName = arguments.lastName />
	</cffunction>

	<cffunction name="getTitle" access="public" returntype="String" output="false" hint="gets title property">
		<cfreturn variables.title />
	</cffunction>
	<cffunction name="setTitle" access="public" returntype="Void" output="false" hint="sets title property">
		<cfargument name="title" type="String" required="yes" hint="value of title" />
		<cfset variables.title = arguments.title />
	</cffunction>

	<cffunction name="getEmail" access="public" returntype="String" output="false" hint="gets email property">
		<cfreturn variables.email />
	</cffunction>

	<cffunction name="setEmail" access="public" returntype="Void" output="false" hint="sets email property">
		<cfargument name="email" type="String" required="yes" hint="value of email" />
		<cfset variables.email = arguments.email />
	</cffunction>

	<cffunction name="getUsername" access="public" returntype="string" output="false" hint="gets username property" >
		<cfreturn variables.username />
	</cffunction>

	<cffunction name="setUsername" access="public" returntype="Void" output="false" hint="sets username property" >
		<cfargument name="username" type="string" required="yes" hint="value of userusername" />
		<cfset variables.username = arguments.username />
	</cffunction>

	<cffunction name="getPassword" access="public" returntype="String" output="false" hint="gets password property">
		<cfreturn variables.password />
	</cffunction>

	<cffunction name="setPassword" access="public" returntype="Void" output="false" hint="sets password property">
		<cfargument name="password" type="String" required="yes" hint="value of password" />
		<cfset variables.password = arguments.password />
	</cffunction>

	<cffunction name="getCreatedDate" access="public" returntype="Date" output="false" hint="gets createdDate property">
		<cfreturn variables.createdDate />
	</cffunction>

	<cffunction name="getFormattedCreatedDate" access="public" returntype="Date" output="false" hint="gets createdDate property">
		<cfreturn DateFormat(variables.createdDate,"mm/dd/yyyy") />
	</cffunction>

	<cffunction name="setCreatedDate" access="public" returntype="Void" output="false" hint="sets createdDate property">
		<cfargument name="createdDate" type="Date" required="yes" hint="value of createdDate" />
		<cfset variables.createdDate = CreateODBCDateTime(arguments.createdDate) />
	</cffunction>

	<cffunction name="getCreatedBy" access="public" returntype="any" output="false" hint="gets createdBy property">
		<cfreturn variables.createdBy />
	</cffunction>

	<cffunction name="setCreatedBy" access="public" returntype="Void" output="false" hint="sets createdBy property">
		<cfargument name="createdBy" type="any" required="yes" hint="value of createdBy" />
		<cfset variables.createdBy = arguments.createdBy />
	</cffunction>

	<cffunction name="getUpdatedDate" access="public" returntype="Date" output="false" hint="gets updatedDate property">
		<cfreturn variables.updatedDate />
	</cffunction>

	<cffunction name="getFormattedUpdatedDate" access="public" returntype="Date" output="false" hint="gets updatedDate property">
		<cfreturn DateFormat(variables.updatedDate,"mm/dd/yyyy") />
	</cffunction>

	<cffunction name="setUpdatedDate" access="public" returntype="Void" output="false" hint="sets updatedDate property">
		<cfargument name="updatedDate" type="Date" required="yes" hint="value of updatedDate" />
		<cfset variables.updatedDate = CreateODBCDateTime(arguments.updatedDate) />
	</cffunction>

	<cffunction name="getUpdatedBy" access="public" returntype="any" output="false" hint="gets updatedBy property">
		<cfreturn variables.updatedBy />
	</cffunction>

	<cffunction name="setUpdatedBy" access="public" returntype="Void" output="false" hint="sets updatedBy property">
		<cfargument name="updatedBy" type="any" required="yes" hint="value of updatedBy" />
		<cfset variables.updatedBy = arguments.updatedBy />
	</cffunction>

	<cffunction name="getDatasource" access="public" returntype="any" output="false" hint="gets datasource property" >
		<cfreturn variables.datasource />
	</cffunction>

	<cffunction name="setDatasource" access="public" returntype="Void" output="false" hint="sets datasource property" >
		<cfargument name="datasource" type="any" required="yes" hint="value of datasource" />
		<cfset variables.datasource = arguments.datasource />
	</cffunction>

	<cffunction name="getLogicalDelete" access="public" returntype="numeric" output="false" hint="gets logicalDelete property">
		<cfreturn variables.logicalDelete />
	</cffunction>

	<cffunction name="setLogicalDelete" access="public" returntype="Void" output="false" hint="sets logicalDelete property">
		<cfargument name="logicalDelete" type="numeric" required="yes" hint="value of logicalDelete" />
		<cfset variables.logicalDelete = arguments.logicalDelete />
	</cffunction>

</cfcomponent>