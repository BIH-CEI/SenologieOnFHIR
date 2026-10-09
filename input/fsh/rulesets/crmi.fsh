// ─────────────────────────────────────────────────────────────────────────────
// CRMI (Canonical Resource Management Infrastructure) — Metadaten-RuleSets
//
// Vorbild: kerndatensatzmodul-onkologie, input/fsh/rulesets/crmi.fsh. Die IG-
// Ressource claimt die CRMI-Profile in sushi-config.yaml (meta.profile); diese
// RuleSets lassen die einzelnen Artefakte die passenden CRMI-Profile claimen.
// Aufloesbar durch die Dependency hl7.fhir.uv.crmi in sushi-config.yaml.
//
// Ein Insert pro Artefakt-Deklaration, direkt nach dem Header:
//   Profile (FHIR-Core-Parent)   → SenoCRMIProfile
//   Profile (MII-Parent)         → SenoCRMIProfileDerived
//   Extension / Logical          → SenoCRMIExtension / SenoCRMILogicalModel
//   ValueSet / CodeSystem        → SenoCRMIValueSet / SenoCRMICodeSystem
//   Instance ConceptMap / Questionnaire / Measure / Library → SenoCRMI<Typ>
//
// Governance (Entscheid 2026-10-09): Author/Editor = BIH, Reviewer/Endorser =
// Deutsche Gesellschaft fuer Senologie (DGS). Kein resource-approvalDate und
// keine resource-effectivePeriod, solange der IG status draft traegt.
// Topic: NCI Thesaurus C4872 "Breast Carcinoma".
//
// Datum, Version und package-source stehen in version.fsh (CRMIDate,
// CRMIMetaLicenseAndSource) — bei jedem Release dort mitziehen.
//
// ALLE Root-Extensions sind URL-keyed (^extension[<url>]) statt ^extension[+]:
// SUSHI kopiert die Root-Extensions des Parent-Profils in das abgeleitete
// Profil. Mit [+] kollidiert das mit den geerbten MII-Eintraegen oder
// ueberschreibt sie still; URL-Keying ueberschreibt gezielt den jeweils
// ersten Eintrag einer URL-Gruppe.
// ─────────────────────────────────────────────────────────────────────────────

// ── Gemeinsamer Metadatenblock (Caret-Pfade: Profile, Extension, Logical, VS, CS)

