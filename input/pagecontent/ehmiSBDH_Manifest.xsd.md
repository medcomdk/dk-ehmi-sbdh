# Sbdhprofile of Manifest

Please note that this xsd is only included for compliance reasons, it is not used as part of the ehmiSBDH due to the cardinaliy of the elements in ehmiSBDH.

<a href="./ehmiSBDH/Manifest.xsd" target="_blank">Link to the raw xsd (opens in a new window)</a>

    <?xml version="1.0"?>
    <xs:schema xmlns:xs="http://www.w3.org/2001/XMLSchema"
        targetNamespace="http://www.unece.org/cefact/namespaces/StandardBusinessDocumentHeader"
        xmlns="http://www.unece.org/cefact/namespaces/StandardBusinessDocumentHeader"
        elementFormDefault="qualified" attributeFormDefault="unqualified">
      <xs:include schemaLocation="BasicTypes.xsd"/>

      <xs:complexType name="Manifest">
        <xs:sequence>
          <xs:element name="NumberOfItems" type="xs:integer"/>
          <xs:element name="ManifestItem" type="ManifestItem" maxOccurs="unbounded"/>
        </xs:sequence>
      </xs:complexType>
      <xs:complexType name="ManifestItem">
        <xs:sequence>
          <xs:element name="MimeTypeQualifierCode" type="MimeTypeQualifier"/>
          <xs:element name="UniformResourceIdentifier" type="xs:anyURI"/>
          <xs:element name="Description" type="xs:string" minOccurs="0"/>
          <xs:element name="LanguageCode" type="Language" minOccurs="0"/>
        </xs:sequence>
      </xs:complexType>
    </xs:schema>
