Alias: DCM = http://dicom.nema.org/resources/ontology/DCM
Alias: DCMUID = http://dicom.nema.org/resources/ontology/DCMUID

ValueSet: JustModalitiesVS
Title: "all the DICOM modalities ValueSet"
Description: "ValueSet of all the DICOM modalities in CID-29"
* ^experimental = false
* codes from valueset http://dicom.nema.org/medical/dicom/current/output/chtml/part16/sect_CID_29.html

ValueSet: FewModalitiesVS
Title: "Just some modalities"
Description: "ValueSet of some modalities explicitly listed"
* ^experimental = false
* DCM#AR
* DCM#BI
* DCM#BMD
* DCM#CT

Extension: SopOid
Id: testDicom.SopOid
Title: "a SOP in OID form"
Description: "similar"
* ^context[+].type = #element
* ^context[=].expression = "ImagingStudy"
* value[x] only oid
* valueOid 1..1


Profile: ImagingStudyTrivial
Parent: ImagingStudy
Id: JohnMoehrke.testDicom.testImage.trivial 
Description: "A profile on ImagingStudy that is trivial to distinguish issues outside the scope of this IG"
* status = #available
* extension contains SopOid named sop 0..1

Instance: SsopOid
InstanceOf: SearchParameter
Title: "Search on oid sop"
Usage: #definition
* status = #active
* name = "SsopOid"
* description = "Search on oid sop"
* code = #designationType
* base = #ImagingStudy
* url = "http://johnmoehrke.github.io/testDicom/SearchParameter/SsopOid"
* expression = "(extension('http://johnmoehrke.github.io/testDicom/StructureDefinition/testDicom.SopOid').value.ofType(oid))"
* type = #uri

Instance:   ex-imagingstudyTrivial
InstanceOf: ImagingStudyTrivial
Title: "Example ImagingStudy Trivial"
Description:      "simple example using trivial profile."
Usage: #example
* meta.security = http://terminology.hl7.org/CodeSystem/v3-ActReason#HTEST
* subject = Reference(Patient/ex-patient)
* status = #available
* extension[sop].valueOid = "urn:oid:1.2.840.10008.5.1.4.1.1.2"
* series.uid = "1.3.6.1.4.1.32473"
* series.modality = DCM#CT
* series.instance.uid = "1.3.6.1.4.1.32473.5"
* series.instance.sopClass = DCMUID#1.2.840.10008.5.1.4.1.1.2 "CT Image Storage"





Profile:        TestImageVs
Parent:         ImagingStudy
Id:             JohnMoehrke.testDicom.testImage.vs
Title:          "test image profile using all valueSets"
Description:    "A profile on ImagingStudy to show off some valueSets"
* modality from JustModalitiesVS (required)
* series.modality from FewModalitiesVS (required)

Instance:   ex-imagingstudyVs
InstanceOf: TestImageVs
Title: "Example ImagingStudy"
Description:      "simple example using the ValueSet bound profile of ImagingStudy."
Usage: #example
* meta.security = http://terminology.hl7.org/CodeSystem/v3-ActReason#HTEST
* subject = Reference(Patient/ex-patient)
* status = #available
* modality = DCM#AR
* series.modality = DCM#BI
* series.uid = "1.3.6.1.4.1.32473.5"


Profile:        TestImageBind
Parent:         ImagingStudy
Id:             JohnMoehrke.testDicom.testImage.bind
Title:          "test image profile binding to dicom valueset"
Description:    "A profile on ImagingStudy to show off binding to a dicom defined valueSets"
* modality from http://dicom.nema.org/medical/dicom/current/output/chtml/part16/sect_CID_29.html (required)
* series.modality from FewModalitiesVS (required)




Instance:   ex-imagingstudyBind
InstanceOf: TestImageBind
Title: "Example ImagingStudy"
Description:      "simple example using the dicom valueset bound profile."
Usage: #example
* meta.security = http://terminology.hl7.org/CodeSystem/v3-ActReason#HTEST
* subject = Reference(Patient/ex-patient)
* status = #available
* modality = DCM#AR
* series.modality = DCM#BI
* series.uid = "1.3.6.1.4.1.32473.5"


Instance:   ex-imagingstudy-withBadCode
InstanceOf: TestImageVs
Title: "Example ImagingStudy with a bad DICOM code"
Description:      "simple example with a bad DICOM code."
Usage: #example
* meta.security = http://terminology.hl7.org/CodeSystem/v3-ActReason#HTEST
* subject = Reference(Patient/ex-patient)
* status = #available
// note DCM#PRINT is valid in DCM, but is not in the modality valueset
* modality = DCM#PRINT
* series.modality = DCM#BI
* series.uid = "1.3.6.1.4.1.32473.5"





