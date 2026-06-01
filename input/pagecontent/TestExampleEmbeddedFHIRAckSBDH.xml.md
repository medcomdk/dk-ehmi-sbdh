# Test example of an ehmiSBDH with an embedded FHIR Acknowledgement

[Link to the embedded file](TestExample_ehmiMessage_FHIRAck.json.html)

    <?xml version="1.0" encoding="UTF-8" standalone="yes"?>
    <StandardBusinessDocument xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                              xmlns="http://www.unece.org/cefact/namespaces/StandardBusinessDocumentHeader"
                              xmlns:ns6="http://www.ean-ucc.org/schemas/1.3/eanucc"
                              xmlns:bc="http://peppol.eu/xsd/ticc/envelope/1.0"
                              xmlns:sbdh="http://www.unece.org/cefact/namespaces/StandardBusinessDocumentHeader"
                              xmlns:ns2="http://docs.oasis-open.org/ebxml-bp/ebbp-signals-2.0"
                              xmlns:ns4="http://www.w3.org/2000/09/xmldsig#" xmlns:ns3="http://www.w3.org/1999/xlink">
        <StandardBusinessDocumentHeader>
            <HeaderVersion>1.0</HeaderVersion>
            <Sender>
                <Identifier Authority="iso6523-actorid-upis">0088:5790000201389</Identifier>
            </Sender>
            <Receiver>
                <Identifier Authority="iso6523-actorid-upis">0088:5790000121526</Identifier>
            </Receiver>
            <DocumentIdentification>
                <Standard>acknowledgement-message</Standard>
                <TypeVersion>2.0</TypeVersion>
                <InstanceIdentifier>b5e774e0-828d-475c-944f-8648f68d860b</InstanceIdentifier>
                <Type>Bundle</Type>
                <MultipleType>false</MultipleType>
                <CreationDateAndTime>2025-04-01T16:20:00+01:00</CreationDateAndTime>
            </DocumentIdentification>
            <BusinessScope>
                <!-- eDelivery scope -->
                <Scope>
                    <Type>DOCUMENTID</Type>
                    <InstanceIdentifier>urn:dk:healthcare:medcom:messaging:fhir:structuredefinition:acknowledgement-message:2.0</InstanceIdentifier>
                    <Identifier>dk-medcom-messaging</Identifier>
                </Scope>
                <Scope>
                    <Type>PROCESSID</Type>
                    <InstanceIdentifier>sdn-emergence</InstanceIdentifier>
                    <Identifier>dk-medcom-messaging</Identifier>
                </Scope>
                <!-- MedCom messaging scope -->
                <Scope>
                    <Type>SENDERID</Type>
                    <InstanceIdentifier>52581000016005</InstanceIdentifier>
                    <Identifier>dk-medcom-messaging</Identifier>
                </Scope>
                <Scope>
                    <Type>RECEIVERID</Type>
                    <InstanceIdentifier>1144561000016002</InstanceIdentifier>
                    <Identifier>dk-medcom-messaging</Identifier>
                </Scope>
                <Scope>
                    <Type>MESSAGEIDENTIFIER</Type>
                    <InstanceIdentifier>aba2d9bf-2c6c-47e8-bce4-7928bcd51019</InstanceIdentifier>
                    <Identifier>dk-medcom-messaging</Identifier>
                </Scope>
                <Scope>
                    <Type>MESSAGEENVELOPEIDENTIFIER</Type>
                    <InstanceIdentifier>9597e34d-f90f-439d-bc79-ca7d91944d8b</InstanceIdentifier>
                    <Identifier>dk-medcom-messaging</Identifier>
                </Scope>            
                <Scope>
                    <Type>StatisticalInformation</Type>
                    <InstanceIdentifier>MCM:acknowledgement-message</InstanceIdentifier>
                    <Identifier>dk-medcom-messaging</Identifier>
                </Scope>
                <!-- MedCom messaging - Acknowledgment scope -->
                <Scope>
                    <Type>EHMI-ReceiptAcknowledgement</Type>
                    <InstanceIdentifier>Response</InstanceIdentifier>
                    <Identifier>dk-medcom-messaging</Identifier>
                    <CorrelationInformation>
                        <RequestingDocumentCreationDateTime>2025-04-01T16:19:00+01:00</RequestingDocumentCreationDateTime>
                        <RequestingDocumentInstanceIdentifier>9a6ff822-08de-5a6f-9670-9fa4b9d2f0dc</RequestingDocumentInstanceIdentifier>
                    </CorrelationInformation>
                    <BusinessService>
                        <BusinessServiceName>EHMI-ReceiptAcknowledgement-Response</BusinessServiceName>
                        <ServiceTransaction TypeOfServiceTransaction="RespondingServiceTransaction" IsNonRepudiationRequired="false" IsAuthenticationRequired="false" IsNonRepudiationOfReceiptRequired="false" IsIntelligibleCheckRequired="false"
                                            IsApplicationErrorResponseRequested="false" TimeToAcknowledgeReceipt="0" TimeToAcknowledgeAcceptance="0" TimeToPerform="0" Recurrence="0"/>
                    </BusinessService>
                </Scope>
            </BusinessScope>
        </StandardBusinessDocumentHeader>
        <BinaryContent mimeType="application/fhir+json" encoding="UTF-8">
            ewogICJyZXNvdXJjZVR5cGUiIDogIkJ1bmRsZSIsCiAgImlkIiA6ICI5NTk3ZTM0ZC1mOTBmLTQzOWQtYmM3OS1jYTdkOTE5NDRkOGIiLAogICJtZXRhIiA6IHsKICAgICJwcm9maWxlIiA6IFsiaHR0cDovL21lZGNvbWZoaXIuZGsvaWcvYWNrbm93bGVkZ2VtZW50L1N0cnVjdHVyZURlZmluaXRpb24vbWVkY29tLW1lc3NhZ2luZy1hY2tub3dsZWRnZW1lbnQiXQogIH0sCiAgInR5cGUiIDogIm1lc3NhZ2UiLAogICJ0aW1lc3RhbXAiIDogIjIwMjMtMDktMTNUMTI6MjU6MDArMDI6MDAiLAogICJlbnRyeSIgOiBbewogICAgImZ1bGxVcmwiIDogIk1lc3NhZ2VIZWFkZXIvYWJhMmQ5YmYtMmM2Yy00N2U4LWJjZTQtNzkyOGJjZDUxMDE5IiwKICAgICJyZXNvdXJjZSIgOiB7CiAgICAgICJyZXNvdXJjZVR5cGUiIDogIk1lc3NhZ2VIZWFkZXIiLAogICAgICAiaWQiIDogImFiYTJkOWJmLTJjNmMtNDdlOC1iY2U0LTc5MjhiY2Q1MTAxOSIsCiAgICAgICJtZXRhIiA6IHsKICAgICAgICAicHJvZmlsZSIgOiBbImh0dHA6Ly9tZWRjb21maGlyLmRrL2lnL2Fja25vd2xlZGdlbWVudC9TdHJ1Y3R1cmVEZWZpbml0aW9uL21lZGNvbS1tZXNzYWdpbmctYWNrbm93bGVkZ2VtZW50SGVhZGVyIl0KICAgICAgfSwKICAgICAgInRleHQiIDogewogICAgICAgICJzdGF0dXMiIDogImdlbmVyYXRlZCIsCiAgICAgICAgImRpdiIgOiAiPGRpdiB4bWxucz1cImh0dHA6Ly93d3cudzMub3JnLzE5OTkveGh0bWxcIj5FbXB0eTwvZGl2PiIKICAgICAgfSwKICAgICAgImV2ZW50Q29kaW5nIiA6IHsKICAgICAgICAic3lzdGVtIiA6ICJodHRwOi8vbWVkY29tZmhpci5kay9pZy90ZXJtaW5vbG9neS9Db2RlU3lzdGVtL21lZGNvbS1tZXNzYWdpbmctZXZlbnRDb2RlcyIsCiAgICAgICAgImNvZGUiIDogImFja25vd2xlZGdlbWVudC1tZXNzYWdlIgogICAgICB9LAogICAgICAiZGVzdGluYXRpb24iIDogW3sKICAgICAgICAiZXh0ZW5zaW9uIiA6IFt7CiAgICAgICAgICAidXJsIiA6ICJodHRwOi8vbWVkY29tZmhpci5kay9pZy9tZXNzYWdpbmcvU3RydWN0dXJlRGVmaW5pdGlvbi9tZWRjb20tbWVzc2FnaW5nLWRlc3RpbmF0aW9uVXNlRXh0ZW5zaW9uIiwKICAgICAgICAgICJ2YWx1ZUNvZGluZyIgOiB7CiAgICAgICAgICAgICJzeXN0ZW0iIDogImh0dHA6Ly9tZWRjb21maGlyLmRrL2lnL3Rlcm1pbm9sb2d5L0NvZGVTeXN0ZW0vbWVkY29tLW1lc3NhZ2luZy1kZXN0aW5hdGlvblVzZSIsCiAgICAgICAgICAgICJjb2RlIiA6ICJwcmltYXJ5IgogICAgICAgICAgfQogICAgICAgIH1dLAogICAgICAgICJlbmRwb2ludCIgOiAiaHR0cHM6Ly9zb3IyLnN1bS5kc2RuLmRrLyNpZD0xMTQ0NTYxMDAwMDE2MDAyIiwKICAgICAgICAicmVjZWl2ZXIiIDogewogICAgICAgICAgInJlZmVyZW5jZSIgOiAiT3JnYW5pemF0aW9uL2VmNWNiOWE2LTgzNWYtNGQxOC1hMzRlLTE3OWM1NzhiOWEyYSIKICAgICAgICB9CiAgICAgIH1dLAogICAgICAic2VuZGVyIiA6IHsKICAgICAgICAicmVmZXJlbmNlIiA6ICJPcmdhbml6YXRpb24vNDI1NDE0NDctYjU4Yy00YTFhLTk1MTQtMDJiODA0OTRiYmQzIgogICAgICB9LAogICAgICAic291cmNlIiA6IHsKICAgICAgICAiZW5kcG9pbnQiIDogImh0dHBzOi8vc29yMi5zdW0uZHNkbi5kay8jaWQ9NTI1ODEwMDAwMTYwMDUiCiAgICAgIH0sCiAgICAgICJyZXNwb25zZSIgOiB7CiAgICAgICAgImlkZW50aWZpZXIiIDogIjhkYmY2M2Y0LWI3ODQtNGQ0MC04ODAyLWMxYmRiMWVjZmE2MyIsCiAgICAgICAgImNvZGUiIDogIm9rIgogICAgICB9LAogICAgICAiZGVmaW5pdGlvbiIgOiAiaHR0cDovL21lZGNvbWZoaXIuZGsvaWcvbWVzc2FnZWRlZmluaXRpb25zL01lc3NhZ2VEZWZpbml0aW9uL01lZENvbUFja25vd2xlZGdlbWVudE1lc3NhZ2VEZWZpbml0aW9ufDIuMCIKCiAgICB9CiAgfSwKICB7CiAgICAiZnVsbFVybCIgOiAiUHJvdmVuYW5jZS80YzI4NDkzNi01NDU0LTQxMTYtOTVmYy0zYzhlZWVlZDI0MDAiLAogICAgInJlc291cmNlIiA6IHsKICAgICAgInJlc291cmNlVHlwZSIgOiAiUHJvdmVuYW5jZSIsCiAgICAgICJpZCIgOiAiNGMyODQ5MzYtNTQ1NC00MTE2LTk1ZmMtM2M4ZWVlZWQyNDAwIiwKICAgICAgIm1ldGEiIDogewogICAgICAgICJwcm9maWxlIiA6IFsiaHR0cDovL21lZGNvbWZoaXIuZGsvaWcvbWVzc2FnaW5nL1N0cnVjdHVyZURlZmluaXRpb24vbWVkY29tLW1lc3NhZ2luZy1wcm92ZW5hbmNlIl0KICAgICAgfSwKICAgICAgInRleHQiIDogewogICAgICAgICJzdGF0dXMiIDogImdlbmVyYXRlZCIsCiAgICAgICAgImRpdiIgOiAiPGRpdiB4bWxucz1cImh0dHA6Ly93d3cudzMub3JnLzE5OTkveGh0bWxcIj5FbXB0eTwvZGl2PiIKICAgICAgfSwKICAgICAgInRhcmdldCIgOiBbewogICAgICAgICJyZWZlcmVuY2UiIDogIk1lc3NhZ2VIZWFkZXIvOGRiZjYzZjQtYjc4NC00ZDQwLTg4MDItYzFiZGIxZWNmYTYzIgogICAgICB9XSwKICAgICAgIm9jY3VycmVkRGF0ZVRpbWUiIDogIjIwMjMtMDktMTNUMTI6MjQ6MjArMDI6MDAiLAogICAgICAicmVjb3JkZWQiIDogIjIwMjMtMDktMTNUMTI6MjQ6MjArMDI6MDAiLAogICAgICAiYWN0aXZpdHkiIDogewogICAgICAgICJjb2RpbmciIDogW3sKICAgICAgICAgICJzeXN0ZW0iIDogImh0dHA6Ly9tZWRjb21maGlyLmRrL2lnL3Rlcm1pbm9sb2d5L0NvZGVTeXN0ZW0vbWVkY29tLW1lc3NhZ2luZy1hY3Rpdml0eUNvZGVzIiwKICAgICAgICAgICJjb2RlIiA6ICJuZXctbWVzc2FnZSIKICAgICAgICB9XQogICAgICB9LAogICAgICAiYWdlbnQiIDogW3sKICAgICAgICAid2hvIiA6IHsKICAgICAgICAgICJyZWZlcmVuY2UiIDogIk9yZ2FuaXphdGlvbi9lZjVjYjlhNi04MzVmLTRkMTgtYTM0ZS0xNzljNTc4YjlhMmEiCiAgICAgICAgfQogICAgICB9XQogICAgfQogIH0sCiAgewogICAgImZ1bGxVcmwiIDogIlByb3ZlbmFuY2UvNjlkYWIyNzctZGQ0Yi00MDU1LTlmZGEtYTEwYTY1Y2I0NDEyIiwKICAgICJyZXNvdXJjZSIgOiB7CiAgICAgICJyZXNvdXJjZVR5cGUiIDogIlByb3ZlbmFuY2UiLAogICAgICAiaWQiIDogIjY5ZGFiMjc3LWRkNGItNDA1NS05ZmRhLWExMGE2NWNiNDQxMiIsCiAgICAgICJtZXRhIiA6IHsKICAgICAgICAicHJvZmlsZSIgOiBbImh0dHA6Ly9tZWRjb21maGlyLmRrL2lnL21lc3NhZ2luZy9TdHJ1Y3R1cmVEZWZpbml0aW9uL21lZGNvbS1tZXNzYWdpbmctcHJvdmVuYW5jZSJdCiAgICAgIH0sCiAgICAgICJ0ZXh0IiA6IHsKICAgICAgICAic3RhdHVzIiA6ICJnZW5lcmF0ZWQiLAogICAgICAgICJkaXYiIDogIjxkaXYgeG1sbnM9XCJodHRwOi8vd3d3LnczLm9yZy8xOTk5L3hodG1sXCI+RW1wdHk8L2Rpdj4iCiAgICAgIH0sCiAgICAgICJ0YXJnZXQiIDogW3sKICAgICAgICAicmVmZXJlbmNlIiA6ICJNZXNzYWdlSGVhZGVyL2FiYTJkOWJmLTJjNmMtNDdlOC1iY2U0LTc5MjhiY2Q1MTAxOSIKICAgICAgfV0sCiAgICAgICJvY2N1cnJlZERhdGVUaW1lIiA6ICIyMDIzLTA5LTEzVDEyOjI1OjAwKzAyOjAwIiwKICAgICAgInJlY29yZGVkIiA6ICIyMDIzLTA5LTEzVDEyOjI1OjAwKzAyOjAwIiwKICAgICAgImFjdGl2aXR5IiA6IHsKICAgICAgICAiY29kaW5nIiA6IFt7CiAgICAgICAgICAic3lzdGVtIiA6ICJodHRwOi8vbWVkY29tZmhpci5kay9pZy90ZXJtaW5vbG9neS9Db2RlU3lzdGVtL21lZGNvbS1tZXNzYWdpbmctYWN0aXZpdHlDb2RlcyIsCiAgICAgICAgICAiY29kZSIgOiAiYWNrbm93bGVkZ2VtZW50IgogICAgICAgIH1dCiAgICAgIH0sCiAgICAgICJhZ2VudCIgOiBbewogICAgICAgICJ3aG8iIDogewogICAgICAgICAgInJlZmVyZW5jZSIgOiAiT3JnYW5pemF0aW9uLzQyNTQxNDQ3LWI1OGMtNGExYS05NTE0LTAyYjgwNDk0YmJkMyIKICAgICAgICB9CiAgICAgIH1dLAogICAgICAiZW50aXR5IiA6IFt7CiAgICAgICAgInJvbGUiIDogInJldmlzaW9uIiwKICAgICAgICAid2hhdCIgOiB7CiAgICAgICAgICAicmVmZXJlbmNlIiA6ICJNZXNzYWdlSGVhZGVyLzhkYmY2M2Y0LWI3ODQtNGQ0MC04ODAyLWMxYmRiMWVjZmE2MyIKICAgICAgICB9CiAgICAgIH1dCiAgICB9CiAgfSwKICB7CiAgICAiZnVsbFVybCIgOiAiT3JnYW5pemF0aW9uL2VmNWNiOWE2LTgzNWYtNGQxOC1hMzRlLTE3OWM1NzhiOWEyYSIsCiAgICAicmVzb3VyY2UiIDogewogICAgICAicmVzb3VyY2VUeXBlIiA6ICJPcmdhbml6YXRpb24iLAogICAgICAiaWQiIDogImVmNWNiOWE2LTgzNWYtNGQxOC1hMzRlLTE3OWM1NzhiOWEyYSIsCiAgICAgICJtZXRhIiA6IHsKICAgICAgICAicHJvZmlsZSIgOiBbImh0dHA6Ly9tZWRjb21maGlyLmRrL2lnL21lc3NhZ2luZy9TdHJ1Y3R1cmVEZWZpbml0aW9uL21lZGNvbS1tZXNzYWdpbmctb3JnYW5pemF0aW9uIl0KICAgICAgfSwKICAgICAgInRleHQiIDogewogICAgICAgICJzdGF0dXMiIDogImdlbmVyYXRlZCIsCiAgICAgICAgImRpdiIgOiAiPGRpdiB4bWxucz1cImh0dHA6Ly93d3cudzMub3JnLzE5OTkveGh0bWxcIj5FbXB0eTwvZGl2PiIKICAgICAgfSwKICAgICAgImlkZW50aWZpZXIiIDogW3sKICAgICAgICAic3lzdGVtIiA6ICJodHRwczovL3d3dy5nczEub3JnL2dsbiIsCiAgICAgICAgInZhbHVlIiA6ICI1NzkwMDAwMTIzMTE3IgogICAgICB9LAogICAgICB7CiAgICAgICAgInN5c3RlbSIgOiAidXJuOm9pZDoxLjIuMjA4LjE3Ni4xLjEiLAogICAgICAgICJ2YWx1ZSIgOiAiMTE0NDU2MTAwMDAxNjAwMiIKICAgICAgfV0sCiAgICAgICJuYW1lIiA6ICJTZW5kZXIgT3JnYW5pemF0aW9uIgogICAgfQogIH0sCiAgewogICAgImZ1bGxVcmwiIDogIk9yZ2FuaXphdGlvbi80MjU0MTQ0Ny1iNThjLTRhMWEtOTUxNC0wMmI4MDQ5NGJiZDMiLAogICAgInJlc291cmNlIiA6IHsKICAgICAgInJlc291cmNlVHlwZSIgOiAiT3JnYW5pemF0aW9uIiwKICAgICAgImlkIiA6ICI0MjU0MTQ0Ny1iNThjLTRhMWEtOTUxNC0wMmI4MDQ5NGJiZDMiLAogICAgICAibWV0YSIgOiB7CiAgICAgICAgInByb2ZpbGUiIDogWyJodHRwOi8vbWVkY29tZmhpci5kay9pZy9tZXNzYWdpbmcvU3RydWN0dXJlRGVmaW5pdGlvbi9tZWRjb20tbWVzc2FnaW5nLW9yZ2FuaXphdGlvbiJdCiAgICAgIH0sCiAgICAgICJ0ZXh0IiA6IHsKICAgICAgICAic3RhdHVzIiA6ICJnZW5lcmF0ZWQiLAogICAgICAgICJkaXYiIDogIjxkaXYgeG1sbnM9XCJodHRwOi8vd3d3LnczLm9yZy8xOTk5L3hodG1sXCI+RW1wdHk8L2Rpdj4iCiAgICAgIH0sCiAgICAgICJpZGVudGlmaWVyIiA6IFt7CiAgICAgICAgInN5c3RlbSIgOiAiaHR0cHM6Ly93d3cuZ3MxLm9yZy9nbG4iLAogICAgICAgICJ2YWx1ZSIgOiAiNTc5MDAwMDEyNzA5MiIKICAgICAgfSwKICAgICAgewogICAgICAgICJzeXN0ZW0iIDogInVybjpvaWQ6MS4yLjIwOC4xNzYuMS4xIiwKICAgICAgICAidmFsdWUiIDogIjUyNTgxMDAwMDE2MDA1IgogICAgICB9XSwKICAgICAgIm5hbWUiIDogIlJlY2VpdmVyIE9yZ2FuaXphdGlvbiIKICAgIH0KICB9XQp9
        </BinaryContent>
    </StandardBusinessDocument>