final Map<String, dynamic> aclsJson = {
  "id": "aha-acls",
  "name": "ACLS",
  "tags": ["ALS", "Adult", "Cardiac"],
  "document": "global/protocols/AlgorithmACLS_CA_200612.pdf",
  "start": "1",
  "notes": {
    "1": {
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
    "2": {
      "weight": 2,
      "title": "Shock Energy for Defibrillation",
      "body": """
- Biphasic: Manufacturer recommendation (eg, initial dose of 120-200 J); if unknown, use maximum available. Second and subsequent doses should be equivalent, and higher doses may be considered.
- Monophasic: 360 J
      """
    },
    "3": {
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
    "4": {
      "weight": 4,
      "title": "Advanced Airway",
      "body": """
- Endotracheal intubation or supraglottic advanced airway
- Waveform capnography or capnometry to confirm and monitor ET tube placement
- Once advanced airway in place, give 1 breath every 6 seconds (10 breaths/min) with continuous chest compressions
      """
    },
    "5": {
      "weight": 5,
      "title": "Return of Spontaneous Circulation (ROSC)",
      "body": """
- Pulse and blood pressure
- Abrupt sustained increase in Petco2 (typically ≥40 mm Hg)
- Spontaneous arterial pressure waves with intra-arterial monitoring
      """
    },
    "6": {
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
  },
  "steps": {
    "0": {
      "label": "12",
      "body": "- If no signs of ROSC, go to 10 or 11\n- If ROSC, go to Post-Cardiac Arrest Care\n- Consider appropriateness of continued resuscitation",
      "transitions": {
        "0-14": {"to": "14", "body": "Epi >3 min"},
        "0-16": {"to": "16", "body": "Epi <3 min"},
      },
    },
    "1": {
      "label": "1",
      "body": "<bold>Start CPR</bold>\n- Give oxygen\n- Attach monitor/defibrillator",
      "color": "blue",
      "advance": true,
      "transitions": {
        "1-2": {"to": "2"}
      },
    },
    "2": {
      "body": "Rhythm shockable?",
      "color": "red",
      "type": "choice",
      "transitions": {
        "2-3": {"to": "3", "body": "Yes"},
        "2-12": {"to": "12", "body": "No"},
      },
    },
    "3": {
      "label": "2",
      "body": "VF/pVT",
      "color": "gray",
      "advance": true,
      "transitions": {
        "3-4": {"to": "4"},
      },
    },
    "4": {
      "label": "3",
      "body": "Shock",
      "color": "red",
      "transitions": {
        "4-5": {"to": "5", "body": "Shocked"}
      },
    },
    "5": {
      "label": "4",
      "body": "<bold>CPR 2 min</bold>\n- IV/IO access",
      "color": "blue",
      "duration": 120,
      "transitions": {
        "5-6": {"to": "6"},
      },
    },
    "6": {
      "body": "Rhythm shockable?",
      "color": "red",
      "type": "choice",
      "transitions": {
        "6-7": {"to": "7", "body": "Yes"},
        "6-0": {"to": "0", "body": "No"},
      },
    },
    "7": {
      "label": "5",
      "body": "Shock",
      "color": "red",
      "transitions": {
        "7-8": {"to": "8", "body": "Shocked"}
      },
    },
    "8": {
      "label": "6",
      "body": "<bold>CPR 2 min</bold>\n- <bold>Epinephrine</bold> every 3-5 min\n- Consider advanced airway, capnography",
      "color": "blue",
      "duration": 120,
      "transitions": {
        "8-9": {"to": "9"},
      },
    },
    "9": {
      "body": "Rhythm shockable?",
      "color": "red",
      "type": "choice",
      "transitions": {
        "9-10": {"to": "10", "body": "Yes"},
        "9-0": {"to": "0", "body": "No"},
      },
    },
    "10": {
      "label": "7",
      "body": "Shock",
      "color": "red",
      "transitions": {
        "10-11": {"to": "11", "body": "Shocked"}
      },
    },
    "11": {
      "label": "8",
      "body": "<bold>CPR 2 min</bold>\n- <bold>Amiodarone</bold> or <bold>lidocaine</bold>\n- Treat reversible causes",
      "color": "blue",
      "duration": 120,
      "transitions": {
        "11-6": {"to": "6"},
      },
    },
    "12": {
      "label": "9",
      "body": "Asytole/PEA",
      "color": "gray",
      "advance": true,
      "transitions": {
        "12-13": {"to": "13"},
      },
    },
    "13": {
      "body": "<bold>Epinephrine</bold> ASAP",
      "color": "red",
      "advance": true,
      "transitions": {
        "13-14": {"to": "14"}
      },
    },
    "14": {
      "label": "10",
      "body": "<bold>CPR 2 min</bold>\n- IV/IO access\n- <bold>Epinephrine</bold> every 3-5 min\n- Consider advanced airway, capnography",
      "color": "blue",
      "duration": 120,
      "transitions": {
        "14-15": {"to": "15"},
      },
    },
    "15": {
      "body": "Rhythm shockable?",
      "color": "red",
      "type": "choice",
      "transitions": {
        "17-10": {"to": "10", "body": "Yes"},
        "15-16": {"to": "16", "body": "No"},
      },
    },
    "16": {
      "label": "11",
      "body": "<bold>CPR 2 min</bold>\n- Treat reversible causes",
      "color": "blue",
      "duration": 120,
      "transitions": {
        "16-17": {"to": "17"},
      },
    },
    "17": {
      "body": "Rhythm shockable?",
      "color": "red",
      "type": "choice",
      "transitions": {
        "17-10": {"to": "10", "body": "Yes"},
        "17-0": {"to": "0", "body": "No"},
      },
    },
  },
};