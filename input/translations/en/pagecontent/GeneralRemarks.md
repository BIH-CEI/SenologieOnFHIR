# Senologie-KDS

General Description
Starting with the documentation of surgical procedures, we aim to develop — in collaboration with the Breast Centre of the Charité — a universally applicable, publicly published, harmonised, semantically annotated, and operationally executable dataset.

## Form-First Representation

The mapping of data points via forms is oriented towards the actual clinical workflow.
The forms are stored as such. In the background, however, the results are converted into domain-based resources — from a surgical procedure documentation, individual procedures, implants, etc. are therefore extracted.

## Operations as Sub-procedures

Even though in everyday clinical practice a surgical intervention is referred to as a single operation (Operation), a precise data representation requires the distinction into several sub-procedures.
This includes, for example:
* identical or similar interventions on both sides (left, right) as separate procedures
* intraoperative removal of lymph nodes in the case of confirmed lymph node metastasis as a separate procedure from the resection
* reconstruction (autologous or implant-based) as a separate procedure from the resection

For simplification, a parent Procedure can be defined, to which the sub-procedures refer via `Procedure.partOf`. This parent procedure should then be referenced externally. Exception: Observations and adverse events/revisions that explicitly relate to a specific sub-procedure (e.g. implant revision).
