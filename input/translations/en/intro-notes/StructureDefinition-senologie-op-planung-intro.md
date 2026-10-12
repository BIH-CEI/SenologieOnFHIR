The **BIH Senologie OP Planung** profile represents a surgical planning order for breast cancer patients, capturing all pre-operative decisions made prior to a scheduled breast surgery.

This profile constrains the FHIR `ServiceRequest` resource. `ServiceRequest` is the appropriate base for a surgical plan because it models a request or order for a procedure — including the intended procedure type, the responsible performer, timing, and clinical rationale — while supporting a lifecycle (draft → active → completed/revoked) that mirrors the planning workflow from initial documentation through final authorization and execution.

The following elements are marked Must Support and warrant implementer attention:

- **`status`** — drives the planning lifecycle: `draft` while the form is being completed, `active` once the plan is confirmed and the surgery is pending, `revoked` if the plan is cancelled before the procedure, and `completed` once a corresponding `Procedure` exists.
- **`intent`** — fixed to `#plan`; systems SHALL reject resources with any other intent value.
- **`code`** — encodes the type of planned operation (e.g., female genital organs, laterality); binding is expected to align with local or national procedure code systems.
- **`subject`** — constrained to `Patient`; no group or device references are permitted.
- **`bodySite.coding`** — captures laterality (left / right / bilateral) sourced from the dotbase field "Seite".
- **Extension `operationsDuration`** — records planned operating time in minutes.
- **Extension `tumorConferenceConsent`** — boolean flag documenting whether a tumor board recommendation was obtained prior to surgery.
- **Pre-operative extensions** (`preOpMarkierung`, `preOpBlutabnahme`, `preOpAntibiotikatherapie`, `operatingTableSetup`) — structured flags for standard pre-operative checklist items (marking, blood draw, antibiotic prophylaxis, table positioning/cart setup).

Within the breast cancer care pathway this profile sits at the intersection of multidisciplinary tumor board decision-making and the operating room scheduling process. It is typically created after staging and receptor-status results are available and a surgical strategy has been agreed upon, and it precedes the `Procedure` resource that documents the surgery as performed.
