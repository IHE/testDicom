Instance:   ex-List
InstanceOf: List
Title: "Example List with contained Patient"
Description:      "List Resource with contained resources that will not render right and throw IG build errors."
Usage: #example
* meta.security = http://terminology.hl7.org/CodeSystem/v3-ActReason#HTEST
* subject = Reference(Patient/ex-patient)
* contained[+] = ex-patient
* identifier[0].system = "urn:ietf:rfc:3986"
* identifier[0].value = "urn:oid:1.2.129.6.58.92.88337.4"
* identifier[0].use = #official
* identifier[1].system = "http://example.org/documents"
* identifier[1].value = "23425234-23470"
* identifier[1].use = #usual
* status = #current
* mode = #working
* title = "Example List showing contained issue"
//* code = MHDlistTypes#submissionset
* date = 2004-12-25T23:50:50-05:00
//* entry[0].item = Reference(DocumentReference/ex-documentreference)
//* contained[+] = ex-documentreference
//* entry[1].item = Reference(DocumentReference/ex-documentreference2)
//* contained[+] = ex-documentreference2
//* source = Reference(Practitioner/in-sender)
//* contained[+] = in-sender



Instance:   ex-Observation
InstanceOf: Observation
Title: "Example using observation of with contained Patient"
Description:      "holding invalid values"
//* meta.security = http://terminology.hl7.org/CodeSystem/v3-ActReason#HTEST
* status = #final
* category = http://terminology.hl7.org/CodeSystem/observation-category#vital-signs
* code.coding = http://loinc.org#72514-3 "Pain severity - 0-10 verbal numeric rating [Score] - Reported"
* code.coding[1] = http://snomed.info/sct#225908003 "Pain Score"
* subject = Reference(Patient/ex-patient)
* contained[+] = ex-patient
* effectiveDateTime = 2004-12-25T23:50:50-05:00
* valueQuantity.value = 11



Instance: in-sender
InstanceOf: Practitioner
Title: "Dummy inline Practitioner example sender"
Description: "Dummy inline Practitioner example for sender. No actual use of this resource other than an example sender"
//Usage: #example
Usage: #inline
* telecom.system = #email
* telecom.value = "JohnMoehrke@example.com"



// history - http://playgroundjungle.com/2018/02/origins-of-john-jacob-jingleheimer-schmidt.html
Instance:   ex-patient
InstanceOf: Patient
Title:      "Dummy Patient example"
Description: "Dummy patient example for completeness sake. No actual use of this resource other than an example target"
Usage: #inline
//Usage: #example
//* meta.security = http://terminology.hl7.org/CodeSystem/v3-ActReason#HTEST
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

Instance: ex-documentreference
InstanceOf: DocumentReference
Title: "Dummy DocumentReference example"
Description: "Dummy DocumentReference example for completeness sake. No actual use of this resource other than an example target"
Usage: #inline
//Usage: #example
//* meta.security = http://terminology.hl7.org/CodeSystem/v3-ActReason#HTEST
* status = #current
* content.attachment.title = "Hello World"
* content.attachment.contentType = #text/plain

Instance: ex-documentreference2
InstanceOf: DocumentReference
Title: "Dummy DocumentReference 2 example"
Description: "Dummy DocumentReference 2 example for completeness sake. No actual use of this resource other than an example target"
Usage: #inline
//Usage: #example
//* meta.security = http://terminology.hl7.org/CodeSystem/v3-ActReason#HTEST
* status = #current
* content.attachment.title = "Hello World"
* content.attachment.contentType = #text/plain



