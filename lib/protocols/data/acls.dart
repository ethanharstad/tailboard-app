final Map<String, dynamic> aclsJson = {
  "id": "aha-acls",
  "name": "ACLS",
  "tags": ["ALS", "Adult", "Cardiac"],
  "document": "global/protocols/AlgorithmACLS_CA_200612.pdf",
  "start": "1",
  "notes": [
    {
      "id": "1",
      "weight": 1,
      "title": "CPR Quality",
      "body": """
- Push hard (at least 2 inches [5 cm]) and fast (100-120/min) and allow complete chest recoil.
- Minimize interruptions in compressions.
- Avoid excessive ventilation.
- Change compressor every 2 minutes, or sooner if fatigued.
- If no advanced airway, 30:2 compression-ventilation ratio, or 1 breath every 6 seconds.
- Quantitative waveform capnography:
  – If Petco2 is low or decreasing, reassess CPR quality.
      """
    },
    {
      "id": "2",
      "weight": 2,
      "title": "Shock Energy for Defibrillation",
      "body": """
- Biphasic: Manufacturer recommendation (eg, initial dose of 120-200 J); if unknown, use maximum available. Second and subsequent doses should be equivalent, and higher doses may be considered.
- Monophasic: 360 J
      """
    },
    {
      "id": "3",
      "weight": 3,
      "title": "Drug Therapy",
      "body": """
- Epinephrine IV/IO dose: 1 mg every 3-5 minutes
- Amiodarone IV/IO dose:
    First dose: 300 mg bolus.
    Second dose: 150 mg.
  or
  Lidocaine IV/IO dose:
    First dose: 1-1.5 mg/kg.
    Second dose: 0.5-0.75 mg/kg.
      """
    },
    {
      "id": "4",
      "weight": 4,
      "title": "Advanced Airway",
      "body": """
- Endotracheal intubation or supraglottic advanced airway
- Waveform capnography or capnometry to confirm and monitor ET tube placement
- Once advanced airway in place, give 1 breath every 6 seconds (10 breaths/min) with continuous chest compressions
      """
    },
    {
      "id": "5",
      "weight": 5,
      "title": "Return of Spontaneous Circulation (ROSC)",
      "body": """
- Pulse and blood pressure
- Abrupt sustained increase in Petco2 (typically ≥40 mm Hg)
- Spontaneous arterial pressure waves with intra-arterial monitoring
      """
    },
    {
      "id": "6",
      "weight": 6,
      "title": "Reversible Causes",
      "body": """
- Hypovolemia
- Hypoxia
- Hydrogen ion (acidosis)
- Hypo/hyperkalemia
- Hypothermia
- Tension pneumothorax
- Tamponade, cardiac
- Toxins
- Thrombosis, pulmonary
- Thrombosis, coronary
      """
    },
  ],
  "steps": [
    {
      "id": "0",
      "label": "12",
      // TODO "Go to 10 or 11"?
      "body": "If no signs of ROSC, go to 10 or 11\nIf ROSC, go to Post-Cardiac Arrest Care\nConsider appropriateness of continued resuscitation"
    },
    {
      "id": "1",
      "label": "1",
      "body": "<bold>Start CPR</bold>\n- Give oxygen\n- Attach monitor/defibrillator",
      "color": "blue",
      "advance": true,
      "transitions": [
        {"id": "1-2", "to": "2"}
      ],
    },
    {
      "id": "2",
      "body": "Rhythm shockable?",
      "color": "red",
      "type": "choice",
      "transitions": [
        {"id": "2-3", "to": "3", "body": "Yes"},
        {"id": "2-12", "to": "12", "body": "No"},
      ],
    },
    {
      "id": "3",
      "label": "2",
      "body": "VF/pVT",
      "color": "gray",
      "advance": true,
      "transitions": [
        {"id": "3-4", "to": "4"},
      ],
    },
    {
      "id": "4",
      "label": "3",
      "body": "Shock",
      "color": "red",
      "transitions": [
        {"id": "4-5", "to": "5"}
      ],
    },
    {
      "id": "5",
      "label": "4",
      "body": "<bold>CPR 2 min</bold>\n- IV/IO access",
      "color": "blue",
      "duration": 120,
      "transitions": [
        {"id": "5-6", "to": "6"},
      ],
    },
    {
      "id": "6",
      "body": "Rhythm shockable?",
      "color": "red",
      "type": "choice",
      "transitions": [
        {"id": "6-7", "to": "7", "body": "Yes"},
        {"id": "6-0", "to": "0", "body": "No"},
      ],
    },
    {
      "id": "7",
      "label": "5",
      "body": "Shock",
      "color": "red",
      "transitions": [
        {"id": "7-8", "to": "8"}
      ],
    },
    {
      "id": "8",
      "label": "6",
      "body": "<bold>CPR 2 min</bold>\n- <bold>Epinephrine</bold> every 3-5 min\n- Consider advanced airway, capnography",
      "color": "blue",
      "duration": 120,
      "transitions": [
        {"id": "8-9", "to": "9"},
      ],
    },
    {
      "id": "9",
      "body": "Rhythm shockable?",
      "color": "red",
      "type": "choice",
      "transitions": [
        {"id": "9-10", "to": "10", "body": "Yes"},
        {"id": "9-0", "to": "0", "body": "No"},
      ],
    },
    {
      "id": "10",
      "label": "7",
      "body": "Shock",
      "color": "red",
      "transitions": [
        {"id": "10-11", "to": "11"}
      ],
    },
    {
      "id": "11",
      "label": "8",
      "body": "<bold>CPR 2 min</bold>\n- <bold>Amiodarone</bold> or <bold>lidocaine</bold>\n- Treat reversible causes",
      "color": "blue",
      "duration": 120,
      "transitions": [
        {"id": "11-6", "to": "6"},
      ],
    },
    {
      "id": "12",
      "label": "9",
      "body": "Asytole/PEA",
      "color": "gray",
      "advance": true,
      "transitions": [
        {"id": "12-13", "to": "13"},
      ],
    },
    {
      "id": "13",
      "body": "<bold>Epinephrine</bold> ASAP",
      "color": "red",
      "advance": true,
      "transitions": [
        {"id": "13-14", "to": "14"}
      ],
    },
    {
      "id": "14",
      "label": "10",
      "body": "<bold>CPR 2 min</bold>\n- IV/IO access\n- <bold>Epinephrine</bold> every 3-5 min\n- Consider advanced airway, capnography",
      "color": "blue",
      "duration": 120,
      "transitions": [
        {"id": "14-15", "to": "15"},
      ],
    },
    {
      "id": "15",
      "body": "Rhythm shockable?",
      "color": "red",
      "type": "choice",
      "transitions": [
        // TODO "Go to 5 or 5"?
        {"id": "17-10", "to": "10", "body": "Yes"},
        {"id": "15-16", "to": "16", "body": "No"},
      ],
    },
    {
      "id": "16",
      "label": "11",
      "body": "<bold>CPR 2 min</bold>\n- Treat reversible causes",
      "color": "blue",
      "duration": 120,
      "transitions": [
        {"id": "16-17", "to": "17"},
      ],
    },
    {
      "id": "17",
      "body": "Rhythm shockable?",
      "color": "red",
      "type": "choice",
      "transitions": [
        // TODO "Go to 5 or 5"?
        {"id": "17-10", "to": "10", "body": "Yes"},
        {"id": "17-0", "to": "0", "body": "No"},
      ],
    },
  ],
};