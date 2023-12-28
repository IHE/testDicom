# testDicom

This creates and example AuditEvent with two valueSets. One assembles some DICOM codes. The other calls for pulling in a DICOM valueset.

ci-build - http://build.fhir.org/ig/JohnMoehrke/testDicom/branches/master/index.html


chat stream https://chat.fhir.org/#narrow/stream/179252-IG-creation/topic/fhir.2Edicom.20has.20no.20ImplementationGuide.20resource

## Search on OID

Added an extension of type oid, and a search parameter to search that oid. IG publisher does not appear to complain about this (while fhir core fails - https://github.com/HL7/fhir/pull/3021)
