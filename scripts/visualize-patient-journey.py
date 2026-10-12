#!/usr/bin/env python3
"""
Visualisiert einen Beispielfall aus fsh-generated/resources/ als

  1. Zeitstrahl (timeline.svg)  — was wann dokumentiert wurde, in Bahnen
  2. Ressourcen-Graph (graph.svg) — welche FHIR-Ressourcen entstehen und wie
     sie aufeinander verweisen

Usage:
    python3 scripts/visualize-patient-journey.py 10 [--out DIR]

Die Beschriftung ist englisch (fuer Vortraege); sie wird regelbasiert aus
Ressourcentyp, Profil und Code abgeleitet. Ohne externe Abhaengigkeiten.
"""
import argparse
import datetime as dt
import glob
import html
import json
import re
from pathlib import Path

REPO = Path(__file__).resolve().parents[1]
GEN = REPO / "fsh-generated" / "resources"

LANES = ["Genetics", "Imaging", "Pathology", "Tumour board", "Surgery",
         "Systemic therapy", "Side effects", "Radiation", "Follow-up"]
COLORS = {"Genetics": "#6D2158", "Imaging": "#12B5EA", "Pathology": "#0B9B72", "Tumour board": "#F2B705",
          "Surgery": "#F48C64", "Systemic therapy": "#1C7293", "Side effects": "#B83B5E",
          "Radiation": "#3C4B57", "Follow-up": "#7A8B99"}
OPS = [("5-870", "Breast-conserving surgery"), ("5-872", "Mastectomy"), ("5-401", "Sentinel node biopsy"),
       ("5-402", "Axillary dissection"), ("5-886", "Implant reconstruction"), ("8-52", "Radiotherapy"),
       ("8-54", "Chemotherapy")]


def load(fall):
    res = []
    for f in sorted(glob.glob(str(GEN / "*.json"))):
        d = json.load(open(f))
        if d.get("id", "").startswith(f"Fall{fall}-") and d["resourceType"] != "QuestionnaireResponse":
            res.append(d)
    return res


def codes(cc):
    return [c.get("code", "") for c in (cc or {}).get("coding", [])]


def profile(r):
    return " ".join(p.split("/")[-1] for p in r.get("meta", {}).get("profile", []))


def date_of(r):
    for k in ("effectiveDateTime", "performedDateTime", "date", "onsetDateTime", "authoredOn"):
        if r.get(k):
            return r[k][:10], None
    for k in ("performedPeriod", "effectivePeriod", "period"):
        if r.get(k, {}).get("start"):
            return r[k]["start"][:10], (r[k].get("end") or "")[:10] or None
    return None, None


def classify(r):
    """-> (lane, label) oder None."""
    t, p, rid = r["resourceType"], profile(r), r["id"]
    if t == "Observation":
        if "Keimbahn" in rid or "Mutation" in rid:
            gene = next((c.get("valueCodeableConcept", {}).get("coding", [{}])[0].get("display", "")
                         for c in r.get("component", []) if "48018-6" in codes(c.get("code"))), "")
            val = (r.get("valueCodeableConcept", {}).get("coding", [{}])[0].get("display", ""))
            return "Genetics", f"Germline {gene}: {val}".strip()
        if "bildgebung" in p:
            return "Imaging", "BI-RADS assessment"
        if "er-status" in p:
            return "Pathology", "ER status"
        if "pr-status" in p:
            return "Pathology", "PR status"
        if "her2" in p:
            return "Pathology", "HER2 status"
        if "ki67" in p:
            return "Pathology", f"Ki-67 {r.get('valueQuantity', {}).get('value', '')} %"
        if "pdl1" in p:
            return "Pathology", "PD-L1"
        if "follow-up" in p or "Verlauf" in rid:
            return "Follow-up", "Tumour status"
        if "ECOG" in rid or "ecog" in p:
            return "Follow-up", "ECOG"
        if "Vitalstatus" in rid:
            return "Follow-up", "Vital status"
        if "komplikation" in p:
            return "Side effects", "Surgical complication"
        return None
    if t == "DiagnosticReport":
        return ("Imaging", "Mammography report") if "bildgebung" in p else ("Pathology", "Pathology report")
    if t == "CarePlan":
        return "Tumour board", "Tumour board recommendation"
    if t == "AdverseEvent":
        ev = r.get("event", {}).get("coding", [{}])[0].get("display", "Adverse event")
        gr = r.get("seriousness", {}).get("coding", [{}])[0].get("code", "")
        return "Side effects", f"{ev}, CTCAE grade {gr}"
    if t == "Procedure":
        cs = codes(r.get("code"))
        for prefix, label in OPS:
            if any(c.startswith(prefix) for c in cs):
                lane = "Radiation" if prefix == "8-52" else "Systemic therapy" if prefix == "8-54" else "Surgery"
                return lane, label
        if "strahlentherapie" in p:
            return "Radiation", "Radiotherapy"
        if "systemtherapie" in p:
            return "Systemic therapy", "Systemic therapy"
        if "operation" in p:
            return "Surgery", "Surgery"
        return None
    if t == "MedicationStatement" and "systemtherapie" in p:
        return "Systemic therapy", r.get("medicationCodeableConcept", {}).get("coding", [{}])[0].get("display", "Drug")
    return None