// history - http://playgroundjungle.com/2018/02/origins-of-john-jacob-jingleheimer-schmidt.html
Instance:   ex-patient
InstanceOf: Patient
Title:      "Dummy Patient example"
Description: "Dummy patient example for completeness sake. No actual use of this resource other than an example target"
//Usage: #inline
Usage: #example
* meta.security = http://terminology.hl7.org/CodeSystem/v3-ActReason#HTEST
* name[+].use = #usual
* name[=].family = "Schmidt"
* name[=].given = "John"
* name[+].use = #old
* name[=].family = "Schnidt"
* name[=].given[+] = "John"
* name[=].given[+] = "Jacob"
* name[=].given[+] = "Jingle"
* name[=].given[+] = "Heimer"
* name[=].period.end = "1960"
* name[+].use = #official
* name[=].family = "Schmidt"
* name[=].given[+] = "John"
* name[=].given[+] = "Jacob"
* name[=].given[+] = "Jingleheimer"
* name[=].period.start = "1960-01-01"
* name[+].use = #nickname
* name[=].family = "Schmidt"
* name[=].given = "Jack"
* gender = #other
* birthDate = "1923-07-25"
* address.state = "WI"
* address.country = "USA"


Instance:   ex-device
InstanceOf: Device
Title:      "Dummy Device example"
Description: "Dummy Device example for completeness sake. No actual use of this resource other than an example target"
* meta.security = http://terminology.hl7.org/CodeSystem/v3-ActReason#HTEST

Instance: ex-auditBasicCreateImagingStudy
InstanceOf: AuditEvent
Title: "Server - Audit Example of a basic Create of an ImagingStudy"
Description: """
Audit Example for a RESTful Create of an ImagingStudy resource with a patient subject. 

- recorded by the server
- server is FHIR application server defined by ex-device
- client is an app on myMachine on myMachine
- user is John Smith
- created resource is ex-measurereport
- patient is ex-patient
"""
* meta.security = http://terminology.hl7.org/CodeSystem/v3-ActReason#HTEST
* code = http://terminology.hl7.org/CodeSystem/audit-event-type#rest "Restful Operation"
* action = #C
* category[+] = http://hl7.org/fhir/restful-interaction#create "create"
//* severity = #Informational
* recorded = 2020-04-29T09:49:00.000Z
//* outcome = http://terminology.hl7.org/CodeSystem/audit-event-outcome#0 "Success"
* outcome.code = http://hl7.org/fhir/issue-severity#success
* source.site.display = "server.example.com"
* source.observer = Reference(Device/ex-device)
* source.type = http://terminology.hl7.org/CodeSystem/security-source-type#4 "Application Server"
* agent[+].type = DCM#110152 "Destination Role ID"
* agent[=].requestor = false
* agent[=].who = Reference(Device/ex-device)
* agent[+].type = DCM#110153 "Source Role ID"
* agent[=].requestor = false
* agent[=].who.display = "myMachine.example.org"
* agent[+].type = http://terminology.hl7.org/CodeSystem/extra-security-role-type#humanuser
* agent[=].role = http://terminology.hl7.org/CodeSystem/v3-ParticipationType#AUT "author (originator)"
* agent[=].who.display = "John Smith" // just a display name pulled from the OAuth token
* agent[=].requestor = true
* entity[+].what = Reference(ex-imagingstudyBind)
//* entity[=].type = http://terminology.hl7.org/CodeSystem/audit-entity-type#2 "System Object"
* entity[=].role = http://terminology.hl7.org/CodeSystem/object-role#4 "Domain Resource"
* entity[+].what = Reference(Patient/ex-patient)
//* entity[=].type = http://terminology.hl7.org/CodeSystem/audit-entity-type#1 "Person"
* entity[=].role = http://terminology.hl7.org/CodeSystem/object-role#1 "Patient"

Instance: ex-provenanceCreateImagingStudy
InstanceOf: Provenance
Title: "Server - Provenance Example of a basic Create of an ImagingStudy"
Description: """
Provenance Example for a RESTful Create of an ImagingStudy resource with a patient subject. 

- recorded by the server
- server is FHIR application server defined by ex-device
- client is an app on myMachine on myMachine
- user is John Smith
- created resource is ex-measurereport
- patient is ex-patient
"""
* meta.security = http://terminology.hl7.org/CodeSystem/v3-ActReason#HTEST
* target = Reference(ex-imagingstudyBind)
* occurredDateTime = 2020-04-29T09:49:00.000Z
* recorded = 2020-04-29T09:49:00.000Z
* patient = Reference(Patient/ex-patient)

* agent[+].type = DCM#110152 "Destination Role ID"
* agent[=].who = Reference(Device/ex-device)
* agent[+].type = DCM#110153 "Source Role ID"
* agent[=].who.display = "myMachine.example.org"
* agent[+].type = http://terminology.hl7.org/CodeSystem/v3-ParticipationType#AUT "author (originator)"
* agent[=].role = http://terminology.hl7.org/CodeSystem/v3-ParticipationType#AUT "author (originator)"
* agent[=].who.display = "John Smith" // just a display name pulled from the OAuth token

Instance: ex-consent
InstanceOf: Consent
Title: "Example Consent"
Description: "Testing provenance role"
* meta.security = http://terminology.hl7.org/CodeSystem/v3-ActReason#HTEST
* status = #active
* category = http://loinc.org#57017-6
* subject = Reference(Patient/ex-patient)
* provision[+].actor.role = http://terminology.hl7.org/CodeSystem/v3-ParticipationType#AUT "author (originator)"
