# Test example of an SBDH Acknowledgement with embedded ebbp-signals

[Link to the embedded file](TestExample_ehmiMessage_SBDHAck.xml_raw.html)

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
                <Standard>ehmisbdh-acknowledgement</Standard>
                <TypeVersion>ebbp-signals-2.0</TypeVersion>
                <InstanceIdentifier>c8792b06-eaa3-48db-a815-3e58b2086ab2</InstanceIdentifier>
                <Type>SBDHReceiptAcknowledgement</Type>
                <MultipleType>false</MultipleType>
                <CreationDateAndTime>2025-04-01T16:20:00+01:00</CreationDateAndTime>
            </DocumentIdentification>
            <BusinessScope>
                <!-- eDelivery scope -->
                <Scope>
                    <Type>DOCUMENTID</Type>
                    <InstanceIdentifier>urn:dk:healthcare:prod:messaging:oasis:ebxml:schema:xsd:SBDHReceiptAcknowledgement</InstanceIdentifier>
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
                    <InstanceIdentifier>c8792b06-eaa3-48db-a815-3e58b2086ab2</InstanceIdentifier>
                    <Identifier>dk-medcom-messaging</Identifier>
                </Scope>
                <Scope>
                    <Type>ORIGINALMESSAGEIDENTIFIER</Type>
                    <InstanceIdentifier>8dbf63f4-b784-4d40-8802-c1bdb1ecfa63</InstanceIdentifier>
                    <Identifier>dk-medcom-messaging</Identifier>
                </Scope>
                <Scope>
                    <Type>MESSAGEENVELOPEIDENTIFIER</Type>
                    <InstanceIdentifier>c8f63ec7-651e-4e11-9ef6-430c1b193863</InstanceIdentifier>
                    <Identifier>dk-medcom-messaging</Identifier>
                </Scope>            
                <Scope>
                    <Type>ORIGINALMESSAGEENVELOPEIDENTIFIER</Type>
                    <InstanceIdentifier>add5e7e2-0c0f-4a4a-bfff-f6f984fa7e3c</InstanceIdentifier>
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
                    <InstanceIdentifier>9a6ff822-08de-5a6f-9670-9fa4b9d2f0dc</InstanceIdentifier>
                    <Identifier>dk-medcom-messaging</Identifier>
                </Scope>
                <Scope>
                    <Type>StatisticalInformation</Type>
                    <InstanceIdentifier>EHMI-ReceiptAcknowledgement</InstanceIdentifier>
                    <Identifier>dk-medcom-messaging</Identifier>
                </Scope>
                <!-- MedCom messaging - Acknowledgment scope -->
                <Scope>
                    <Type>EHMI-ReceiptAcknowledgement</Type>
                    <InstanceIdentifier>Response</InstanceIdentifier>
                    <Identifier>dk-medcom-messaging</Identifier>
                    <CorrelationInformation>
                        <RequestingDocumentCreationDateTime>2025-04-01T16:19:00.000+01:00</RequestingDocumentCreationDateTime>
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
        <BinaryContent mimeType="application/xml" encoding="UTF-8">
            PGJwc3NpZ25hbDpSZWNlaXB0QWNrbm93bGVkZ2VtZW50IHhtbG5zOmRzPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwLzA5L3htbGRzaWcjIiB4bWxuczp4bGluaz0iaHR0cDovL3d3dy53My5vcmcvMTk5OS94bGluayIgeG1sbnM6YnBzc2lnbmFsPSJodHRwOi8vZG9jcy5vYXNpcy1vcGVuLm9yZy9lYnhtbC1icC9lYmJwLXNpZ25hbHMtMi4wIiB4bWxuczp4c2k9Imh0dHA6Ly93d3cudzMub3JnLzIwMDEvWE1MU2NoZW1hLWluc3RhbmNlIiB4c2k6c2NoZW1hTG9jYXRpb249Imh0dHA6Ly9kb2NzLm9hc2lzLW9wZW4ub3JnL2VieG1sLWJwL2ViYnAtc2lnbmFscy0yLjAgaHR0cDovL2RvY3Mub2FzaXMtb3Blbi5vcmcvZWJ4bWwtYnAvMi4wLjQvZWJicC1zaWduYWxzLTIuMC40LnhzZCI+CiAgICA8YnBzc2lnbmFsOk9yaWdpbmFsTWVzc2FnZUlkZW50aWZpZXI+CiAgICAgICAgOWE2ZmY4MjItMDhkZS01YTZmLTk2NzAtOWZhNGI5ZDJmMGRjCiAgICA8L2Jwc3NpZ25hbDpPcmlnaW5hbE1lc3NhZ2VJZGVudGlmaWVyPgogICAgPGJwc3NpZ25hbDpPcmlnaW5hbERvY3VtZW50SWRlbnRpZmllcj4KICAgICAgICB1cm46ZGs6aGVhbHRoY2FyZTptZWRjb206bWVzc2FnaW5nOmZoaXI6c3RydWN0dXJlZGVmaW5pdGlvbjpob21lY2FyZW9ic2VydmF0aW9uLW1lc3NhZ2U6MS4xCiAgICA8L2Jwc3NpZ25hbDpPcmlnaW5hbERvY3VtZW50SWRlbnRpZmllcj4KICAgIDxicHNzaWduYWw6T3JpZ2luYWxNZXNzYWdlRGF0ZVRpbWU+CiAgICAgICAgMjAyNS0wNC0wMVQxNjoxOTowMCswMTowMAogICAgPC9icHNzaWduYWw6T3JpZ2luYWxNZXNzYWdlRGF0ZVRpbWU+CiAgICA8YnBzc2lnbmFsOlRoaXNNZXNzYWdlRGF0ZVRpbWU+CiAgICAgICAgMjAyNS0wNC0wMVQxNjoyMDowMCswMTowMAogICAgPC9icHNzaWduYWw6VGhpc01lc3NhZ2VEYXRlVGltZT4KICAgIDxicHNzaWduYWw6RnJvbVBhcnR5SW5mbyB0eXBlPSJpc282NTIzLWFjdG9yaWQtdXBpcyI+CiAgICAgICAgMDA4ODo1NzkwMDAwMjAxMzg5CiAgICA8L2Jwc3NpZ25hbDpGcm9tUGFydHlJbmZvPgogICAgPGJwc3NpZ25hbDpUb1BhcnR5SW5mbyB0eXBlPSJpc282NTIzLWFjdG9yaWQtdXBpcyI+CiAgICAgICAgMDA4ODo1NzkwMDAwMTIxNTI2CiAgICA8L2Jwc3NpZ25hbDpUb1BhcnR5SW5mbz4KICAgIDxicHNzaWduYWw6Q29sbGFib3JhdGlvbklkZW50aWZpZXI+CiAgICAgICAgOWE2ZmY4MjIwOGRlLTVhNmYtOTY3MC05ZmE0YjlkMmYwZGgKICAgIDwvYnBzc2lnbmFsOkNvbGxhYm9yYXRpb25JZGVudGlmaWVyPgo8L2Jwc3NpZ25hbDpSZWNlaXB0QWNrbm93bGVkZ2VtZW50Pg==
        </BinaryContent>
    </StandardBusinessDocument>