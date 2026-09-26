This profile represents a pathological specimen obtained during breast cancer diagnosis or treatment — covering any physical sample submitted to pathology, including core needle biopsies, vacuum-assisted biopsies, and surgical resection specimens.

It constrains the MII Pathology Specimen profile (`MII_PR_Patho_Specimen`), which itself derives from the core FHIR `Specimen` resource. `Specimen` is the appropriate base because it is the FHIR-standard mechanism for carrying specimen identity, collection context, and anatomical source — all of which are required to unambiguously link a pathology result back to the tissue that was examined. Inheriting from the MII profile ensures alignment with the German Medical Informatics Initiative interoperability layer and reuses its extensions for laterality and location qualifiers.

Key must-support elements for implementers:

- **`type`** captures the nature of the specimen (e.g., biopsy, resectate) and is must-support; it maps to the logical model element `Pathologie.Praeparat.Art`.
- **`collection.bodySite`** (must-support) encodes the anatomical site of collection, including breast side and quadrant/localization qualifiers inherited from the parent MII profile via its `lateralityQualifier` and `locationQualifier` extensions; it maps to `Pathologie.Praeparat.Lokalisation` and `Pathologie.Praeparat.Seite`.
- **`collection.method`** (must-support) conveys the collection method and its timing context (intraoperative vs. pre-operative), mapping to `Pathologie.Praeparat.Entnahmemethode`.
- **`collection.collected[x]`** (must-support) records the date and time of specimen extraction, satisfying the logical model fields `Pathologie.DatumEntnahme` and `Pathologie.ZeitpunktEntnahme`.
- **`subject`** is restricted to `Reference(Patient)`, ensuring the specimen is always anchored to a patient record.

In the breast cancer care pathway this profile sits at the histopathological work-up stage: it is created when tissue is taken — whether at initial diagnostic biopsy or definitive surgery — and serves as the anchor that links procedural, anatomical, and temporal collection metadata to downstream pathology findings such as tumour type, grade, receptor status, and TNM staging. It is referenced by pathology observation and report profiles within the BIH Senologie Implementation Guide and corresponds to the logical model element `Pathologie.Praeparat`.
