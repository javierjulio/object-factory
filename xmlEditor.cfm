<cfset xmlEditor = createObject("component", "XmlEditor").init("", "pond")>

<cfdump var="#xmlEditor.getDocument()#">

<div>There were two frogs</div>
<!--- we had two frogs--->
<cfset xmlEditor.appendChild("//pond", "frog")>
<cfset xmlEditor.appendChild("//pond", "frog")>
<cfdump var="#xmlEditor.getDocument()#">

<div>They had names</div>
<!--- they had names--->
<cfset xmlEditor.setAttribute("//frog[1]", "name", "justin")>
<cfset xmlEditor.setAttribute("//frog[2]", "name", "jenny")>
<cfdump var="#xmlEditor.getDocument()#">

<div>They got Busy and had a few kids</div>
<div>They named their first kid after his father</div>
<!--- they got busy and had a few kids--->
<cfset xmlEditor.appendChild("//frog[@name='jenny']", "tadpole")>
<!--- they named their first kid after his father--->
<cfset xmlEditor.setAttribute("//tadpole", "name", "justin jr.")>
<cfset xmlEditor.appendChild("//frog[@name='jenny']", "tadpole")>
<cfset xmlEditor.appendChild("//frog[@name='jenny']", "tadpole")>
<cfset xmlEditor.appendChild("//frog[@name='jenny']", "tadpole")>
<cfdump var="#xmlEditor.getDocument()#">

<div>They named their other kids later</div>
<!--- they decided to name their other offspring later--->
<cfset xmlEditor.setAttribute("//tadpole[2]", "name", "tommy")>
<cfset xmlEditor.setAttribute("//tadpole[3]", "name", "betty jo")>
<cfset xmlEditor.setAttribute("//tadpole[4]", "name", "nemo")>
<cfdump var="#xmlEditor.getDocument()#">

<div>They cloned each one of their 4 children</div>
<!--- they decided to name their other offspring later--->
<cfset xmlEditor.clone("//frog/tadpole", "//frog")>
<cfdump var="#xmlEditor.getDocument()#">

<div>Nemo died (the original)</div>
<!--- or <cfset xmlEditor.removeNode("//tadpole[4]")> --->
<cfset xmlEditor.removeChild("//frog", 4)>
<cfdump var="#xmlEditor.getDocument()#">

<div>A terrible day came where all the tadpoles were eaten while Jenny was at the supermarket</div>
<!--- or <cfset xmlEditor.removeNodes("//frog[2]/tadpole")> --->
<cfset xmlEditor.removeChildren("//frog")>
<cfdump var="#xmlEditor.getDocument()#">

<div>Jenny never got over the loss of her kids and Croaked</div>
<!--- or <cfset xmlEditor.removeNode("//frog[2]")> --->
<cfset xmlEditor.removeChild("//pond", 2)>
<cfdump var="#xmlEditor.getDocument()#">

<cfset xmlEditor.addComment("//pond[1]", "this is the root comment")>
<cfset xmlEditor.addComment("//frog[1]", "this is the first comment")>

<cfset xmlEditor.saveToFile(expandPath("xmlEditor.xml"))>