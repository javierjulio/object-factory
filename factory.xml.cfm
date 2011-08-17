<?xml version="1.0" encoding="utf-8"?>
<beans>

	<bean id="cache" class="javierjulio.test.library.Cache" singleton="true">
		<argument name="timeout" value="5" />
	</bean>

	<bean id="collection" class="javierjulio.test.library.Collection" singleton="false" />

	<bean id="datasource" class="javierjulio.test.library.Datasource" singleton="true">
		<argument name="name" value="myDSN" />
		<argument name="username" value="" />
		<argument name="password" value="" />
		<argument name="type" value="mssql" />
	</bean>

	<bean id="xmlEditor" class="javierjulio.test.library.XmlEditor" singleton="false">
		<argument name="rootName" value="pond" />
	</bean>

	<bean id="element" class="javierjulio.test.library.test.element" singleton="false">
		<argument name="name" value="myElement" />
	</bean>

	<bean id="elementCollection" class="javierjulio.test.library.test.elementCollection" singleton="false">
		<argument name="container">
			<array>
				<ref bean="element">
					<argument name="name" value="element1" />
				</ref>
				<ref bean="element">
					<argument name="name" value="element2" />
				</ref>
				<ref bean="element">
					<argument name="name" value="element3" />
				</ref>
			</array>
		</argument>
	</bean>

	<bean id="user" class="javierjulio.test.library.test.user" singleton="false">
		<argument name="datasource">
			<ref bean="datasource" />
		</argument>
		<argument name="id" value="1" />
		<argument name="createdBy">
			<ref bean="user">
				<argument name="datasource">
					<ref bean="datasource" />
				</argument>
				<argument name="id" value="2" />
			</ref>
		</argument>
		<argument name="updatedBy">
			<ref bean="user">
				<argument name="datasource">
					<ref bean="datasource" />
				</argument>
				<argument name="id" value="3" />
			</ref>
		</argument>
	</bean>

	<bean id="userGateway" factory="reactorFactory" method="createGateway" singleton="true">
		<argument name="objectAlias" value="user" />
		<argument name="datasource">
			<ref bean="datasource" />
		</argument>
	</bean>

	<bean id="reactorFactory" class="javierjulio.test.library.test.reactorFactory" singleton="true">
		<argument name="configuration" value="this is the reactor factory" />
	</bean>

<!--
	<bean id="dumpArguments" class="javierjulio.test.library.test.dumpArguments" singleton="true">
		<argument name="filename" value="framework" />
		<argument name="runTest" value="true" />
		<argument name="routes">
			<array>
				<struct>
					<element key="pattern" value="blog/entry/:year/:month/:day" />
					<element key="controller" value="blog" />
					<element key="action" value="entry" />
				</struct>
				<struct>
					<element key="pattern" value=":controller/:action/:id" />
				</struct>
			</array>
		</argument>
		<argument name="complexity">
			<struct>
				<element key="array_1_">
					<array>
						<element value="array_1_Value_array_1_1" />
						<element value="array_1_Value_array_1_2" />
						<value>array_1_Value_array_1_3</value>
						<value>array_1_Value_array_1_4</value>
					</array>
				</element>
				<element key="array_2_">
					<array>
						<struct>
							<element key="array_2_Key_Struct_1_1" value="array_2_Value_Struct_1_1" />
							<element key="array_2_Key_Struct_1_2">
								<value>array_2_Value_Struct_1_2</value>
							</element>
							<element key="array_2_Key_Struct_1_3" value="array_2_Value_Struct_1_3" />
						</struct>
						<struct>
							<element key="array_2_Key_Struct_2_1" value="array_2_Value_Struct_2_1" />
							<element key="array_2_Key_Struct_2_2" value="array_2_Value_Struct_2_2" />
							<element key="array_2_Key_Struct_2_3" value="array_2_Value_Struct_2_3" />
						</struct>
					</array>
				</element>
			</struct>
		</argument>
	</bean>
-->
</beans>