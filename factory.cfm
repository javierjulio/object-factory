<cfset factory = createObject("component", "factory").init(expandPath(".\factory.xml.cfm"))>

<cfset user = factory.getObject("user")>

<cfoutput>
#user.getId()#<br />
#user.setId(9)#
#user.getId()#<br />
createdBy<br />
#user.getCreatedBy().getId()#<br />
#user.getCreatedBy().setId(1)#
#user.getCreatedBy().getId()#<br />
updatedBy<br />
#user.getUpdatedBy().getId()#<br /><br /><br />

<cfset elementCollection = factory.getObject("elementCollection")>
#factory.getObject("element").getName()#<br />

<cfset elementCollection.first().setName("test")>
<cfset elementCollection.setCurrentIndex(0)>
<cfloop condition="elementCollection.hasNext()">
	<cfset elementCollection.next()>
	#elementCollection.current().getName()#<br />
</cfloop>

#factory.getObject("element").getName()#<br /><br />
</cfoutput>

<cfset userGateway = factory.getObject("userGateway")>
<cfdump var="#userGateway#">

<cfset cache = factory.getObject("cache")>
<cfset cache.set("name", "Javier Julio")>
<cfdump var="#cache.get("name")#"><br />

<cfset xmlEditor = factory.getObject("xmlEditor")>
<cfset xmlEditor.setAttribute("//pond", "attribute", "value")>
<cfdump var="#xmlEditor.getDocument()#">

<cfset datasource = factory.getObject("datasource")>
<cfdump var="#datasource.getName()#"><br />

<cfdump var="#factory.getObject("cache").get("name")#"><br />

<cfset xmlEditor = factory.getObject("xmlEditor")>
<cfdump var="#xmlEditor.getDocument()#"><br />

<cfset collection = factory.getObject("collection")>
<cfset collection.add("object1")>
<cfset collection.add("object2")>
<cfset collection.add("object3")>

<cfset collection.removeAt(2)>

<cfdump var="#collection.getAll()#" label="collection container">
<cfdump var="#collection.getTrash()#" label="collection trash">