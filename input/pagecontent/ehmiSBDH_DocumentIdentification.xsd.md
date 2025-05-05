# ehmiSbdhprofile of ehmiSbdhDocumentIdentification

<a href="./ehmiSBDH/ehmiSBDH/ehmiDocumentIdentification.xsd" target="_blank">Link to the raw xsd (opens in a new window)</a>

    <?xml version="1.0"?>
    <xs:schema xmlns:xs="http://www.w3.org/2001/XMLSchema"
        targetNamespace="http://www.unece.org/cefact/namespaces/StandardBusinessDocumentHeader"
        xmlns="http://www.unece.org/cefact/namespaces/StandardBusinessDocumentHeader"
        elementFormDefault="qualified" attributeFormDefault="unqualified">

      <xs:complexType name="ehmiDocumentIdentification">
        <xs:sequence>
          <xs:element name="Standard" type="DocumentInformationStandardType"/>
          <xs:element name="TypeVersion" type="xs:string"/>
          <xs:element name="InstanceIdentifier" type="xs:string"/>
          <xs:element name="Type" type="xs:string" default="Bundle"/>
          <xs:element name="MultipleType" type="xs:boolean" minOccurs="0" fixed="false"/>
          <xs:element name="CreationDateAndTime" type="xs:dateTime"/>
        </xs:sequence>
      </xs:complexType>
      <xs:simpleType name="DocumentInformationStandardType">
        <xs:restriction base="xs:string">
          <xs:enumeration value="homecareobservation-message"/>
          <xs:enumeration value="acknowledgement-message"/>
          <xs:enumeration value="ebbp-signals"/>
        </xs:restriction>
      </xs:simpleType>
    </xs:schema>

