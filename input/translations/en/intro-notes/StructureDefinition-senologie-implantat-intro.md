The **BIH Senologie Brustimplantat** profile documents a breast implant associated with a patient — capturing device identity and traceability data relevant to surgical and reconstructive care in the context of breast cancer treatment.

This profile constrains the base FHIR [`Device`](https://hl7.org/fhir/R4/device.html) resource. `Device` is the appropriate choice because a breast implant is a physical medical device that requires unique identification and manufacturer tracking; it is not a medication, observation, or procedure in itself, but an implanted item whose identity, lot number, and serial number must be persistently recorded for post-market surveillance and patient safety purposes.

The following elements are marked **Must Support**:

- `status` — required for IPS conformance; indicates whether the device record is active, inactive, or entered-in-error.
- `type` — classifies the implant (e.g., breast implant type); extensible coding is expected.
- `manufacturer` — free-text name of the implant manufacturer, recorded as a string rather than a structured reference.
- `lotNumber` — the REF number (catalogue/lot identifier) of the implant, essential for recall and traceability workflows.
- `serialNumber` — the unique serial number of the individual implant unit.

In the breast cancer care pathway, this profile is relevant wherever surgical reconstruction or augmentation is documented — including primary reconstruction after mastectomy, revision surgery, and implant exchange. Capturing manufacturer, lot, and serial number supports regulatory reporting obligations (e.g., implant registries), facilitates recall management, and ensures a complete surgical history is available during follow-up and survivorship care.
