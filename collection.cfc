<cfcomponent displayname="Collection" hint="Handles a collection of objects" output="false">

	<!--- private object properties --->
	<cfset variables.container = arrayNew(1)>
	<cfset variables.trash = arrayNew(1)>
	<cfset variables.currentIndex = 0>
	<cfset variables.trashIndex = 0>

	<cffunction name="init" access="public" output="false" returntype="Collection">
		<cfargument name="container" type="array" required="no" default="#arrayNew(1)#">

		<!--- define local function variables --->
		<cfset var i = 0>

		<cfloop index="i" from="1" to="#arrayLen(container)#">
			<cfset arrayAppend(variables.container, arguments.container[i])>
		</cfloop>

		<cfset setCurrentIndex(count())>

		<cfreturn this>
	</cffunction>

	<cffunction name="getCurrentIndex" access="public" output="false" returntype="numeric">
		<cfreturn variables.currentIndex>
	</cffunction>
	<cffunction name="setCurrentIndex" access="public" output="false" returntype="void">
		<cfargument name="currentIndex" type="numeric" required="yes">
		<cfset variables.currentIndex = arguments.currentIndex>
	</cffunction>

	<cffunction name="getTrashIndex" access="public" output="false" returntype="numeric">
		<cfreturn variables.trashIndex>
	</cffunction>
	<cffunction name="setTrashIndex" access="public" output="false" returntype="void">
		<cfargument name="trashIndex" type="numeric" required="yes">
		<cfset variables.trashIndex = arguments.trashIndex>
	</cffunction>

	<cffunction name="add" access="public" output="false" returntype="void">
		<cfargument name="object" type="any" required="yes">
		<cfset arrayAppend(variables.container, arguments.object)>
		<cfset setCurrentIndex(count())>
	</cffunction>

	<cffunction name="getAt" access="public" output="false" returntype="any">
		<cfargument name="index" type="numeric" required="yes">
		<cfreturn variables.container[arguments.index]>
	</cffunction>

	<cffunction name="existsAt" access="public" output="false" returntype="boolean">
		<cfargument name="index" type="numeric" required="yes">

		<cftry>
			<cfset variables.container[arguments.index]>

			<cfcatch type="coldfusion.runtime.UndefinedElementException">
				<cfreturn false>
			</cfcatch>

			<cfcatch type="coldfusion.runtime.CfJspPage$ArrayBoundException">
				<cfreturn false>
			</cfcatch>
		</cftry>

		<cfreturn true>
	</cffunction>

	<cffunction name="removeAt" access="public" output="false" returntype="boolean">
		<cfargument name="index" type="numeric" required="yes">

		<cfif arguments.index GTE 1 AND arguments.index LTE count()>
			<cfset setTrashIndex(getTrashIndex() + 1)>
			<cfset variables.trash[getTrashIndex()] = getAt(arguments.index)>
			<cfset arrayDeleteAt(variables.container, arguments.index)>
			<cfreturn true>
		<cfelse>
			<cfreturn false>
		</cfif>
	</cffunction>

	<cffunction name="swap" access="public" output="false" returntype="void">
		<cfargument name="indexA" type="numeric" required="yes">
		<cfargument name="indexB" type="numeric" required="yes">
		<cfset arraySwap(variables.container, arguments.indexA, arguments.indexB)>
	</cffunction>

	<cffunction name="count" access="public" output="false" returntype="numeric">
		<cfreturn arrayLen(variables.container)>
	</cffunction>

	<cffunction name="countTrash" access="public" output="false" returntype="numeric">
		<cfreturn arrayLen(variables.trash)>
	</cffunction>

	<cffunction name="current" access="public" output="false" returntype="any">
		<cfreturn variables.container[variables.currentIndex]>
	</cffunction>

	<cffunction name="previous" access="public" output="false" returntype="any">
		<cfif getCurrentIndex() GT 1>
			<cfset setCurrentIndex(getCurrentIndex() - 1)>
			<cfreturn variables.container[getCurrentIndex()]>
		</cfif>
	</cffunction>

	<cffunction name="next" access="public" output="false" returntype="any">
		<cfif getCurrentIndex() LT count()>
			<cfset setCurrentIndex(getCurrentIndex() + 1)>
			<cfreturn variables.container[getCurrentIndex()]>
		</cfif>
	</cffunction>

	<cffunction name="hasNext" access="public" output="false" returntype="boolean">
		<cfif getCurrentIndex() LT count()>
			<cfreturn true>
		<cfelse>
			<cfreturn false>
		</cfif>
	</cffunction>

	<cffunction name="first" access="public" output="false" returntype="any">
		<cfset setCurrentIndex(1)>
		<cfreturn variables.container[getCurrentIndex()]>
	</cffunction>

	<cffunction name="last" access="public" output="false" returntype="any">
		<cfset setCurrentIndex(count())>
		<cfreturn variables.container[getCurrentIndex()]>
	</cffunction>

	<cffunction name="getAll" access="public" output="false" returntype="array">
		<cfreturn variables.container>
	</cffunction>

	<cffunction name="getTrash" access="public" output="false" returntype="array">
		<cfreturn variables.trash>
	</cffunction>

	<cffunction name="clear" access="public" output="false" returntype="void">
		<cfset variables.container = arrayNew(1)>
		<cfset variables.trash = arrayNew(1)>
		<cfset setCurrentIndex(count())>
		<cfset setTrashIndex(countTrash())>
	</cffunction>

</cfcomponent>