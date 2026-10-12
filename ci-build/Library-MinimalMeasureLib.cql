// ============================================================================
// CQL Library: MinimalMeasureLib
//
// Minimalste Library zum Debuggen von HAPI Clinical Reasoning. Drei
// Defines die immer true zurueckgeben — bei N Patienten im Server
// muss die Measure dann N/N = 100 % melden.
//
// Iterative Vorgehensweise: erst sicherstellen dass diese Library
// funktioniert, dann Komplexitaet schrittweise erhoehen.
// ============================================================================

library MinimalMeasureLib version '0.1.0'

using FHIR version '4.0.1'

include FHIRHelpers version '4.0.1'

context Patient

define "InInitialPopulation":
  true

define "InDenominator":
  true

define "InNumerator":
  true

// Step 2: echte CQL-Logik
// Hat dieser Patient eine Mamma-Ca-Diagnose (SNOMED 254837009)?
define "HasMammaCa":
  exists([Condition] C
    where exists(C.code.coding c
      where c.system = 'http://snomed.info/sct' and c.code = '254837009'))

// Step 3: Hat Patient eine BET (OPS 5-870.*)?
define "HasBET":
  exists([Procedure] P
    where exists(P.code.coding c
      where c.system = 'http://fhir.de/CodeSystem/bfarm/ops' and c.code.startsWith('5-870')))
