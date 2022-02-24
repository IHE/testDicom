Alias: DCM = http://dicom.nema.org/resources/ontology/DCM

ValueSet: JustModalitiesVS
Title: "all the DICOM modalities ValueSet"
Description: "ValueSet of the Document Sharing Endpint types allowed"
//Note that when MCSDEndpointTypes has more than Document Sharing in it, this will need to be more explicit. 
* codes from valueset https://dicom.nema.org/medical/dicom/current/output/chtml/part16/sect_CID_29.html

ValueSet: FewModalitiesVS
Title: "Just some modalities"
Description: "ValueSet of some modalities allowed"
* DCM#AR
* DCM#BI
* DCM#BMD




Profile:        TestImageVs
Parent:         ImagingStudy
Id:             JohnMoehrke.testDicom.testImage.vs
Title:          "test image profile using all valueSets"
Description:    "A profile on ImagingStudy to show off some valueSets"
* modality from JustModalitiesVS (required)
* series.modality from FewModalitiesVS (required)

Profile:        TestImageBind
Parent:         ImagingStudy
Id:             JohnMoehrke.testDicom.testImage.bind
Title:          "test image profile binding to dicom valueset"
Description:    "A profile on ImagingStudy to show off some valueSets"
* modality from https://dicom.nema.org/medical/dicom/current/output/chtml/part16/sect_CID_29.html (required)
* series.modality from FewModalitiesVS (required)

Instance:   ex-imagingstudy
InstanceOf: TestImageVs
Title: "Example ImagingStudy"
Description:      "simple example."
Usage: #example
* meta.security = http://terminology.hl7.org/CodeSystem/v3-ActReason#HTEST
* subject = Reference(Patient/ex-patient)
* status = #available
* modality = DCM#AR
* series.modality = DCM#BI
* series.uid = "1.2.3.4.5"

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
* series.uid = "1.2.3.4.5"





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

