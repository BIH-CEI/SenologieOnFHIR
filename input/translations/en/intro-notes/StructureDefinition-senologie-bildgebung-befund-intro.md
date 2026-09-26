This profile represents a completed breast imaging report — the structured, signed-off finding document produced after mammography, ultrasound, MRI, or digital breast tomosynthesis of the breast.

It constrains the core FHIR `DiagnosticReport` resource because `DiagnosticReport` is the standard mechanism for conveying the outcome of a diagnostic imaging procedure: it ties together the modality code, the examination date, the interpreting clinician, individual observation results, a narrative conclusion, and optionally an attached document — all of which are essential components of a radiology or senology report.

Key must-support and design constraints for implementers:

- **`status`** is fixed to `#final`, reflecting that only completed, attested reports are exchanged under this profile.
- **`category`** is fixed to `RAD` (Radiology) and is must-support.
- **`code`** carries pre-defined LOINC/RADLEX slices for the four supported modalities — mammography (`24606-6`), breast ultrasound (`24601-7`), breast MRI (`30794-2`), and digital breast tomosynthesis (RadLex `RID40755`). Slicing is open, so additional codes are permitted.
- **`effectiveDateTime`** (must-support) records the date of the examination per modality.
- **`result`** references individual `Observation` resources for structured findings such as BI-RADS category, ACR breast density, mass lesion characterization, microcalcification assessment, and axillary lymph node status on each side.
- **`conclusion`** holds the free-text overall summary of the report.
- A custom extension (`EX_Senologie_ExaminationLocation`) optionally captures the physical site where imaging was performed.

In the breast cancer care pathway this profile sits at the imaging-diagnostics stage: it is generated after initial screening or diagnostic breast imaging and feeds downstream clinical decision-making, including biopsy planning, tumour board documentation, and therapy response monitoring. It links to the logical model element `BildgebungMamma` defined in the BIH Senologie Implementation Guide.