def esc(s):
    return html.escape(str(s))


def timeline(res, title):
    ev = []
    for r in res:
        c = classify(r)
        s, e = date_of(r)
        if c and s:
            ev.append((c[0], c[1], dt.date.fromisoformat(s), dt.date.fromisoformat(e) if e else None))
    if not ev:
        return ""
    lanes = [l for l in LANES if any(x[0] == l for x in ev)]
    d0 = min(x[2] for x in ev).replace(day=1)
    d1 = max((x[3] or x[2]) for x in ev)
    d1 = (d1.replace(day=28) + dt.timedelta(days=5)).replace(day=1)
    W, LEFT, TOP, LH = 1600, 270, 96, 78
    H = TOP + LH * len(lanes) + 50
    span = (d1 - d0).days
    X = lambda d: LEFT + (W - LEFT - 40) * (d - d0).days / span
    o = [f'<svg xmlns="http://www.w3.org/2000/svg" width="{W}" height="{H}" viewBox="0 0 {W} {H}" font-family="Arial, Helvetica, sans-serif">',
         f'<rect width="{W}" height="{H}" fill="white"/>',
         f'<text x="20" y="40" font-size="26" font-weight="bold" fill="#333">{esc(title)}</text>']
    m = d0
    while m <= d1:
        x = X(m)
        o.append(f'<line x1="{x:.0f}" y1="{TOP-12}" x2="{x:.0f}" y2="{H-40}" stroke="#E3E8EC" stroke-width="1"/>')
        o.append(f'<text x="{x+4:.0f}" y="{TOP-18}" font-size="18" fill="#7A8B99">{m.strftime("%b %Y") if m.month in (1, d0.month) and (m == d0 or m.month == 1) else m.strftime("%b")}</text>')
        m = (m.replace(day=28) + dt.timedelta(days=5)).replace(day=1)
    for i, lane in enumerate(lanes):
        y = TOP + i * LH
        col = COLORS[lane]
        if i % 2 == 0:
            o.append(f'<rect x="0" y="{y}" width="{W}" height="{LH}" fill="#F6F8F9"/>')
        o.append(f'<circle cx="26" cy="{y+LH/2:.0f}" r="8" fill="{col}"/>')
        o.append(f'<text x="44" y="{y+LH/2+6:.0f}" font-size="24" font-weight="bold" fill="#333">{esc(lane)}</text>')
        items = sorted([x for x in ev if x[0] == lane], key=lambda x: x[2])
        # gleiche Beschriftung am selben Tag zusammenfassen
        # Punktereignisse derselben Bahn innerhalb von 12 Tagen zusammenfassen,
        # sonst ueberlagern sich die Beschriftungen
        merged = {}
        anchor = None
        for _, label, s, e in items:
            if e is None and anchor and (s - anchor).days <= 12:
                key = (anchor, None)
            else:
                key = (s, e)
                if e is None:
                    anchor = s
            merged.setdefault(key, [])
            if label not in merged[key]:
                merged[key].append(label)
        last_x_end = -1e9
        row = 0
        for (s, e), labels in sorted(merged.items()):
            x = X(s)
            text = ", ".join(labels)
            if len(text) > 64:
                text = text[:62] + "…"
            tw = 10.6 * len(text) + 18
            row = row + 1 if x < last_x_end else 0
            yy = y + 24 + (row % 2) * 32
            if e:
                o.append(f'<rect x="{x:.0f}" y="{yy-12}" width="{max(6, X(e)-x):.0f}" height="24" rx="6" fill="{col}" opacity="0.9"/>')
                tx = max(x, X(e)) + 8
            else:
                o.append(f'<circle cx="{x:.0f}" cy="{yy}" r="9" fill="{col}"/>')
                tx = x + 15
            if tx + tw > W - 10:      # rechts kein Platz: links vom Marker
                tx = x - tw - 4
            o.append(f'<text x="{tx:.0f}" y="{yy+5}" font-size="20" fill="#333">{esc(text)}</text>')
            last_x_end = tx + tw
    o.append("</svg>")
    return "\n".join(o)


