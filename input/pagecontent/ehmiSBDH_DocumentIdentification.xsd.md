    <?xml version="1.0"?>
    <xs:schema xmlns:xs="http://www.w3.org/2001/XMLSchema"
        targetNamespace="http://www.unece.org/cefact/namespaces/StandardBusinessDocumentHeader"
        xmlns="http://www.unece.org/cefact/namespaces/StandardBusinessDocumentHeader"
        elementFormDefault="qualified" attributeFormDefault="unqualified">

      <xs:complexType name="DocumentIdentification">
        <xs:sequence>
          <xs:element name="Standard" type="xs:string"/>
          <xs:element name="TypeVersion" type="xs:string"/>
          <xs:element name="InstanceIdentifier" type="xs:string"/>
          <xs:element name="Type" type="xs:string"/>
          <xs:element name="MultipleType" type="xs:boolean" minOccurs="0"/>
          <xs:element name="CreationDateAndTime" type="xs:dateTime"/>
        </xs:sequence>
      </xs:complexType>
    </xs:schema>

