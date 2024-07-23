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
* expression = "(extension('http://johnmoehrke.github.io/testDicom/StructureDefinition/testDicom.SopOid').value as oid)"
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

