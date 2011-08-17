<cfcomponent displayname="Element" hint="Element - Class Object">

	<!--- properties --->
	<cfscript>
		variables.id = 0;
		variables.revisionId = 0;
		variables.parentId = 0;
		variables.inheritanceLevel = 0;
		variables.name = "";
		variables.description = "";
		variables.type = "";
		variables.value = "";
		variables.category = "";
		variables.disableLinkStatus = false;
		variables.defaultLinkStatus = "";
		variables.linkStatus = "";
		variables.bindingStatus = "";
		variables.displayOrder = 0;
		variables.visibility = 0;
		variables.template = 0;
		variables.document = 0;
		variables.dataListExists = false;
		variables._includeInSummary = false;
		variables._includeInGuide = true;
		variables.createdDate = "";
		variables.createdBy = 0;
		variables.updatedDate = "";
		variables.updatedBy = 0;
		variables.datasource = 0;
		variables.updated = 0;									// this property is used at the document element level to show that a change has been made to an element via the template builder
		variables.updateType = "";							// this property is used at the document element level to show what type of change has been made (INSERT,UPDATE,DELETE)
		variables._promptChange = false;
		variables.promptChangeMessage = "";
		variables.dirty = false;
		variables.logicalDelete = 0;						// this property is used at the template element revision level
	</cfscript>

	<!--- constructor init() method --->
	<cffunction name="init" access="public" returntype="Element" output="false" hint="initiates instance of Element">
		<cfargument name="name" type="string" required="yes" />
		<cfset setName(arguments.name)>
		<cfreturn this />
	</cffunction>

	<!--- getters/setters accessors methods --->
	<cffunction name="getId" access="public" returntype="Numeric" output="false" hint="gets id property">
		<cfreturn variables.id />
	</cffunction>
	<cffunction name="setId" access="public" returntype="Void" output="false" hint="sets id property">
		<cfargument name="id" type="Numeric" required="yes" hint="value of id" />
		<cfset variables.id = arguments.id />
	</cffunction>

	<cffunction name="getRevisionId" access="public" returntype="Numeric" output="false" hint="gets revisionId property">
		<cfreturn variables.revisionId />
	</cffunction>
	<cffunction name="setRevisionId" access="public" returntype="Void" output="false" hint="sets revisionId property">
		<cfargument name="revisionId" type="Numeric" required="yes" hint="value of revisionId" />
		<cfset variables.revisionId = arguments.revisionId />
	</cffunction>

	<cffunction name="getParentId" access="public" returntype="Numeric" output="false" hint="gets parentId property">
		<cfreturn variables.parentId />
	</cffunction>
	<cffunction name="setParentId" access="public" returntype="Void" output="false" hint="sets parentId property">
		<cfargument name="parentId" type="Numeric" required="yes" hint="value of parentId" />
		<cfset variables.parentId = arguments.parentId />
	</cffunction>

	<cffunction name="getInheritanceLevel" access="public" returntype="Numeric" output="false" hint="gets inheritanceLevel property">
		<cfreturn variables.inheritanceLevel />
	</cffunction>
	<cffunction name="setInheritanceLevel" access="public" returntype="Void" output="false" hint="sets inheritanceLevel property">
		<cfargument name="inheritanceLevel" type="Numeric" required="yes" hint="value of inheritanceLevel" />
		<cfset variables.inheritanceLevel = arguments.inheritanceLevel />
	</cffunction>

	<cffunction name="getName" access="public" returntype="String" output="false" hint="gets name property">
		<cfreturn variables.name />
	</cffunction>
	<cffunction name="setName" access="public" returntype="Void" output="false" hint="sets name property">
		<cfargument name="name" type="String" required="yes" hint="value of name" />
		<cfset variables.name = arguments.name />
	</cffunction>

	<cffunction name="getDescription" access="public" returntype="String" output="false" hint="gets description property">
		<cfreturn variables.description />
	</cffunction>
	<cffunction name="setDescription" access="public" returntype="Void" output="false" hint="sets description property">
		<cfargument name="description" type="String" required="yes" hint="value of description" />
		<cfset variables.description = arguments.description />
	</cffunction>

	<cffunction name="getType" access="public" returntype="String" output="false" hint="gets type property">
		<cfreturn variables.type />
	</cffunction>
	<cffunction name="setType" access="public" returntype="Void" output="false" hint="sets type property">
		<cfargument name="type" type="String" required="yes" hint="value of type" />
		<cfset variables.type = arguments.type />
	</cffunction>

	<cffunction name="getValue" access="public" returntype="String" output="false" hint="gets value property">
		<cfreturn variables.value />
	</cffunction>
	<cffunction name="setValue" access="public" returntype="Void" output="false" hint="sets value property">
		<cfargument name="value" type="String" required="yes" hint="value of value" />
		<cfset variables.value = arguments.value />
	</cffunction>

	<cffunction name="getCategory" access="public" returntype="String" output="false" hint="gets category property">
		<cfreturn variables.category />
	</cffunction>
	<cffunction name="setCategory" access="public" returntype="Void" output="false" hint="sets category property">
		<cfargument name="category" type="String" required="yes" hint="value of category" />
		<cfset variables.category = arguments.category />
	</cffunction>

	<cffunction name="getDisableLinkStatus" access="public" returntype="boolean" output="false" hint="gets disableLinkStatus property">
		<cfreturn variables.disableLinkStatus />
	</cffunction>
	<cffunction name="setDisableLinkStatus" access="public" returntype="Void" output="false" hint="sets disableLinkStatus property">
		<cfargument name="disableLinkStatus" type="boolean" required="yes" hint="value of disableLinkStatus" />
		<cfset variables.disableLinkStatus = arguments.disableLinkStatus />
	</cffunction>

	<cffunction name="getDefaultLinkStatus" access="public" returntype="String" output="false" hint="gets defaultLinkStatus property">
		<cfreturn variables.defaultLinkStatus />
	</cffunction>
	<cffunction name="setDefaultLinkStatus" access="public" returntype="Void" output="false" hint="sets defaultLinkStatus property">
		<cfargument name="defaultLinkStatus" type="String" required="yes" hint="value of defaultLinkStatus" />
		<cfset variables.defaultLinkStatus = arguments.defaultLinkStatus />
	</cffunction>

	<cffunction name="getLinkStatus" access="public" returntype="String" output="false" hint="gets linkStatus property">
		<cfreturn variables.linkStatus />
	</cffunction>
	<cffunction name="setLinkStatus" access="public" returntype="Void" output="false" hint="sets linkStatus property">
		<cfargument name="linkStatus" type="String" required="yes" hint="value of linkStatus" />
		<cfset variables.linkStatus = arguments.linkStatus />
	</cffunction>

	<cffunction name="getBindingStatus" access="public" returntype="String" output="false" hint="gets bindingStatus property">
		<cfreturn variables.bindingStatus />
	</cffunction>
	<cffunction name="setBindingStatus" access="public" returntype="Void" output="false" hint="sets bindingStatus property">
		<cfargument name="bindingStatus" type="String" required="yes" hint="value of bindingStatus" />
		<cfset variables.bindingStatus = arguments.bindingStatus />
	</cffunction>

	<cffunction name="getDisplayOrder" access="public" returntype="Numeric" output="false" hint="gets displayOrder property">
		<cfreturn variables.displayOrder />
	</cffunction>
	<cffunction name="setDisplayOrder" access="public" returntype="Void" output="false" hint="sets displayOrder property">
		<cfargument name="displayOrder" type="Numeric" required="yes" hint="value of displayOrder" />
		<cfset variables.displayOrder = arguments.displayOrder />
	</cffunction>

	<cffunction name="getVisibility" access="public" returntype="ags.cfc.VisibilityCollection" output="false" hint="gets visibility property">
		<cfreturn variables.visibility />
	</cffunction>
	<cffunction name="setVisibility" access="public" returntype="Void" output="false" hint="sets visibility property">
		<cfargument name="visibility" type="ags.cfc.VisibilityCollection" required="yes" hint="value of visibility" />
		<cfset variables.visibility = arguments.visibility />
	</cffunction>

	<cffunction name="getTemplate" access="public" returntype="ags.cfc.Template" output="false" hint="gets template property">
		<cfreturn variables.template />
	</cffunction>
	<cffunction name="setTemplate" access="public" returntype="Void" output="false" hint="sets template property">
		<cfargument name="template" type="ags.cfc.Template" required="yes" hint="value of template" />
		<cfset variables.template = arguments.template />
	</cffunction>

	<cffunction name="getDocument" access="public" returntype="ags.cfc.Document" output="false" hint="gets document property">
		<cfreturn variables.document />
	</cffunction>
	<cffunction name="setDocument" access="public" returntype="Void" output="false" hint="sets document property">
		<cfargument name="document" type="ags.cfc.Document" required="yes" hint="value of document" />
		<cfset variables.document = arguments.document />
	</cffunction>

	<cffunction name="getDataListExists" access="public" returntype="Boolean" output="false" hint="gets dataListExists property">
		<cfreturn variables.dataListExists />
	</cffunction>
	<cffunction name="setDataListExists" access="public" returntype="Void" output="false" hint="sets dataListExists property">
		<cfargument name="dataListExists" type="Boolean" required="yes" />
		<cfset variables.dataListExists = arguments.dataListExists />
	</cffunction>

	<cffunction name="includeInSummary" access="public" returntype="Boolean" output="false" hint="gets/sets _includeInSummary property">
    <cfargument name="include" type="Boolean" required="no" />
    <cfscript>
      if(isDefined("arguments.include")){
      	variables._includeInSummary = arguments.include;
      	return variables._includeInSummary;
      }
      else{
        return variables._includeInSummary;
      }
    </cfscript>
	</cffunction>

	<cffunction name="includeInGuide" access="public" returntype="Boolean" output="false" hint="gets/sets includeInGuide property">
    <cfargument name="include" type="Boolean" required="no" />
    <cfscript>
      if(isDefined("arguments.include")){
      	variables._includeInGuide = arguments.include;
      	return variables._includeInGuide;
      }
      else{
        return variables._includeInGuide;
      }
    </cfscript>
	</cffunction>

	<cffunction name="getCreatedDate" access="public" returntype="Date" output="false" hint="gets createdDate property">
		<cfreturn variables.createdDate />
	</cffunction>
	<cffunction name="setCreatedDate" access="public" returntype="Void" output="false" hint="sets createdDate property">
		<cfargument name="createdDate" type="Date" required="yes" hint="value of createdDate" />
		<cfset variables.createdDate = CreateODBCDateTime(arguments.createdDate) />
	</cffunction>

	<cffunction name="getCreatedBy" access="public" returntype="ags.cfc.User" output="false" hint="gets createdBy property">
		<cfreturn variables.createdBy />
	</cffunction>
	<cffunction name="setCreatedBy" access="public" returntype="Void" output="false" hint="sets createdBy property">
		<cfargument name="createdBy" type="ags.cfc.User" required="yes" hint="value of createdBy" />
		<cfset variables.createdBy = arguments.createdBy />
	</cffunction>

	<cffunction name="getUpdatedDate" access="public" returntype="Date" output="false" hint="gets updatedDate property">
		<cfreturn variables.updatedDate />
	</cffunction>
	<cffunction name="setUpdatedDate" access="public" returntype="Void" output="false" hint="sets updatedDate property">
		<cfargument name="updatedDate" type="Date" required="yes" hint="value of updatedDate" />
		<cfset variables.updatedDate = CreateODBCDateTime(arguments.updatedDate) />
	</cffunction>

	<cffunction name="getUpdatedBy" access="public" returntype="ags.cfc.User" output="false" hint="gets updatedBy property">
		<cfreturn variables.updatedBy />
	</cffunction>
	<cffunction name="setUpdatedBy" access="public" returntype="Void" output="false" hint="sets updatedBy property">
		<cfargument name="updatedBy" type="ags.cfc.User" required="yes" hint="value of updatedBy" />
		<cfset variables.updatedBy = arguments.updatedBy />
	</cffunction>

	<cffunction name="getDatasource" access="public" returntype="ags.cfc.configBeans.Datasource" output="false" hint="gets datasource property">
		<cfreturn variables.datasource />
	</cffunction>
	<cffunction name="setDatasource" access="public" returntype="Void" output="false" hint="sets datasource property">
		<cfargument name="datasource" type="ags.cfc.configBeans.Datasource" required="yes" hint="value of datasource" />
		<cfset variables.datasource = arguments.datasource />
	</cffunction>

	<cffunction name="isUpdated" access="public" returntype="Boolean" output="false" hint="gets updated property; if element structure has been changed in the template">
		<cfreturn variables.updated />
	</cffunction>
	<cffunction name="setUpdated" access="public" returntype="Void" output="false" hint="sets updated property">
		<cfargument name="updated" type="Boolean" required="yes" hint="value of updated" />
		<cfset variables.updated = arguments.updated />
	</cffunction>

	<cffunction name="getUpdateType" access="public" returntype="String" output="false" hint="gets updateType property">
		<cfreturn variables.updateType />
	</cffunction>
	<cffunction name="setUpdateType" access="public" returntype="Void" output="false" hint="sets updateType property">
		<cfargument name="updateType" type="String" required="yes" hint="value of updateType" />
		<cfset variables.updateType = arguments.updateType />
	</cffunction>

	<cffunction name="isDirty" access="public" returntype="Boolean" output="false" hint="gets dirty property">
		<cfreturn variables.dirty />
	</cffunction>
	<cffunction name="setDirty" access="public" returntype="Void" output="false" hint="sets dirty property">
		<cfargument name="dirty" type="Boolean" required="yes" />
		<cfset variables.dirty = arguments.dirty />
	</cffunction>

	<cffunction name="promptChange" access="public" returntype="Boolean" output="false" hint="gets promptChange property">
		<cfreturn variables._promptChange />
	</cffunction>
	<cffunction name="setPromptChange" access="public" returntype="Void" output="false" hint="sets promptChange property">
		<cfargument name="promptChange" type="Boolean" required="yes" hint="value of promptChange" />
		<cfset variables._promptChange = arguments.promptChange />
	</cffunction>

	<cffunction name="getPromptChangeMessage" access="public" returntype="String" output="false" hint="gets promptChangeMessage property">
		<cfreturn variables.promptChangeMessage />
	</cffunction>
	<cffunction name="setPromptChangeMessage" access="public" returntype="Void" output="false" hint="sets promptChangeMessage property">
		<cfargument name="promptChangeMessage" type="String" required="yes" hint="value of promptChangeMessage" />
		<cfset variables.promptChangeMessage = arguments.promptChangeMessage />
	</cffunction>

	<cffunction name="getLogicalDelete" access="public" returntype="Boolean" output="false" hint="gets logicalDelete property">
		<cfreturn variables.logicalDelete />
	</cffunction>
	<cffunction name="setLogicalDelete" access="public" returntype="Void" output="false" hint="sets logicalDelete property">
		<cfargument name="logicalDelete" type="Boolean" required="yes" hint="value of logicalDelete" />
		<cfset variables.logicalDelete = arguments.logicalDelete />
	</cffunction>

</cfcomponent>