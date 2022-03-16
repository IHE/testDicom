# testDicom

This creates and example AuditEvent with two valueSets. One assembles some DICOM codes. The other calls for pulling in a DICOM valueset.

* not clear if the current way of depending on dicom is proper, as do get an information
  * The canonical URL for an Implementation Guide must point directly to the implementation guide resource, not to the Implementation Guide as a whole
* successful valueSet made up of [some DICOM Modalities](ValueSet-FewModalitiesVS.html)
  * build **success**. as expected
* no expansion valueSet made up of [all modalities in a DICOM defined valueSet](ValueSet-JustModalitiesVS.html)
  * build makes a valueSet, 
  * build expands the valueset **success**. 
* profile [binding the .modality to the DICOM defined valueSet](StructureDefinition-JohnMoehrke.testDicom.testImage.bind.html)
  * **why can't this show a valueSet, where as it is just a link to DICOM**
  * build throws 4 warnings - when depends on fhir.dicom
  * warning	The valueSet reference https://dicom.nema.org/medical/dicom/current/output/chtml/part16/sect_CID_29.html on element ImagingStudy.modality could not be resolved
  * StructureDefinition.snapshot.element[11].binding	warning	The valueSet reference https://dicom.nema.org/medical/dicom/current/output/chtml/part16/sect_CID_29.html on element ImagingStudy.modality could not be resolved
  * StructureDefinition.snapshot.element[22].binding	warning	The valueSet reference http://www.rsna.org/RadLex_Playbook.aspx on element ImagingStudy.procedureCode could not be resolved
  * StructureDefinition.snapshot.element[53].binding	warning	The valueSet reference http://dicom.nema.org/medical/dicom/current/output/chtml/part04/sect_B.5.html#table_B.5-1 on element ImagingStudy.series.instance.sopClass could not be resolved
* profile [using internal valueSets](StructureDefinition-JohnMoehrke.testDicom.testImage.vs.html)
* example [using valid code, but with profile using valueSets](ImagingStudy-ex-imagingstudy.html)
  * build complains that the valid code is not in the given valueset... because the given valueset doesn't expand
  * The Coding provided (http://dicom.nema.org/resources/ontology/DCM#AR) is not in the value set http://johnmoehrke.github.io/testDicom/ValueSet/JustModalitiesVS, and a code is required from this value set. (error message = Not in value set http://johnmoehrke.github.io/testDicom/ValueSet/JustModalitiesVS ([]))
* example [using valid DICOM code, but not a modality](ImagingStudy-ex-imagingstudy-withBadCode.html)
  * build rightly complains that this is not a valid code in the valueSet. **success**
  * The Coding provided (http://dicom.nema.org/resources/ontology/DCM#PRINT) is not in the value set http://johnmoehrke.github.io/testDicom/ValueSet/JustModalitiesVS, and a code is required from this value set. (error message = Not in value set http://johnmoehrke.github.io/testDicom/ValueSet/JustModalitiesVS ([]))