COLS = [("Patient", ["Patient"]), ("Diagnosis and context", ["Condition", "Encounter", "FamilyMemberHistory"]),
        ("Reports and plans", ["DiagnosticReport", "Specimen", "CarePlan"]), ("Findings", ["Observation"]),
        ("Treatment", ["Procedure"]), ("Devices, drugs, events", ["Device", "MedicationStatement", "AdverseEvent"])]
TCOL = {"Patient": "#3C4B57", "Condition": "#B83B5E", "Encounter": "#7A8B99", "FamilyMemberHistory": "#7A8B99",
        "DiagnosticReport": "#0B9B72", "Specimen": "#0B9B72", "CarePlan": "#F2B705", "Observation": "#12B5EA",
        "Procedure": "#F48C64", "Device": "#6D2158", "MedicationStatement": "#1C7293", "AdverseEvent": "#B83B5E"}


def refs(o, out):
    if isinstance(o, dict):
        if isinstance(o.get("reference"), str):
            out.append(o["reference"].split("/")[-1])
        for v in o.values():
            refs(v, out)
    elif isinstance(o, list):
        for v in o:
            refs(v, out)


# Die Knoten tragen die Instanz-Ids; mit --english werden deren deutsche
# Bestandteile wortweise uebersetzt (fuer Vortraege vor internationalem Publikum).
LABEL_EN = {
    "Nebenwirkung": "Side effect", "Tumorboard": "Tumour board", "Diagnose": "Diagnosis", "Mammakarzinom": "breast cancer",
    "Implantat": "Implant", "Links": "left", "Rechts": "right", "Bildgebung": "Imaging", "Mammographie": "mammography",
    "Pathologie": "Pathology", "Patho": "Pathology", "Befund": "report", "Stationaer": "inpatient",
    "Familienanamnese": "Family history", "Mutter": "mother", "Schwester": "sister", "Medikation": "Medication",
    "BiRADS": "BI-RADS", "PostTherapie": "after therapy", "Status": "status", "Ki67": "Ki-67", "Keimbahn": "germline",
    "Mutation": "mutation", "Conclusion": "conclusion", "Klassifikation": "classification", "Verlauf": "Follow-up",
    "Vitalstatus": "Vital status", "Lebend": "alive", "Operation": "Surgery", "Mastektomie": "mastectomy",
    "SLNB": "sentinel node", "Rekonstruktion": "Reconstruction", "Strahlentherapie": "Radiotherapy",
    "Systemtherapie": "Systemic therapy", "Adjuvant": "adjuvant", "Praeparat": "specimen", "Tumorstatus": "Tumour status",
    "Histologie": "Histology", "Grading": "Grading", "Nachsorge": "Follow-up", "Chemotherapie": "Chemotherapy",
    "Stanzbiopsie": "core biopsy", "Sonographie": "ultrasound", "Genetik": "Genetics", "Erstanamnese": "History",
}


