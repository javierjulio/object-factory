<cfcomponent displayName="ElementCollection" hint="ElementCollection - Collection Object" extends="javierjulio.test.library.Collection">

	<!--- contructors --->
	<cffunction name="init" access="public" returnType="ElementCollection" output="false" hint="constructor method">
		<cfset super.init(arguments.container)>
		<cfreturn this />
	</cffunction>

	<!--- public method(s) --->
	<cffunction name="getById" access="public" returntype="ags.cfc.Element" output="false" hint="I return an element in the collection given its id">
		<cfargument name="elementId" type="Numeric" required="true" />
		<cfscript>
			// init local var(s)
			var count = count();
			var x = 0;

			for(x = 1; x LTE count; x = x + 1){
				if(getAt(x).getId() EQ arguments.elementId){
					return getAt(x);
				}
			}
		</cfscript>
	</cffunction>

	<cffunction name="getByName" access="public" returntype="ags.cfc.Element" output="false" hint="I return an element in the collection given its id">
		<cfargument name="elementName" type="String" required="true" />
		<cfscript>
			// init local var(s)
			var count = count();
			var x = 0;

			for(x = 1; x LTE count; x = x + 1 ){
				if(getAt(x).getName() EQ arguments.elementName){
					return getAt(x);
				}
			}
		</cfscript>
	</cffunction>

	<cffunction name="existsById" access="public" returnType="Boolean" output="false" hint="I check if an element exists by elementId">
		<cfargument name="elementId" type="Numeric" required="true" />
		<cfscript>
			// init local var(s)
			var retVal = false;
			var count = count();
			var x = 0;

			for(x = 1; x LTE count; x = x + 1){
				if(getAt(x).getId() EQ arguments.elementId){
					retVal = true;
					break;
				}
			}
		</cfscript>
		<cfreturn retVal />
	</cffunction>

</cfcomponent>