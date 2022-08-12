# testDicom

This creates and example AuditEvent with two valueSets. One assembles some DICOM codes. The other calls for pulling in a DICOM valueset.

Note this IG is depending on the fhir.dicom IG so as to have access to DICOM defined vocabulary published within. See [http://fhir.org/packages/fhir.dicom/](http://fhir.org/packages/fhir.dicom/)

## success
* valueSet made up of [some DICOM Modalities](ValueSet-FewModalitiesVS.html)
  * build **success**. as expected
* expansion valueSet made up of [all modalities in a DICOM defined valueSet](ValueSet-JustModalitiesVS.html)
  * build expands the valueset **success**. 
* example [using valid DICOM code, but not a modality](ImagingStudy-ex-imagingstudy-withBadCode.html)
  * build rightly complains that this is not a valid code in the valueSet. **success**
  * The Coding provided (http://dicom.nema.org/resources/ontology/DCM#PRINT) is not in the value set http://johnmoehrke.github.io/testDicom/ValueSet/JustModalitiesVS, and a code is required from this value set. (error message = Not in value set http://johnmoehrke.github.io/testDicom/ValueSet/JustModalitiesVS ([]))


## warnings
* profile [trivial](StructureDefinition-JohnMoehrke.testDicom.testImage.trivial.html) is used to show that there are two warnings the IG publisher throws regardless of the profiling. These warnings are not related to the scope of this test IG, but do show some issue with ImagingStudy in FHIR core. --> Thus these are put in the **ignore warnings**.
  * The valueSet reference http://www.rsna.org/RadLex_Playbook.aspx on element ImagingStudy.procedureCode could not be resolved
  * The valueSet reference http://dicom.nema.org/medical/dicom/current/output/chtml/part04/sect_B.5.html#table_B.5-1 on element ImagingStudy.series.instance.sopClass could not be resolved
* profile [using internal valueSets](StructureDefinition-JohnMoehrke.testDicom.testImage.vs.html)
* profile [using dicom valueSets](StructureDefinition-JohnMoehrke.testDicom.testImage.bind.html)




## Grahame says these are okay
* profile [binding the .modality to the DICOM defined valueSet](StructureDefinition-JohnMoehrke.testDicom.testImage.bind.html)
  * **why can't this show a valueSet, where as it is just a link to DICOM**
* example [using valid code, but with profile using valueSets](ImagingStudy-ex-imagingstudyVs.html)
  * build complains that the valid code is not in the given valueset... 
    * note that the valueSet does expand now
  * The Coding provided (http://dicom.nema.org/resources/ontology/DCM#AR) is in the expansion value set http://johnmoehrke.github.io/testDicom/ValueSet/JustModalitiesVS, and a code is required from this value set. (error message = 	The Coding provided (http://dicom.nema.org/resources/ontology/DCM#AR) is not in the value set http://johnmoehrke.github.io/testDicom/ValueSet/JustModalitiesVS, and a code is required from this value set....)

