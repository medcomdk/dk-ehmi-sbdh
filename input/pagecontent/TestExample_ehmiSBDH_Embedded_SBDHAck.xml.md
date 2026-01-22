# Test example of an EHMI SBDH Acknowledgement 

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
                <Identifier Authority="iso6523-actorid-upis">0088:5790000127092</Identifier>
            </Sender>
            <Receiver>
                <Identifier Authority="iso6523-actorid-upis">0088:5790000123117</Identifier>
            </Receiver>
            <DocumentIdentification>
                <Standard>ehmisbdh-acknowledgement</Standard>
                <TypeVersion>ebbp-signals-2.0</TypeVersion>
                <InstanceIdentifier>b8549456-962f-459c-a341-f05cf22e3935</InstanceIdentifier>
                <Type>SBDHReceiptAcknowledgement</Type>
                <MultipleType>false</MultipleType>
                <CreationDateAndTime>2025-12-11T13:24:10+02:00</CreationDateAndTime>
            </DocumentIdentification>
            <BusinessScope>
                <Scope>
                    <Type>DOCUMENTID</Type>
                    <InstanceIdentifier>urn:dk:healthcare:messaging:oasis:ebxml:schema:xsd::ehmisbdh-acknowledgement##urn:dk:ehmi:sbdh:ehmisbdh-acknowledgement::1.0</InstanceIdentifier>
                    <Identifier>dk-medcom-messaging</Identifier>
                </Scope>
                <Scope>
                    <Type>PROCESSID</Type>
                    <InstanceIdentifier>urn:ehmi:sdn-emergence</InstanceIdentifier>
                    <Identifier>dk-medcom-messaging</Identifier>
                </Scope>
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
                    <InstanceIdentifier>401cbc36-db1e-4fe0-bf90-6df331dde179</InstanceIdentifier>
                    <Identifier>dk-medcom-messaging</Identifier>
                </Scope>
                <Scope>
                    <Type>ORIGINALMESSAGEIDENTIFIER</Type>
                    <InstanceIdentifier>489de4f2-0d8d-4de2-a7ce-ccb93568799f</InstanceIdentifier>
                    <Identifier>dk-medcom-messaging</Identifier>
                </Scope>
                <Scope>
                    <Type>ORIGINALMESSAGEENVELOPEIDENTIFIER</Type>
                    <InstanceIdentifier>401cbc36-db1e-4fe0-bf90-6df331dde179</InstanceIdentifier>
                    <Identifier>dk-medcom-messaging</Identifier>
                </Scope>
                <Scope>
                    <Type>ORIGINALMESSAGESTANDARD</Type>
                    <InstanceIdentifier>homecareobservation-message</InstanceIdentifier>
                    <Identifier>dk-medcom-messaging</Identifier>
                </Scope>
                <Scope>
                    <Type>ORIGINALMESSAGEVERSION</Type>
                    <InstanceIdentifier>1.1</InstanceIdentifier>
                    <Identifier>dk-medcom-messaging</Identifier>
                </Scope>
                <Scope>
                    <Type>ORIGINALENVELOPEIDENTIFIER</Type>
                    <InstanceIdentifier>401cbc36-db1e-4fe0-bf90-6df331dde179</InstanceIdentifier>
                    <Identifier>dk-medcom-messaging</Identifier>
                </Scope>            
                <Scope>
                    <Type>StatisticalInformation</Type>
                    <InstanceIdentifier>EHMI-ReceiptAcknowledgement</InstanceIdentifier>
                    <Identifier>dk-medcom-messaging</Identifier>
                </Scope>
                <Scope>
                    <Type>EHMI-ReceiptAcknowledgement</Type>
                    <InstanceIdentifier>Response</InstanceIdentifier>
                    <Identifier>dk-medcom-messaging</Identifier>
                    <CorrelationInformation>
                        <RequestingDocumentCreationDateTime>2025-12-11T12:24:10+02:00</RequestingDocumentCreationDateTime>
                        <RequestingDocumentInstanceIdentifier>401cbc36-db1e-4fe0-bf90-6df331dde179</RequestingDocumentInstanceIdentifier>
                    </CorrelationInformation>
                    <BusinessService>
                        <BusinessServiceName>EHMI-ReceiptAcknowledgement-Response</BusinessServiceName>
                        <ServiceTransaction TypeOfServiceTransaction="RespondingServiceTransaction" IsNonRepudiationRequired="false" IsAuthenticationRequired="false" IsNonRepudiationOfReceiptRequired="false" IsIntelligibleCheckRequired="false"
                                            IsApplicationErrorResponseRequested="false" TimeToAcknowledgeReceipt="0" TimeToAcknowledgeAcceptance="0" TimeToPerform="0" Recurrence="0"/>
                    </BusinessService>
                </Scope>
            </BusinessScope>
        </StandardBusinessDocumentHeader>
        <BinaryContent mimeType="application/xml" encoding="UTF-8">
            PGJwc3NpZ25hbDpSZWNlaXB0QWNrbm93bGVkZ2VtZW50IHhtbG5zOmRzPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwLzA5L3htbGRzaWcjIiB4bWxuczp4bGluaz0iaHR0cDovL3d3dy53My5vcmcvMTk5OS94bGluayIgeG1sbnM6YnBzc2lnbmFsPSJodHRwOi8vZG9jcy5vYXNpcy1vcGVuLm9yZy9lYnhtbC1icC9lYmJwLXNpZ25hbHMtMi4wIiB4bWxuczp4c2k9Imh0dHA6Ly93d3cudzMub3JnLzIwMDEvWE1MU2NoZW1hLWluc3RhbmNlIiB4c2k6c2NoZW1hTG9jYXRpb249Imh0dHA6Ly9kb2NzLm9hc2lzLW9wZW4ub3JnL2VieG1sLWJwL2ViYnAtc2lnbmFscy0yLjAgaHR0cDovL2RvY3Mub2FzaXMtb3Blbi5vcmcvZWJ4bWwtYnAvMi4wLjQvZWJicC1zaWduYWxzLTIuMC40LnhzZCI+CiAgICA8YnBzc2lnbmFsOk9yaWdpbmFsTWVzc2FnZUlkZW50aWZpZXI+NDAxY2JjMzYtZGIxZS00ZmUwLWJmOTAtNmRmMzMxZGRlMTc5PC9icHNzaWduYWw6T3JpZ2luYWxNZXNzYWdlSWRlbnRpZmllcj4KICAgIDxicHNzaWduYWw6T3JpZ2luYWxEb2N1bWVudElkZW50aWZpZXI+dXJuOmRrOmhlYWx0aGNhcmU6bWVkY29tOm1lc3NhZ2luZzpmaGlyOnN0cnVjdHVyZWRlZmluaXRpb246aG9tZWNhcmVvYnNlcnZhdGlvbi1tZXNzYWdlOjEuMTwvYnBzc2lnbmFsOk9yaWdpbmFsRG9jdW1lbnRJZGVudGlmaWVyPgogICAgPGJwc3NpZ25hbDpPcmlnaW5hbE1lc3NhZ2VEYXRlVGltZT4yMDI1LTEyLTExVDEyOjI0OjEwKzAyOjAwPC9icHNzaWduYWw6T3JpZ2luYWxNZXNzYWdlRGF0ZVRpbWU+CiAgICA8YnBzc2lnbmFsOlRoaXNNZXNzYWdlRGF0ZVRpbWU+MjAyNS0xMi0xMVQxMzoyNDoxMCswMjowMDwvYnBzc2lnbmFsOlRoaXNNZXNzYWdlRGF0ZVRpbWU+CiAgICA8YnBzc2lnbmFsOkZyb21QYXJ0eUluZm8gdHlwZT0iaXNvNjUyMy1hY3RvcmlkLXVwaXMiPjAwODg6NTc5MDAwMDEyNzA5MjwvYnBzc2lnbmFsOkZyb21QYXJ0eUluZm8+CiAgICA8YnBzc2lnbmFsOlRvUGFydHlJbmZvIHR5cGU9ImlzbzY1MjMtYWN0b3JpZC11cGlzIj4wMDg4OjU3OTAwMDAxMjMxMTc8L2Jwc3NpZ25hbDpUb1BhcnR5SW5mbz4KPC9icHNzaWduYWw6UmVjZWlwdEFja25vd2xlZGdlbWVudD4=
        </BinaryContent>
    </StandardBusinessDocument>