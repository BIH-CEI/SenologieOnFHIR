// switch version of all conformance resources here
RuleSet: Version
* version = "0.9.3"

RuleSet: PR_CS_VS_Version
* ^version = "0.9.3"

// ── CRMI: Datum und Paket-Herkunft (bei jedem Release mitziehen) ─────────────
// crmi-publishable* verlangt date 1..1. package-source wiederholt packageId,
// Version und Canonical aus sushi-config.yaml.
RuleSet: CRMIDate
* ^date = "2026-10-09"

RuleSet: CRMIDateInstance
* date = "2026-10-09"

RuleSet: CRMIMetaLicenseAndSource
* ^meta.extension[+].url = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-license"
* ^meta.extension[=].valueCode = #CC-BY-4.0
* ^meta.extension[+].url = "http://hl7.org/fhir/StructureDefinition/package-source"
* ^meta.extension[=].extension[+].url = "packageId"
* ^meta.extension[=].extension[=].valueId = "kds-senologie"
* ^meta.extension[=].extension[+].url = "version"
* ^meta.extension[=].extension[=].valueString = "0.9.3"
* ^meta.extension[=].extension[+].url = "uri"
* ^meta.extension[=].extension[=].valueUri = "https://www.senologie.org/fhir"

RuleSet: CRMIMetaLicenseAndSourceInstance
* meta.extension[+].url = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-license"
* meta.extension[=].valueCode = #CC-BY-4.0
* meta.extension[+].url = "http://hl7.org/fhir/StructureDefinition/package-source"
* meta.extension[=].extension[+].url = "packageId"
* meta.extension[=].extension[=].valueId = "kds-senologie"
* meta.extension[=].extension[+].url = "version"
* meta.extension[=].extension[=].valueString = "0.9.3"
* meta.extension[=].extension[+].url = "uri"
* meta.extension[=].extension[=].valueUri = "https://www.senologie.org/fhir"
