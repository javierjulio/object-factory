<cfcomponent displayname="XmlEditor" hint="Handles creation and editing of an XML document" output="false">

	<!--- private object properties --->
	<cfset variables.document = "">
	<cfset variables.filePath = "">
	<cfset variables.lineSeparator = createObject("java", "java.lang.System").getProperty("line.separator")>

	<cffunction name="init" access="public" output="false" returntype="XmlEditor">
		<cfargument name="xml" type="string" required="no" default="" hint="XML Object or absolute path to XML file">
		<cfargument name="rootName" type="string" required="no" default="root" hint="Root node name of XML document">

		<!--- if xml is a valid XML document then store it --->
		<cfif isXmlDoc(arguments.xml)>
			<cfset setDocument(arguments.xml)>
		<!--- if xml is a valid file path, then store it, parse the XML, and set the document --->
		<cfelseif fileExists(arguments.xml)>
			<cfset setFilePath(arguments.xml)>
			<cfset setDocument(xmlParse(arguments.xml))>
		<!--- or if xml is an empty string, then we are creating a new XML document --->
		<cfelseif NOT len(trim(arguments.xml))>
			<cfset createDocument(arguments.rootName)>
		</cfif>

		<cfreturn this>
	</cffunction>

	<cffunction name="getDocument" access="public" output="false" returntype="xml">
		<cfreturn variables.document>
	</cffunction>
	<cffunction name="setDocument" access="private" output="false" returntype="void">
		<cfargument name="document" type="xml" required="yes">
		<cfset variables.document = arguments.document>
	</cffunction>

	<cffunction name="getFilePath" access="public" output="false" returntype="string">
		<cfreturn variables.filePath>
	</cffunction>
	<cffunction name="setFilePath" access="private" output="false" returntype="void">
		<cfargument name="filePath" type="string" required="yes">
		<cfset variables.filePath = arguments.filePath>
	</cffunction>

	<cffunction name="getLineSeparator" access="public" output="false" returntype="string">
		<cfreturn variables.lineSeparator>
	</cffunction>
	<cffunction name="setLineSeparator" access="private" output="false" returntype="void">
		<cfargument name="lineSeparator" type="string" required="yes">
		<cfset variables.lineSeparator = arguments.lineSeparator>
	</cffunction>

	<cffunction name="createDocument" access="private" output="false" returntype="void">
		<cfargument name="rootName" type="string" required="yes" hint="Root node name of XML document">
		<cfset var xmlDoc = xmlNew()>
		<cfset xmlDoc.xmlRoot = xmlElemNew(xmlDoc, arguments.rootName)>
		<cfset setDocument(xmlDoc)>
	</cffunction>

	<cffunction name="getRoot" access="public" output="false" returntype="string">
		<cfreturn getDocument().xmlroot>
	</cffunction>

	<cffunction name="getRootName" access="public" output="false" returntype="string">
		<cfreturn getDocument().xmlroot.xmlName>
	</cffunction>
	<cffunction name="setRootName" access="public" output="false" returntype="void">
		<cfargument name="rootName" type="string" required="yes">
		<cfset getDocument().xmlroot.xmlName = arguments.rootName>
	</cffunction>

	<cffunction name="getParent" access="public" output="false" returntype="void">
		<cfargument name="xpath" type="string" required="yes">
		<cfset var xml = xmlSearch(getDocument(), arguments.xpath)>
		<cfreturn xml[1].xmlParent>
	</cffunction>

	<cffunction name="getParentName" access="public" output="false" returntype="void">
		<cfargument name="xpath" type="string" required="yes">
		<cfset var xml = xmlSearch(getDocument(), arguments.xpath)>
		<cfreturn xml[1].xmlParent.xmlName>
	</cffunction>

	<cffunction name="setAttribute" access="public" output="false" returntype="void">
		<cfargument name="xpath" type="string" required="yes">
		<cfargument name="name" type="string" required="yes">
		<cfargument name="value" type="string" required="no" default="">

		<!--- define local function variables --->
		<cfset var xml = xmlSearch(getDocument(), arguments.xpath)>
		<cfset var i = 0>

		<!--- create specified attribute for each element that was found --->
		<cfloop index="i" from="1" to="#arrayLen(xml)#">
			<cfset xml[i].xmlAttributes[arguments.name] = arguments.value>
		</cfloop>
	</cffunction>

	<cffunction name="setAttributes" access="public" output="false" returntype="void">
		<cfargument name="xpath" type="string" required="yes">
		<cfargument name="attributes" type="struct" required="yes">

		<!--- define local function variables --->
		<cfset var xml = xmlSearch(getDocument(), arguments.xpath)>

		<!--- append the new attributes to those already existing --->
		<cfset structAppend(xml[1].xmlAttributes, arguments.attributes)>
	</cffunction>

	<cffunction name="removeAttribute" access="public" output="false" returntype="void">
		<cfargument name="xpath" type="string" required="yes">
		<cfargument name="name" type="string" required="yes">

		<!--- define local function variables --->
		<cfset var xml = xmlSearch(getDocument(), arguments.xpath)>

		<!--- if attribute exists for specified element, then delete it --->
		<cfif hasAttribute(arguments.xpath, arguments.name)>
			<cfset structDelete(xml[1].xmlAttributes, arguments.name)>
		</cfif>
	</cffunction>

	<cffunction name="removeAttributes" access="public" output="false" returntype="void">
		<cfargument name="xpath" type="string" required="yes">

		<!--- define local function variables --->
		<cfset var xml = xmlSearch(getDocument(), arguments.xpath)>
		<cfset var i = 0>

		<!--- remove all attributes for each element that was found --->
		<cfloop index="i" from="1" to="#arrayLen(xml)#">
			<cfset structClear(xml[i].xmlAttributes)>
		</cfloop>
	</cffunction>

	<cffunction name="hasAttribute" access="public" output="false" returntype="boolean">
		<cfargument name="xpath" type="string" required="yes">
		<cfargument name="name" type="string" required="yes">
		<cfset var xml = xmlSearch(getDocument(), arguments.xpath)>
		<cfreturn isArray(xml) AND arrayLen(xml) AND structKeyExists(xml[1].xmlAttributes, arguments.name)>
	</cffunction>

	<cffunction name="hasAttributes" access="public" output="false" returntype="numeric">
		<cfargument name="xpath" type="string" required="yes">
		<cfset var xml = xmlSearch(getDocument(), arguments.xpath)>
		<cfreturn isArray(xml) AND arrayLen(xml) AND structCount(xml[1].xmlAttributes)>
	</cffunction>

	<cffunction name="addChildAt" access="public" output="false" returntype="void">
		<cfargument name="xpath" type="string" required="yes">
		<cfargument name="position" type="numeric" required="yes">
		<cfargument name="nodeName" type="string" required="no" default="child">
		<cfargument name="nodeValue" type="string" required="no" default="">

		<!--- define local function variables --->
		<cfset var xml = xmlSearch(getDocument(), arguments.xpath)>

		<!--- if position is within array length, insert new element at desired position --->
		<cfif arguments.position GT 0 AND arguments.position LTE arrayLen(xml[1].xmlChildren)>
			<cfset arrayInsertAt(xml[1].xmlChildren, arguments.position, xmlElemNew(getDocument(), arguments.nodeName))>
		</cfif>

		<!--- if a node value is provided then add it to newly created element --->
		<cfif len(trim(arguments.nodeValue))>
			<cfset xml[1].xmlChildren[arrayLen(xml[1].xmlChildren)].xmlText = arguments.nodeValue>
		</cfif>
	</cffunction>

	<cffunction name="appendChild" access="public" output="false" returntype="void">
		<cfargument name="xpath" type="string" required="yes">
		<cfargument name="nodeName" type="string" required="no" default="child">
		<cfargument name="nodeValue" type="string" required="no" default="">

		<!--- define local function variables --->
		<cfset var xml = xmlSearch(getDocument(), arguments.xpath)>

		<!--- append new child element to the existing children --->
		<cfset arrayAppend(xml[1].xmlChildren, xmlElemNew(getDocument(), arguments.nodeName))>

		<!--- if a node value is provided then add it to newly created element --->
		<cfif len(trim(arguments.nodeValue))>
			<cfset xml[1].xmlChildren[arrayLen(xml[1].xmlChildren)].xmlText = arguments.nodeValue>
		</cfif>
	</cffunction>

	<cffunction name="prependChild" access="public" output="false" returntype="void">
		<cfargument name="xpath" type="string" required="yes">
		<cfargument name="node" type="string" required="no" default="child">
		<cfargument name="nodeValue" type="string" required="no" default="">

		<!--- define local function variables --->
		<cfset var xml = xmlSearch(getDocument(), arguments.xpath)>

		<!--- prepend new child element to the existing children --->
		<cfset arrayPrepend(xml[1].xmlChildren, xmlElemNew(getDocument(), arguments.node))>

		<!--- if a node value is provided then add it to newly created element --->
		<cfif structKeyExists(arguments, "nodeValue")>
			<cfset xml[1].xmlChildren[1].xmlText = arguments.nodeValue>
		</cfif>
	</cffunction>

	<cffunction name="removeChild" access="public" output="false" returntype="void">
		<cfargument name="xpath" type="string" required="yes">
		<cfargument name="position" type="numeric" required="yes">

		<!--- define local function variables --->
		<cfset var xml = xmlSearch(getDocument(), arguments.xpath)>
		<cfset var i = 0>

		<!--- remove all children for each element that was found --->
		<cfloop index="i" from="1" to="#arrayLen(xml)#">
			<!--- if position is within array length, then delete element at desired position --->
			<cfif arguments.position GT 0 AND arguments.position LTE arrayLen(xml[i].xmlChildren)>
				<cfset arrayDeleteAt(xml[i].xmlChildren, arguments.position)>
			</cfif>
		</cfloop>
	</cffunction>

	<cffunction name="removeChildren" access="public" output="false" returntype="void">
		<cfargument name="xpath" type="string" required="yes">

		<!--- define local function variables --->
		<cfset var xml = xmlSearch(getDocument(), arguments.xpath)>
		<cfset var i = 0>

		<!--- remove all children for each element that was found --->
		<cfloop index="i" from="1" to="#arrayLen(xml)#">
			<cfset arrayClear(xml[i].xmlChildren)>
		</cfloop>
	</cffunction>

	<cffunction name="hasChildren" access="public" output="false" returntype="numeric">
		<cfargument name="xpath" type="string" required="yes">
		<cfset var xml = xmlSearch(getDocument(), arguments.xpath)>
		<cfreturn arrayLen(xml[1].xmlChildren)>
	</cffunction>

	<cffunction name="addComment" access="public" output="false" returntype="void">
		<cfargument name="xpath" type="string" required="yes">
		<cfargument name="comment" type="string" required="yes">

		<!--- define local function variables --->
		<cfset var xml = xmlSearch(getDocument(), arguments.xpath)>
		<cfset var i = 0>

		<!--- add a comment for each element that was found --->
		<cfloop index="i" from="1" to="#arrayLen(xml)#">
			<cfset xml[i].xmlComment = arguments.comment>
		</cfloop>
	</cffunction>

	<cffunction name="clone" access="public" output="false" returntype="void">
		<cfargument name="xpath" type="string" required="yes">

		<!--- define local function variables --->
		<cfset var xml = xmlSearch(getDocument(), arguments.xpath)>
		<cfset var i = 0>

		<!--- clone specified node for each element that was found --->
		<cfloop index="i" from="1" to="#arrayLen(xml)#">
			<!--- we cannot clone the root, but all other nodes are game --->
			<cfif NOT isXmlRoot(xml[i])>
				<cfset arrayAppend(xml[i].xmlParent.xmlChildren, xml[i])>
			</cfif>
		</cfloop>
	</cffunction>

	<cffunction name="indent" access="private" output="false" returntype="string">
		<cfargument name="xmlDoc" type="string" required="yes">

		<!--- define local function variables --->
		<cfset var cr = getLineSeparator()>
		<cfset var result = "">
		<cfset var tab = "	">
		<cfset var xml = "">
		<cfset var i = "">

		<!--- if this is an XML Document, use the root element --->
		<cfif isXmlDoc(arguments.xmlDoc)>
			<cfset xml = arguments.xmlDoc.XmlRoot>
		<cfelseif isXmlElem(arguments.xmlDoc)>
			<!--- this is an XML Document so use it as-as --->
			<cfset xml = arguments.xmlDoc>
		</cfif>

		<!--- add any comments in this element --->
		<cfif len(trim(xml.xmlComment))>
			<cfset result = "#result#<!-- #xmlFormat(trim(xml.xmlComment))# -->#cr#">
		</cfif>

		<!--- now we are just working with an XML element --->
		<cfset result = "#result#<#xml.xmlName#">

		<!--- add all attributes to current XML element --->
		<cfloop collection="#xml.xmlAttributes#" item="i">
			<cfset result = '#result# #i#="#xmlFormat(xml.xmlAttributes[i])#"'>
		</cfloop>

		<!--- if node has a text value or there are children available --->
		<cfif len(xml.xmlText) OR (structKeyExists(xml, "xmlChildren") AND arrayLen(xml.xmlChildren))>
			<!--- add a carriage return for text/nested elements --->
			<cfset result = "#result#>#cr#">

			<!--- add any text in this element --->
			<cfif len(trim(xml.xmlText))>
				<cfset result = "#result##tab##xmlFormat(trim(xml.xmlText))##cr#">
			</cfif>

			<!--- add each nested-element (indented) by using recursive call --->
			<cfloop index="i" from="1" to="#arrayLen(xml.xmlChildren)#">
				<cfset result = "#result##tab##replaceNoCase(trim(indent(xml.xmlChildren[i])), cr, "#cr##tab#", "ALL")##cr#">
			</cfloop>

			<cfset result = "#result#</#xml.xmlName#>">	<!--- close element --->
		<cfelse>
			<cfset result = "#result# />">	<!--- close empty element --->
		</cfif>

		<cfreturn result>
	</cffunction>

	<cffunction name="saveToFile" access="public" output="false" returntype="void">
		<cfargument name="filePath" type="string" required="no" default="">

		<!--- define local function variables --->
		<cfset var output  = '<?xml version="1.0" encoding="utf-8"?>' & getLineSeparator() & indent(getDocument())>

		<!--- if a file path is provided and it exists, then we want to save our XML to a new location --->
		<cfif len(trim(arguments.filePath))>
			<cffile action="write" file="#arguments.filePath#" output="#output#">
		<cfelseif len(trim(getFilePath))>
			<!--- otherwise we simply want to overwrite the current file we provided at initialization --->
			<cffile action="write" file="#getFilePath()#" output="#output#">
		<cfelse>
			<cfthrow detail="saveToFile requires a file path to save your XML document">
		</cfif>
	</cffunction>

</cfcomponent>