# Example of a full Sbdhprofile

Please note that this xsd is only included for compliance reasons, it is not used as part of the ehmiSBDH due to the cardinaliy of the elements in ehmiSBDH.

<a href="./ehmiSBDH/Manifest.xsd" target="_blank">Link to the raw xsd (opens in a new window)</a>

        <?xml version="1.0" encoding="UTF-8" standalone="yes"?>
        <StandardBusinessDocument xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
            xsi:schemaLocation="C:\GitHub\ehmi\dk-ehmi-sbdh\input\pagecontent\ehmiSBDH\ehmiStandardBusinessDocumentHeader.xsd"
            xmlns="http://www.unece.org/cefact/namespaces/StandardBusinessDocumentHeader"
            xmlns:ns6="http://www.ean-ucc.org/schemas/1.3/eanucc"
            xmlns:bc="http://peppol.eu/xsd/ticc/envelope/1.0"
            xmlns:sbdh="http://www.unece.org/cefact/namespaces/StandardBusinessDocumentHeader"
            xmlns:ns2="http://docs.oasis-open.org/ebxml-bp/ebbp-signals-2.0"
            xmlns:ns4="http://www.w3.org/2000/09/xmldsig#" xmlns:ns3="http://www.w3.org/1999/xlink">
            <StandardBusinessDocumentHeader>
                <HeaderVersion>1.0</HeaderVersion>
                <Sender>
                    <Identifier Authority="iso6523-actorid-upis">0088:5790000121526</Identifier>
                </Sender>
                <Receiver>
                    <Identifier Authority="iso6523-actorid-upis">0088:5790000201389</Identifier>
                </Receiver>
                <DocumentIdentification>
                    <Standard>homecareobservation-message</Standard>
                    <TypeVersion>1.0</TypeVersion>
                    <InstanceIdentifier>9a6ff822-08de-5a6f-9670-9fa4b9d2f0dc</InstanceIdentifier>
                    <Type>Bundle</Type>
                    <MultipleType>false</MultipleType>
                    <CreationDateAndTime>2025-04-01T16:19:00+01:00</CreationDateAndTime>
                </DocumentIdentification>
                <BusinessScope>
                    <!-- eDelivery scope -->
                    <Scope>
                        <Type>DOCUMENTID</Type>
                        <InstanceIdentifier>urn:dk:medcom:prod:messaging:fhir:structuredefinition:homecareobservation#urn:dk:medcom:fhir:homecareobservation:3.0</InstanceIdentifier>
                        <Identifier>dk-medcom-messaging</Identifier>
                    </Scope>
                    <Scope>
                        <Type>PROCESSID</Type>
                        <InstanceIdentifier>sdn-emergence</InstanceIdentifier>
                        <Identifier>dk-medcom-messaging</Identifier>
                    </Scope>
                    <!-- MedCom messaging scope -->
                    <Scope>
                        <Type>PATIENTID</Type>
                        <InstanceIdentifier>0101010227</InstanceIdentifier>
                        <Identifier>dk-medcom-messaging</Identifier>
                    </Scope>
                    <Scope>
                        <Type>SENDERID</Type>
                        <InstanceIdentifier>8851000016006</InstanceIdentifier>
                        <Identifier>dk-medcom-messaging</Identifier>
                    </Scope>
                    <Scope>
                        <Type>RECEIVERID</Type>
                        <InstanceIdentifier>263001000016001</InstanceIdentifier>
                        <Identifier>dk-medcom-messaging</Identifier>
                    </Scope>
                    <Scope>
                        <Type>MESSAGEIDENTIFIER</Type>
                        <InstanceIdentifier>f06c1ac8-6096-5178-a380-2831d2456986</InstanceIdentifier>
                        <Identifier>dk-medcom-messaging</Identifier>
                    </Scope>
                    <Scope>
                        <Type>MESSAGEENVELOPEIDENTIFIER</Type>
                        <InstanceIdentifier>
                            f06c1ac8-6096-5178-a380-2831d2456986
                        </InstanceIdentifier>
                        <Identifier>dk-medcom-messaging</Identifier>
                    </Scope>            
                    <Scope>
                        <Type>StatisticalInformation</Type>
                        <InstanceIdentifier>
                            MCM:homecareobservation-message
                        </InstanceIdentifier>
                        <Identifier>dk-medcom-messaging</Identifier>
                    </Scope>
                    <!-- MedCom messaging - Acknowledgment scope -->
                    <Scope>
                        <Type>EHMI-ReceiptAcknowledgement</Type>
                        <InstanceIdentifier>Request</InstanceIdentifier>
                        <Identifier>dk-medcom-messaging</Identifier>
                        <CorrelationInformation>
                            <RequestingDocumentCreationDateTime>
                                2021-02-17T09:30:10+01:00
                            </RequestingDocumentCreationDateTime>
                            <RequestingDocumentInstanceIdentifier>
                                9a6ff82208de-5a6f-9670-9fa4b9d2f0dh
                            </RequestingDocumentInstanceIdentifier>
                            <ExpectedResponseDateTime>
                                2021-02-17T09:40:10+01:00
                            </ExpectedResponseDateTime>
                        </CorrelationInformation>
                        <BusinessService>
                            <BusinessServiceName>EHMI-ReceiptAcknowledgement-Request</BusinessServiceName>
                            <ServiceTransaction TypeOfServiceTransaction="RequestingServiceTransaction" IsNonRepudiationRequired="false" IsAuthenticationRequired="false" IsNonRepudiationOfReceiptRequired="false" IsIntelligibleCheckRequired="false"
                                IsApplicationErrorResponseRequested="false" TimeToAcknowledgeReceipt="600000" TimeToAcknowledgeAcceptance="0" TimeToPerform="0" Recurrence="0"/>
                        </BusinessService>
                    </Scope>
                </BusinessScope>
            </StandardBusinessDocumentHeader>
            <BinaryContent mimeType="application/fhir+xml" encoding="ISO-8859-1">PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iSVNPLTg4NTktMSI/Pgo8RW1lc3NhZ2UgeG1sbnM6eHNpPSJodHRwOi8vd3d3LnczLm9yZy8yMDAxL1hNTFNjaGVtYS1pbnN0YW5jZSIKIHhtbG5zPSJodHRwOi8vcmVwLm9pby5kay9zdW5kY29tLmRrL21lZGNvbS5kay94bWwvc2NoZW1hcy8yMDA1LzA4LzA3LyI+CiAgPEVudmVsb3BlPgogICAgPFNlbnQ+CiAgICAgIDxEYXRlPjIwMjEtMDItMTg8L0RhdGU+CiAgICAgIDxUaW1lPjEyOjAwPC9UaW1lPgogICAgPC9TZW50PgogICAgPElkZW50aWZpZXI+SG52S3V2MTIzNDwvSWRlbnRpZmllcj4KICAgIDxBY2tub3dsZWRnZW1lbnRDb2RlPnBsdXNwb3NpdGl2a3ZpdHQ8L0Fja25vd2xlZGdlbWVudENvZGU+CiAgPC9FbnZlbG9wZT4KICA8SG9zcGl0YWxSZWZlcnJhbD4KICAgIDxMZXR0ZXI+CiAgICAgIDxJZGVudGlmaWVyPkhudkJydjU2Nzg8L0lkZW50aWZpZXI+CiAgICAgIDxWZXJzaW9uQ29kZT5YSDAxMzBSPC9WZXJzaW9uQ29kZT4KICAgICAgPFN0YXRpc3RpY2FsQ29kZT5SRUYwMTwvU3RhdGlzdGljYWxDb2RlPgogICAgICA8QXV0aG9yaXNhdGlvbj4KCQkgIDxEYXRlPjIwMjEtMDItMTg8L0RhdGU+CgkJICA8VGltZT4xMjowMDwvVGltZT4KICAgICAgPC9BdXRob3Jpc2F0aW9uPgogICAgICA8VHlwZUNvZGU+WFJFRjAxPC9UeXBlQ29kZT4KICAgICAgPFN0YXR1c0NvZGU+bnl0YnJldjwvU3RhdHVzQ29kZT4KICAgIDwvTGV0dGVyPgogICAgPFNlbmRlcj4KICAgICAgPEVBTklkZW50aWZpZXI+NTc5MDAwMDEyMTUyNjwvRUFOSWRlbnRpZmllcj4KICAgICAgPElkZW50aWZpZXI+ODg1MTAwMDAxNjAwNjwvSWRlbnRpZmllcj4KICAgICAgPElkZW50aWZpZXJDb2RlPnNvcmtvZGU8L0lkZW50aWZpZXJDb2RlPgogICAgICA8T3JnYW5pc2F0aW9uTmFtZT5M5mdlaHVzZXQ8L09yZ2FuaXNhdGlvbk5hbWU+CiAgICAgIDxTdHJlZXROYW1lPlZhbmR25nJrc3ZlaiA5OTwvU3RyZWV0TmFtZT4KICAgICAgPERpc3RyaWN0TmFtZT5IaWxsZXL4ZDwvRGlzdHJpY3ROYW1lPgogICAgICA8UG9zdENvZGVJZGVudGlmaWVyPjM0MDA8L1Bvc3RDb2RlSWRlbnRpZmllcj4KICAgICAgPFRlbGVwaG9uZVN1YnNjcmliZXJJZGVudGlmaWVyPjQ1MTIxMzE0PC9UZWxlcGhvbmVTdWJzY3JpYmVySWRlbnRpZmllcj4KICAgICAgPE1lZGljYWxTcGVjaWFsaXR5Q29kZT5hbG1lbmxhZWdlX2xhZWdldmFndDwvTWVkaWNhbFNwZWNpYWxpdHlDb2RlPgogICAgICA8UmVmZXJyZXI+CiAgICAgICAgPFBlcnNvbk5hbWU+SGFucyBKZW5zZW48L1BlcnNvbk5hbWU+CiAgICAgICAgPFBlcnNvblRpdGxlPlVkZGFubmVsc2VzYW1hbnVlbnNpczwvUGVyc29uVGl0bGU+CiAgICAgIDwvUmVmZXJyZXI+CiAgICA8L1NlbmRlcj4KICAgIDxSZWNlaXZlcj4KICAgICAgPEVBTklkZW50aWZpZXI+NTc5MDAwMDIwMTM4OTwvRUFOSWRlbnRpZmllcj4KICAgICAgPElkZW50aWZpZXI+MjYzMDAxMDAwMDE2MDAxPC9JZGVudGlmaWVyPgogICAgICA8SWRlbnRpZmllckNvZGU+c29ya29kZTwvSWRlbnRpZmllckNvZGU+CiAgICAgIDxPcmdhbmlzYXRpb25OYW1lPkhpbGxlcvhkIFN5Z2VodXM8L09yZ2FuaXNhdGlvbk5hbWU+CiAgICAgIDxEZXBhcnRtZW50TmFtZT5NZWRpY2luc2sgYWZkLiBCPC9EZXBhcnRtZW50TmFtZT4KICAgICAgPFN0cmVldE5hbWU+U3lnZWh1c3ZlaiAxMDwvU3RyZWV0TmFtZT4KICAgICAgPERpc3RyaWN0TmFtZT5IaWxsZXL4ZDwvRGlzdHJpY3ROYW1lPgogICAgICA8UG9zdENvZGVJZGVudGlmaWVyPjM0MDA8L1Bvc3RDb2RlSWRlbnRpZmllcj4KICAgIDwvUmVjZWl2ZXI+CiAgICA8QW5zd2VyQ0NSZWNlaXZlcj4KICAgICAgPElkZW50aWZpZXI+MDc5ODMyPC9JZGVudGlmaWVyPgogICAgICA8SWRlbnRpZmllckNvZGU+eWRlcm51bW1lcjwvSWRlbnRpZmllckNvZGU+CiAgICAgIDxEZXBhcnRtZW50TmFtZT5M5mdlPC9EZXBhcnRtZW50TmFtZT4KICAgICAgPFVuaXROYW1lPkhhbnMgQW5kZXJzZW48L1VuaXROYW1lPgogICAgICA8U3RyZWV0TmFtZT5C+HJzdGVuYmluZGVydmVqIDM0PC9TdHJlZXROYW1lPgogICAgICA8RGlzdHJpY3ROYW1lPkhpbGxlcvhkPC9EaXN0cmljdE5hbWU+CiAgICAgIDxQb3N0Q29kZUlkZW50aWZpZXI+MzQwMDwvUG9zdENvZGVJZGVudGlmaWVyPgogICAgPC9BbnN3ZXJDQ1JlY2VpdmVyPgogICAgPFBhdGllbnQ+CiAgICAgIDxDaXZpbFJlZ2lzdHJhdGlvbk51bWJlcj4yNTA5NDc5OTg5PC9DaXZpbFJlZ2lzdHJhdGlvbk51bWJlcj4KICAgICAgPFBlcnNvblN1cm5hbWVOYW1lPkVsbWVyPC9QZXJzb25TdXJuYW1lTmFtZT4KICAgICAgPFBlcnNvbkdpdmVuTmFtZT5CcnVubyBUZXN0PC9QZXJzb25HaXZlbk5hbWU+CiAgICAgIDxTdHJlZXROYW1lPlRlc3RkcvhtbWVoYXZlbiA0ODwvU3RyZWV0TmFtZT4KICAgICAgPERpc3RyaWN0TmFtZT5IaWxsZXL4ZDwvRGlzdHJpY3ROYW1lPgogICAgICA8UG9zdENvZGVJZGVudGlmaWVyPjM0MDA8L1Bvc3RDb2RlSWRlbnRpZmllcj4KICAgICAgPFRlbGVwaG9uZVN1YnNjcmliZXI+CiAgICAgICAgPFRlbGVwaG9uZVN1YnNjcmliZXJJZGVudGlmaWVyPjQ4MzAyMjIzPC9UZWxlcGhvbmVTdWJzY3JpYmVySWRlbnRpZmllcj4KICAgICAgICA8VGVsZXBob25lU3Vic2NyaWJlckNvZGU+ZmFzdG5ldDwvVGVsZXBob25lU3Vic2NyaWJlckNvZGU+CiAgICAgIDwvVGVsZXBob25lU3Vic2NyaWJlcj4KICAgICAgPFRlbGVwaG9uZVN1YnNjcmliZXI+CiAgICAgIDxUZWxlcGhvbmVTdWJzY3JpYmVySWRlbnRpZmllcj4yMDIyMjMyNDwvVGVsZXBob25lU3Vic2NyaWJlcklkZW50aWZpZXI+CiAgICAgIDxUZWxlcGhvbmVTdWJzY3JpYmVyQ29kZT5tb2JpbDwvVGVsZXBob25lU3Vic2NyaWJlckNvZGU+CiAgICAgIDwvVGVsZXBob25lU3Vic2NyaWJlcj4KICAgICAgPEVtYWlsSWRlbnRpZmllcj5CcnVub0VAZGFubWFya3NtZXN0a2VuZHRlLmRrPC9FbWFpbElkZW50aWZpZXI+CiAgICA8L1BhdGllbnQ+CiAgICA8UmVsYXRpdmU+CiAgICAgIDxSZWxhdGlvbkNvZGU+dXNwZWNfcGFhcm9lcmVuZGU8L1JlbGF0aW9uQ29kZT4KICAgICAgPFBlcnNvbklkZW50aWZpZXI+MjUxMjQ4OTk5NjwvUGVyc29uSWRlbnRpZmllcj4KICAgICAgPFBlcnNvblN1cm5hbWVOYW1lPkJlcmdncmVuPC9QZXJzb25TdXJuYW1lTmFtZT4KICAgICAgPFBlcnNvbkdpdmVuTmFtZT5OYW5jeSBBbm4gVGVzdDwvUGVyc29uR2l2ZW5OYW1lPgogICAgPC9SZWxhdGl2ZT4KICAgIDxBZGRpdGlvbmFsSW5mb3JtYXRpb24+CiAgICAgIDxQcmlvcml0eT5lbGVrdGl2PC9Qcmlvcml0eT4KICAgICAgPFRyYW5zcG9ydD5pbmdlbjwvVHJhbnNwb3J0PgogICAgICA8U3VwcGxlbWVudGFyeT5JbmRrYWxkZXMgZnJhIHNvbW1lcmh1cywgU29tbWVydmVqIDEwLCBHaWxsZWxlamU8QnJlYWsvPjwvU3VwcGxlbWVudGFyeT4KICAgICAgPENsaW5pY2FsUmVhc29uPkh5cGVydGVuc2lvbnN1ZHJlZG5pbmcgKyBiZWhhbmRsaW5nIHNhbXQgZGnmdHZlamxlZG5pbmcgdmVkcvhyZW5kZSBvdmVyduZndDxCcmVhay8+PC9DbGluaWNhbFJlYXNvbj4KICAgIDwvQWRkaXRpb25hbEluZm9ybWF0aW9uPgogICAgPFJlZmVycmFsPgogICAgICA8UmVmZXI+CiAgICAgICAgPERpYWdub3NlQ29kZT5ESTEwPC9EaWFnbm9zZUNvZGU+CiAgICAgICAgPERpYWdub3NlVHlwZUNvZGU+U0tTZGlhZ25vc2Vrb2RlPC9EaWFnbm9zZVR5cGVDb2RlPgogICAgICAgIDxEaWFnbm9zZVRleHQ+QmxvZHRyeWtzZm9yaPhqZWxzZSBhZiB1a2VuZHQg5XJzYWcuPC9EaWFnbm9zZVRleHQ+CiAgICAgIDwvUmVmZXI+CiAgICAgIDxSZWZlcnJhbEFkZGl0aW9uYWw+CiAgICAgICAgPERpYWdub3NlRGVzY3JpcHRpb25Db2RlPnRpbGxhZWdzZGlhZ25vc2U8L0RpYWdub3NlRGVzY3JpcHRpb25Db2RlPgogICAgICAgIDxEaWFnbm9zZUNvZGU+REU2NTk8L0RpYWdub3NlQ29kZT4KICAgICAgICA8RGlhZ25vc2VUeXBlQ29kZT5TS1NkaWFnbm9zZWtvZGU8L0RpYWdub3NlVHlwZUNvZGU+CiAgICAgICAgPERpYWdub3NlVGV4dD5GZWRtZSB1LiBzcGVjPC9EaWFnbm9zZVRleHQ+CiAgICAgIDwvUmVmZXJyYWxBZGRpdGlvbmFsPgogICAgPC9SZWZlcnJhbD4KICAgIDxSZWxldmFudENsaW5pY2FsSW5mb3JtYXRpb24+CiAgICAgIDxDYXZlPjxCcmVhay8+RmVub3h5bWV0eWxwZW5pY2lsbGluICAoMTk5NCBSaW5nc3RlZCBTZ2guIG1lZCBsYXJ5bnj4ZGVtKTxCcmVhay8+PC9DYXZlPgogICAgICA8QW5hbW5lc2lzPjE5OTUgaW5kbGFndCBL+GdlIFN5Z2VodXMgdW5kZXIgbWlzdGFua2Ugb20gQU1JLCBhZmty5mZ0ZWRlcy4gSmFudWFyIDk4IGluZGxhZ3QgRnJlZGVyaWtzYm9yZyBTZ2guLCBtZWQgYWZkLiwgbWVkIHN0ZW5va2FyZGkuIEZlYnJ1YXIgOTggc2FtbWUgYWZkLiBhbWIuIHRpbCAgRUtHLWJlbGFzdG5pbmdzdXMuICA8QnJlYWsvPiBHaWZ0IGZhYnJpa2FudC4gU2lkZW4gYmFybmVhbGRlcmVuIHbmcmV0IG92ZXJ25md0aWcuLCBhbHRpZCBk5XJsaWdlIGtvc3R2YW5lciBzcGVjLiBtZWQgb3ZlcmZs+GRpZyBmZWR0a2Fsb3JpZS10aWxm+HJzZWwuIEkgZmxlcmUgcGVyaW9kZXIgYmVoLiBmb3IgYWRkaWt0aXZ0IGFsa29ob2xtaXNicnVnLiA8QnJlYWsvPlZpcmtlciB2ZWxiZWdhdmV0LCBtZW4gdHJvZHMgZGV0dGUgZOVybGlnIHN5Z2RvbXNpbmRzaWd0IG9nIG1hbmdsZW5kZSBtb3RpdmF0aW9uIGZvciBsaXZzc3RpbHPmbmRyaW5nLiA8QnJlYWsvPktvbnN1bHRlcmVkZSBwcmltbyBzZXB0LiA5OCBtZWQga3JhZnRpZyBkaWZmdXMgZHVua2VuZGUgaG92ZWRwaW5lLiBCVCAgZmFuZHRlcyBrcmFmdGlndCBmb3Jo+GpldCAtIHNpZGRlbmRlIDIwNS8xMjAgZWZ0ZXIgMTUgbWluLnMgXCA8QnJlYWsvPiBodmlsZSAxODUvMTEwLiBTaWRlbiBncmFkdmlzIHRpdHJlcmV0IG9wIHRpbCBuZWRlbnN05WVuZGUgXCA8QnJlYWsvPm1lZGljaW5vcmRpbmF0aW9uLCBtZW4gZXIgdeZuZHJldCBob3ZlZHBpbmVwbGFnZXQgb2cgc2lkc3RlIGh2aWxlIEJUIGQuZC4gZXIgMTgwLzEwNS4gSPhqZGUgMTY5IGNtLiBW5md0IDk4LjIga2cuIDxCcmVhay8+UGF0aWVudGVuIGFuZ2l2ZXIgc2lnIG51IGluZHN0aWxsZXQgcOUgZGVuIG74ZHZlbmRpZ2UgaW50ZXJ2ZW50aW9uLCBcIDxCcmVhay8+IGV2dC4gb2dz5SBs5m5nZXJldmFyZW5kZSBpbmRsLjxCcmVhay8+PC9BbmFtbmVzaXM+CiAgICAgIDxFeGFtaW5hdGlvbj5SdGcgYWYgdGhvcmF4IChzYW1tZSBzZ2ggMjIuOS45OCAtIHJ0ZyBuciAxMjM3LzUyKTogIEJyZWRkZfhnZXQgY29yIDE4LzM0IG1lZCBkZWx2aXMgdWRzbGV0dGV0IHRhbGplLCBpbmdlbiBzdGFzZS4gSHZpbGUgRUtHIHZpc2VyICB2ZW5zdHJlc2lkaWd0IGJlbGFzdG5pbmdzbfhuc3Rlci4gT3B0aGFsbW9za29waSAow4PCmGpsLiBPbGUgSGFuc2VuIDI4LjkuOTgpOiBGdW5kLiBoeXBlcnQuIGdyYWQgSUkuIEtsaW5pc2sga2VtaSAoMTIuOS4wMC1mYXN0ZW5kZSk6PEJyZWFrLz5Ub3RhbGNob2wuIDcuNiBtbW9sL2wuIEhETC1jaG9sZXN0ZXJvbCAgMC45IG1tb2wvbCwgTERMLWNob2xlc3Rlcm9sICA0LjMgbW1vbC9sIC4gVHJpZ2x5Y2VyaWRlciAzLjEgbW1vbC9sLiBTLUtyZWF0aW5pbiAxMDIgKG1vbC9sLiBGYXN0ZSBCLWdsdWNvc2UgNC44IG1tb2wvbC4gVXJpbm11bGl0aXN0aXggYmxhbmsuIET4Z251cmluIHRpbCBrYXRla29sYW1pbmJlc3QgZXIgaW5kc2VuZHQuIEVyIGhlbnZpc3QgdGlsIGlzb3RvcHJlbm9ncmFmaTxCcmVhay8+PC9FeGFtaW5hdGlvbj4KICAgICAgPEFjdHVhbE1lZGljaW5lPlRhYmwgVHJpYXRlYyAgNSBtZyAxKjEgZm9yIGJsb2R0cnlra2V0IC0gVGFibCBOb3J2YXNjIDUgbWcgMSoxIGZvciBibG9kdHJ5a2tldC0gVGFibCBDZW50eWwgbS4gS0NsIDEgZGdsICBmb3IgQlQgb2cgdmFuZGRyaXZlbmRlIC0gVGFibCBLYWxlb3JpZCAxIGRnbCBrYWxpdW10aWxza3VkIDxCcmVhay8+PC9BY3R1YWxNZWRpY2luZT4KICAgIDwvUmVsZXZhbnRDbGluaWNhbEluZm9ybWF0aW9uPgogIDwvSG9zcGl0YWxSZWZlcnJhbD4KPC9FbWVzc2FnZT4K</BinaryContent>
        </StandardBusinessDocument>