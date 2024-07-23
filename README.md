# testDicom

This creates and example AuditEvent with two valueSets. One assembles some DICOM codes. The other calls for pulling in a DICOM valueset.

ci-build - http://build.fhir.org/ig/JohnMoehrke/testDicom/branches/master/index.html


chat stream https://chat.fhir.org/#narrow/stream/179252-IG-creation/topic/fhir.2Edicom.20has.20no.20ImplementationGuide.20resource

## Search on OID

Added an extension of type oid, and a search parameter to search that oid. IG publisher does not appear to complain about this (while fhir core fails - https://github.com/HL7/fhir/pull/3021)

## DICOM recognized URI for SOP Class

Note that `http://dicom.nema.org/resources/ontology/DCMUID` should be used in FHIR R4 on sopClass as the .system value when using a DICOM recognized SOP Class UID.

## Example OID root

[ITU-T](https://oidref.com/2.999) has identified the root `2.999` for use in examples

[RFC5612](https://datatracker.ietf.org/doc/html/rfc5612) has identified the root `1.3.6.1.4.1.32473` for use in examples.