def graph(res, fall, title, english=False):
    ids = {r["id"]: r for r in res}
    W, TOP, NW, NH, GAP = 1800, 116, 272, 38, 8
    colx = {}
    pos = {}
    cw = (W - 40) / len(COLS)
    maxn = 0
    for ci, (name, types) in enumerate(COLS):
        nodes = [r for t in types for r in res if r["resourceType"] == t]
        maxn = max(maxn, len(nodes))
        for ni, r in enumerate(nodes):
            pos[r["id"]] = (20 + ci * cw + (cw - NW) / 2, TOP + ni * (NH + GAP))
        colx[name] = 20 + ci * cw
    H = TOP + maxn * (NH + GAP) + 60
    o = [f'<svg xmlns="http://www.w3.org/2000/svg" width="{W}" height="{H}" viewBox="0 0 {W} {H}" font-family="Arial, Helvetica, sans-serif">',
         f'<rect width="{W}" height="{H}" fill="white"/>',
         f'<text x="20" y="40" font-size="26" font-weight="bold" fill="#333">{esc(title)}</text>']
    for name, x in colx.items():
        o.append(f'<text x="{x + cw/2:.0f}" y="{TOP-22}" font-size="20" font-weight="bold" fill="#333" text-anchor="middle">{esc(name)}</text>')
    edges = 0
    pat = next((r["id"] for r in res if r["resourceType"] == "Patient"), None)
    for r in res:
        out = []
        refs({k: v for k, v in r.items() if k != "id"}, out)
        for target in set(out):
            if target in pos and target != r["id"] and target != pat:
                (x1, y1), (x2, y2) = pos[r["id"]], pos[target]
                a = (x1, y1 + NH / 2) if x1 > x2 else (x1 + NW, y1 + NH / 2)
                b = (x2 + NW, y2 + NH / 2) if x1 > x2 else (x2, y2 + NH / 2)
                if abs(x1 - x2) < 1:
                    a, b = (x1 + NW, y1 + NH / 2), (x2 + NW, y2 + NH / 2)
                    o.append(f'<path d="M{a[0]:.0f},{a[1]:.0f} C{a[0]+26:.0f},{a[1]:.0f} {b[0]+26:.0f},{b[1]:.0f} {b[0]:.0f},{b[1]:.0f}" fill="none" stroke="#9AA7B1" stroke-width="1.3"/>')
                else:
                    mx = (a[0] + b[0]) / 2
                    o.append(f'<path d="M{a[0]:.0f},{a[1]:.0f} C{mx:.0f},{a[1]:.0f} {mx:.0f},{b[1]:.0f} {b[0]:.0f},{b[1]:.0f}" fill="none" stroke="#9AA7B1" stroke-width="1.3"/>')
                edges += 1
    for rid, (x, y) in pos.items():
        r = ids[rid]
        col = TCOL.get(r["resourceType"], "#7A8B99")
        label = rid.replace(f"Fall{fall}-", "")
        if english:
            label = " ".join(LABEL_EN.get(t, t) for t in label.split("-"))
        if len(label) > 27:
            label = label[:26] + "…"
        o.append(f'<rect x="{x:.0f}" y="{y:.0f}" width="{NW}" height="{NH}" rx="6" fill="{col}"/>')
        o.append(f'<text x="{x+10:.0f}" y="{y+25:.0f}" font-size="18" fill="white">{esc(label)}</text>')
    o.append(f'<text x="20" y="{H-18}" font-size="19" fill="#7A8B99">{len(pos)} resources, {edges} references between them. '
             f'Every resource also points to the Patient (not drawn).</text>')
    o.append("</svg>")
    return "\n".join(o)


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("fall", type=int)
    ap.add_argument("--out", type=Path, default=REPO / "temp" / "patient-journey")
    ap.add_argument("--name", default=None, help="Anzeigename fuer die Titel")
    ap.add_argument("--no-title", action="store_true", help="Bildtitel weglassen (z. B. fuer Folien mit eigenem Titel)")
    ap.add_argument("--english", action="store_true", help="Knotenbeschriftungen im Graphen ins Englische uebersetzen")
    a = ap.parse_args()
    res = load(a.fall)
    if not res:
        raise SystemExit(f"Keine Ressourcen fuer Fall {a.fall} in {GEN}. Erst `sushi .` ausfuehren.")
    pat = next((r for r in res if r["resourceType"] == "Patient"), {})
    name = a.name or " ".join(pat.get("name", [{}])[0].get("given", []) + [pat.get("name", [{}])[0].get("family", "")]).strip() or f"Fall {a.fall}"
    a.out.mkdir(parents=True, exist_ok=True)
    t1 = "" if a.no_title else f"{name}: what was documented when"
    t2 = "" if a.no_title else f"{name}: the record as a graph of FHIR resources"
    (a.out / f"fall{a.fall}-timeline.svg").write_text(timeline(res, t1))
    (a.out / f"fall{a.fall}-graph.svg").write_text(graph(res, a.fall, t2, a.english))
    print(f"{len(res)} Ressourcen → {a.out}/fall{a.fall}-timeline.svg, fall{a.fall}-graph.svg")


if __name__ == "__main__":
    main()
