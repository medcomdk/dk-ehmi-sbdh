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
            <xs:attribute name="mimeType" type="xs:token" use="required"/>
            <!--xs:attribute name="encoding" type="xs:token" use="required"/-->
            <xs:attribute name="encoding">
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
      <xs:element name="TextContent" type="TextContentType"/>
      <xs:complexType name="TextContentType">
        <xs:simpleContent>
          <xs:extension base="xs:string">
            <xs:attribute name="mimeType" type="xs:token" use="required"/>
          </xs:extension>
        </xs:simpleContent>
      </xs:complexType>
    </xs:schema>
