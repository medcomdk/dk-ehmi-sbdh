# ehmiSbdhprofile of ehmiSbdhBinaryContentType

<a href="./ehmiSBDH/ehmiSBDH/ehmiEDN-Business-Message-Envelope-1.2.xsd" target="_blank">Link to the raw xsd (opens in a new window)</a>

    <?xml version="1.0" encoding="UTF-8"?>
    <xs:schema xmlns="http://peppol.eu/xsd/ticc/envelope/1.0"
      xmlns:xs="http://www.w3.org/2001/XMLSchema"
      targetNamespace="http://peppol.eu/xsd/ticc/envelope/1.0"
      elementFormDefault="qualified"
      attributeFormDefault="unqualified">
      <xs:element name="BinaryContent" type="BinaryContentType"/>
      <xs:complexType name="BinaryContentType">
        <xs:simpleContent>
          <xs:extension base="xs:base64Binary">
            <xs:attribute name="mimeType" use="required">
              <xs:simpleType>
                <xs:restriction base="xs:string">
                  <xs:enumeration value="application/fhir+json"/>
                  <xs:enumeration value="application/fhir+xml"/>
                </xs:restriction>
              </xs:simpleType>
            </xs:attribute>
      a     <xs:attribute name="encoding">
              <xs:simpleType>
                <xs:restriction base="xs:string">
                  <xs:enumeration value="UTF-8"/>
                  <xs:enumeration value="ISO-8859-1"/>
                </xs:restriction>
              </xs:simpleType>
            </xs:attribute>
          </xs:extension>
        </xs:simpleContent>
      </xs:complexType>
    </xs:schema>
