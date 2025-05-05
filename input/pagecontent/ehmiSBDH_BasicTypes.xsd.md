# Sbdhprofile of BasicTypes

Please note that this xsd is only included for compliance reasons, it is not used as part of the ehmiSBDH due to the cardinaliy of the elements in ehmiSBDH.

<a href="./ehmiSBDH/BasicTypes.xsd" target="_blank">Link to the raw xsd (opens in a new window)</a>

    <?xml version="1.0"?>
    <xs:schema xmlns:xs="http://www.w3.org/2001/XMLSchema"
        targetNamespace="http://www.unece.org/cefact/namespaces/StandardBusinessDocumentHeader"
        xmlns="http://www.unece.org/cefact/namespaces/StandardBusinessDocumentHeader"
        elementFormDefault="qualified" attributeFormDefault="unqualified">

      <xs:simpleType name="MimeTypeQualifier">
        <xs:annotation>
          <xs:documentation>The MIME type as defined by IANA. Please refer to
                http://www.iana.org/assignments/media-types/ for a list of types.
          </xs:documentation>
        </xs:annotation>
        <xs:restriction base="xs:string"/>
      </xs:simpleType>

      <xs:simpleType name="Language">
        <xs:annotation>
          <xs:documentation>ISO 639-2; 1998 representation of Language name. Refer to http://www.loc.gov/standards/iso639-2/iso639jac.html to get the latest version of the standard.
          </xs:documentation>
        </xs:annotation>
        <xs:restriction base="xs:string"/>
      </xs:simpleType>
    </xs:schema>