RuleSet: SenoCRMIMetadata
* ^extension[http://hl7.org/fhir/StructureDefinition/artifact-versionPolicy].valueCodeableConcept = http://terminology.hl7.org/CodeSystem/artifact-version-policy-codes#package "Package"
* ^extension[http://hl7.org/fhir/StructureDefinition/artifact-versionAlgorithm].valueCoding = http://hl7.org/fhir/version-algorithm#semver "SemVer"
// Topic feldweise auf coding[0]: eine Zuweisung des ganzen CodeableConcept haengt
// bei MII-Parents ein zweites Coding neben das geerbte C3262 "Neoplasm".
* ^extension[http://hl7.org/fhir/StructureDefinition/artifact-topic][0].valueCodeableConcept.coding[0].system = "http://ncicb.nci.nih.gov/xml/owl/EVS/Thesaurus.owl"
* ^extension[http://hl7.org/fhir/StructureDefinition/artifact-topic][0].valueCodeableConcept.coding[0].code = #C4872
* ^extension[http://hl7.org/fhir/StructureDefinition/artifact-topic][0].valueCodeableConcept.coding[0].display = "Breast Carcinoma"
* ^extension[http://hl7.org/fhir/StructureDefinition/artifact-author].valueContactDetail.name = "Berlin Institute of Health at Charité (BIH)"
* ^extension[http://hl7.org/fhir/StructureDefinition/artifact-author].valueContactDetail.telecom[0].system = #email
* ^extension[http://hl7.org/fhir/StructureDefinition/artifact-author].valueContactDetail.telecom[0].value = "thomas.debertshaeuser@charite.de"
* ^extension[http://hl7.org/fhir/StructureDefinition/artifact-editor].valueContactDetail.name = "Berlin Institute of Health at Charité (BIH)"
* ^extension[http://hl7.org/fhir/StructureDefinition/artifact-editor].valueContactDetail.telecom[0].system = #url
* ^extension[http://hl7.org/fhir/StructureDefinition/artifact-editor].valueContactDetail.telecom[0].value = "https://www.bihealth.org"
* ^extension[http://hl7.org/fhir/StructureDefinition/artifact-reviewer][0].valueContactDetail.name = "Deutsche Gesellschaft für Senologie (DGS)"
* ^extension[http://hl7.org/fhir/StructureDefinition/artifact-reviewer][0].valueContactDetail.telecom[0].system = #url
* ^extension[http://hl7.org/fhir/StructureDefinition/artifact-reviewer][0].valueContactDetail.telecom[0].value = "https://www.senologie.org"
* ^extension[http://hl7.org/fhir/StructureDefinition/artifact-endorser][0].valueContactDetail.name = "Deutsche Gesellschaft für Senologie (DGS)"
* ^extension[http://hl7.org/fhir/StructureDefinition/artifact-endorser][0].valueContactDetail.telecom[0].system = #url
* ^extension[http://hl7.org/fhir/StructureDefinition/artifact-endorser][0].valueContactDetail.telecom[0].value = "https://www.senologie.org"

RuleSet: SenoCRMIKnowledgeCapabilities
* ^extension[http://hl7.org/fhir/StructureDefinition/cqf-knowledgeCapability][0].valueCode = #shareable
* ^extension[http://hl7.org/fhir/StructureDefinition/cqf-knowledgeCapability][1].valueCode = #publishable

// ── StructureDefinition ──────────────────────────────────────────────────────

RuleSet: SenoCRMIStructureDefinition
* insert PR_CS_VS_Version
* ^meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-shareablestructuredefinition"
* ^meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-publishablestructuredefinition"
* insert CRMIMetaLicenseAndSource
// crmi-shareablestructuredefinition verlangt experimental 1..1, publishable date 1..1
* ^experimental = false
* insert CRMIDate
* insert SenoCRMIKnowledgeCapabilities
* insert SenoCRMIMetadata

RuleSet: SenoCRMIProfile
* insert SenoCRMIStructureDefinition
* ^extension[http://hl7.org/fhir/StructureDefinition/artifact-usage].valueMarkdown = "Use this profile as the technical FHIR representation of the corresponding element group of the Senologie core dataset logical model. The profile constrains a base FHIR resource for the documentation of breast cancer care by specifying how elements are used, which elements are required, and which extensions and terminology bindings apply. Implementers should produce and consume resource instances that conform to this profile when exchanging Senologie core dataset data."

// Fuer Profile mit CRMI-tragendem MII-Parent (Onkologie, MTB; NICHT Patho und
// Bildgebung, deren Profile keine CRMI-Root-Extensions haben): die Eltern
// tragen je ZWEI Reviewer und Endorser
// (Interoperability Working Group, National Steering Committee). SUSHI kopiert
// sie mit; FSH kann Root-Extensions nicht loeschen, nur ueberschreiben. Der
// zweite Eintrag wird deshalb ebenfalls mit der DGS belegt — eine Dublette,
// aber keine fremde Governance-Aussage. Bekannter Rest, bis SUSHI das Kopieren
// der Root-Extensions abstellt.
RuleSet: SenoCRMIProfileDerived
* insert SenoCRMIProfile
* ^extension[http://hl7.org/fhir/StructureDefinition/artifact-reviewer][1].valueContactDetail.name = "Deutsche Gesellschaft für Senologie (DGS)"
* ^extension[http://hl7.org/fhir/StructureDefinition/artifact-reviewer][1].valueContactDetail.telecom[0].system = #url
* ^extension[http://hl7.org/fhir/StructureDefinition/artifact-reviewer][1].valueContactDetail.telecom[0].value = "https://www.senologie.org"
* ^extension[http://hl7.org/fhir/StructureDefinition/artifact-endorser][1].valueContactDetail.name = "Deutsche Gesellschaft für Senologie (DGS)"
* ^extension[http://hl7.org/fhir/StructureDefinition/artifact-endorser][1].valueContactDetail.telecom[0].system = #url
* ^extension[http://hl7.org/fhir/StructureDefinition/artifact-endorser][1].valueContactDetail.telecom[0].value = "https://www.senologie.org"

RuleSet: SenoCRMIExtension
* insert SenoCRMIStructureDefinition
* ^extension[http://hl7.org/fhir/StructureDefinition/artifact-usage].valueMarkdown = "Use this extension to exchange content of the Senologie core dataset logical model that is not represented in the FHIR core resource structure."

RuleSet: SenoCRMILogicalModel
* insert SenoCRMIStructureDefinition
* ^extension[http://hl7.org/fhir/StructureDefinition/artifact-usage].valueMarkdown = "Use this logical model as a domain-oriented information model for the documentation of breast cancer care. It describes the content of a dataset in clinical terms and bridges the conceptual specification and the corresponding technical FHIR profiles and mappings. It is not intended to be exchanged as a concrete FHIR resource instance."

// ── ValueSet / CodeSystem ────────────────────────────────────────────────────

RuleSet: SenoCRMIValueSet
* insert PR_CS_VS_Version
* ^meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-shareablevalueset"
* ^meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-publishablevalueset"
* ^meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-computablevalueset"
* insert CRMIMetaLicenseAndSource
* ^experimental = false
* insert CRMIDate
* insert SenoCRMIKnowledgeCapabilities
* ^extension[http://hl7.org/fhir/StructureDefinition/cqf-knowledgeCapability][2].valueCode = #computable
* insert SenoCRMIMetadata

RuleSet: SenoCRMICodeSystem
* insert PR_CS_VS_Version
* ^meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-shareablecodesystem"
* ^meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-publishablecodesystem"
* insert CRMIMetaLicenseAndSource
* ^experimental = false
* insert CRMIDate
* insert SenoCRMIKnowledgeCapabilities
* insert SenoCRMIMetadata

// ── Instanzen (InstanceOf: …, Usage: #definition) — Pfade ohne Caret ─────────
// Der Insert steht direkt nach dem Instanz-Header, damit ein in der Instanz
// selbst gesetztes date / experimental / version Vorrang behaelt.

RuleSet: SenoCRMIInstanceBase
* insert CRMIMetaLicenseAndSourceInstance
* insert Version
* insert CRMIDateInstance
* extension[http://hl7.org/fhir/StructureDefinition/cqf-knowledgeCapability][0].valueCode = #shareable
* extension[http://hl7.org/fhir/StructureDefinition/cqf-knowledgeCapability][1].valueCode = #publishable
* extension[http://hl7.org/fhir/StructureDefinition/artifact-versionPolicy].valueCodeableConcept = http://terminology.hl7.org/CodeSystem/artifact-version-policy-codes#package "Package"
* extension[http://hl7.org/fhir/StructureDefinition/artifact-versionAlgorithm].valueCoding = http://hl7.org/fhir/version-algorithm#semver "SemVer"

// ConceptMap und Questionnaire haben in R4 keine nativen Felder fuer Topic und
// Mitwirkende → artifact-*-Extensions.
RuleSet: SenoCRMIInstanceContributorExtensions
* extension[http://hl7.org/fhir/StructureDefinition/artifact-topic].valueCodeableConcept = http://ncicb.nci.nih.gov/xml/owl/EVS/Thesaurus.owl#C4872 "Breast Carcinoma"
* extension[http://hl7.org/fhir/StructureDefinition/artifact-author].valueContactDetail.name = "Berlin Institute of Health at Charité (BIH)"
* extension[http://hl7.org/fhir/StructureDefinition/artifact-author].valueContactDetail.telecom[0].system = #email
* extension[http://hl7.org/fhir/StructureDefinition/artifact-author].valueContactDetail.telecom[0].value = "thomas.debertshaeuser@charite.de"
* extension[http://hl7.org/fhir/StructureDefinition/artifact-editor].valueContactDetail.name = "Berlin Institute of Health at Charité (BIH)"
* extension[http://hl7.org/fhir/StructureDefinition/artifact-editor].valueContactDetail.telecom[0].system = #url
* extension[http://hl7.org/fhir/StructureDefinition/artifact-editor].valueContactDetail.telecom[0].value = "https://www.bihealth.org"
* extension[http://hl7.org/fhir/StructureDefinition/artifact-reviewer].valueContactDetail.name = "Deutsche Gesellschaft für Senologie (DGS)"
* extension[http://hl7.org/fhir/StructureDefinition/artifact-reviewer].valueContactDetail.telecom[0].system = #url
* extension[http://hl7.org/fhir/StructureDefinition/artifact-reviewer].valueContactDetail.telecom[0].value = "https://www.senologie.org"
* extension[http://hl7.org/fhir/StructureDefinition/artifact-endorser].valueContactDetail.name = "Deutsche Gesellschaft für Senologie (DGS)"
* extension[http://hl7.org/fhir/StructureDefinition/artifact-endorser].valueContactDetail.telecom[0].system = #url
* extension[http://hl7.org/fhir/StructureDefinition/artifact-endorser].valueContactDetail.telecom[0].value = "https://www.senologie.org"

// Measure und Library tragen topic / author / editor / reviewer / endorser in
// R4 NATIV; die artifact-*-Extensions sind dort nicht zulaessig.
RuleSet: SenoCRMIInstanceContributorNative
* topic[0] = http://ncicb.nci.nih.gov/xml/owl/EVS/Thesaurus.owl#C4872 "Breast Carcinoma"
* author[0].name = "Berlin Institute of Health at Charité (BIH)"
* author[0].telecom[0].system = #email
* author[0].telecom[0].value = "thomas.debertshaeuser@charite.de"
* editor[0].name = "Berlin Institute of Health at Charité (BIH)"
* editor[0].telecom[0].system = #url
* editor[0].telecom[0].value = "https://www.bihealth.org"
* reviewer[0].name = "Deutsche Gesellschaft für Senologie (DGS)"
* reviewer[0].telecom[0].system = #url
* reviewer[0].telecom[0].value = "https://www.senologie.org"
* endorser[0].name = "Deutsche Gesellschaft für Senologie (DGS)"
* endorser[0].telecom[0].system = #url
* endorser[0].telecom[0].value = "https://www.senologie.org"

RuleSet: SenoCRMIConceptMap
* meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-shareableconceptmap"
* meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-publishableconceptmap"
* experimental = false
* insert SenoCRMIInstanceBase
* insert SenoCRMIInstanceContributorExtensions

RuleSet: SenoCRMIQuestionnaire
* meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-shareablequestionnaire"
* meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-publishablequestionnaire"
* experimental = false
* insert SenoCRMIInstanceBase
* insert SenoCRMIInstanceContributorExtensions

RuleSet: SenoCRMIMeasure
* meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-shareablemeasure"
* meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-publishablemeasure"
* experimental = false
* insert SenoCRMIInstanceBase
* insert SenoCRMIInstanceContributorNative

RuleSet: SenoCRMILibrary
* meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-shareablelibrary"
* meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-publishablelibrary"
* experimental = false
* insert SenoCRMIInstanceBase
* insert SenoCRMIInstanceContributorNative
