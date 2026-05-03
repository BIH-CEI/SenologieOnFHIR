# Fall 2: CT Thorax/Abdomen (Staging) - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Fall 2: CT Thorax/Abdomen (Staging)**

## Example DiagnosticReport: Fall 2: CT Thorax/Abdomen (Staging)

Profile: [BIH Senologie Bildgebung Sonstige](StructureDefinition-senologie-bildgebung-sonstige.md)

## CT Chest and Abdomen (Radiology) 

| | |
| :--- | :--- |
| Subject | Lena Hoffmann Female, DoB: 1980-09-28 ( http://fhir.bih-charite.de/sid/patient-id#SENO-2025-002) |
| When For | 2025-02-14 |

**Report Details**

Kein Nachweis pulmonaler oder hepatischer Metastasen. Kein pathologischer Befund im Abdomen. Bekannte Mammatumor rechts.



## Resource Content

```json
{
  "resourceType" : "DiagnosticReport",
  "id" : "Fall2-Bildgebung-CT",
  "meta" : {
    "profile" : ["https://www.senologie.org/fhir/StructureDefinition/senologie-bildgebung-sonstige"]
  },
  "status" : "final",
  "category" : [{
    "coding" : [{
      "system" : "http://terminology.hl7.org/CodeSystem/v2-0074",
      "code" : "RAD",
      "display" : "Radiology"
    }]
  }],
  "code" : {
    "coding" : [{
      "system" : "http://loinc.org",
      "code" : "87858-9",
      "display" : "CT Chest and Abdomen"
    },
    {
      "system" : "http://snomed.info/sct",
      "code" : "169069000",
      "display" : "CT of chest and abdomen"
    }]
  },
  "subject" : {
    "reference" : "Patient/Fall2-Patient-Lena-Hoffmann"
  },
  "effectiveDateTime" : "2025-02-14",
  "conclusion" : "Kein Nachweis pulmonaler oder hepatischer Metastasen. Kein pathologischer Befund im Abdomen. Bekannte Mammatumor rechts."
}

```
