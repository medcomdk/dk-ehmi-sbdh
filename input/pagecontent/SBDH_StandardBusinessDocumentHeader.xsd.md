# SBDH Original StandardBusinessDocumentHeader

	<?xml version="1.0"?>
	<xs:schema targetNamespace="http://www.unece.org/cefact/namespaces/StandardBusinessDocumentHeader" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns="http://www.unece.org/cefact/namespaces/StandardBusinessDocumentHeader" xmlns:bc="http://peppol.eu/xsd/ticc/envelope/1.0" elementFormDefault="qualified" attributeFormDefault="unqualified">
		<xs:include schemaLocation="DocumentIdentification.xsd"/>
		<xs:include schemaLocation="Partner.xsd"/>
		<xs:include schemaLocation="Manifest.xsd"/>
		<xs:include schemaLocation="BusinessScope.xsd"/>
		<xs:import schemaLocation="EHMI-EDN-Business-Message-Envelope-1.2.xsd" namespace="http://peppol.eu/xsd/ticc/envelope/1.0"/>
		<xs:complexType name="StandardBusinessDocumentHeader">
			<xs:sequence>
				<xs:element name="HeaderVersion" type="xs:string"/>
				<xs:element name="Sender" type="Partner" maxOccurs="unbounded"/>
				<xs:element name="Receiver" type="Partner" maxOccurs="unbounded"/>
				<xs:element name="DocumentIdentification" type="DocumentIdentification"/>
				<xs:element name="Manifest" type="Manifest" minOccurs="0" maxOccurs="1"/>
				<xs:element name="BusinessScope" type="BusinessScope" minOccurs="0"/>
			</xs:sequence>
		</xs:complexType>
		<xs:element name="StandardBusinessDocumentHeader" type="StandardBusinessDocumentHeader"/>
		<xs:element name="StandardBusinessDocument" type="StandardBusinessDocument"/>
		<xs:complexType name="StandardBusinessDocument">
			<xs:sequence>
				<xs:element ref="StandardBusinessDocumentHeader" minOccurs="1" maxOccurs="1"/>
				<xs:element name="BinaryContent" type="bc:BinaryContentType" minOccurs="1" maxOccurs="2"/>
			</xs:sequence>
		</xs:complexType>
	</xs:schema>
