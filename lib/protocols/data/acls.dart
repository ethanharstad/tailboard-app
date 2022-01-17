final Map<String, dynamic> aclsJson = {
  "id": "aha-acls",
  "name": "ACLS",
  "tags": ["ALS", "Adult", "Cardiac"],
  "document": "global/protocols/AlgorithmACLS_CA_200612.pdf",
  "start": "1",
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
      "body": "Start CPR\nGive oxygen\nAttach monitor/defibrillator",
      "color": "blue",
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
      "body": "CPR 2 min\nIV/IO access",
      "color": "blue",
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
        {"id": "6-0", "to": "0", "body": "No"},
        {"id": "6-7", "to": "7", "body": "Yes"},
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
      "body": "CPR 2 min\nEpinephrine every 3-5 min\nConsider advanced airway, capnography",
      "color": "blue",
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
        {"id": "9-0", "to": "0", "body": "No"},
        {"id": "9-10", "to": "10", "body": "Yes"},
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
      "body": "CPR 2 min\nAmiodarone or lidocaine\nTreat reversible causes",
      "color": "blue",
      "transitions": [
        {"id": "11-6", "to": "6"},
      ],
    },
    {
      "id": "12",
      "label": "9",
      "body": "Asytole/PEA",
      "color": "gray",
      "transitions": [
        {"id": "12-13", "to": "13"},
      ],
    },
    {
      "id": "13",
      "body": "Epinephrine ASAP",
      "color": "red",
      "transitions": [
        {"id": "13-14", "to": "14"}
      ],
    },
    {
      "id": "14",
      "label": "10",
      "body": "CPR 2 min\nIV/IO access\nEpinephrine every 3-5 min\nConsider advanced airway, capnography",
      "color": "blue",
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
        {"id": "15-16", "to": "16", "body": "No"},
        // TODO "Go to 5 or 5"?
        {"id": "17-10", "to": "10", "body": "Yes"},
      ],
    },
    {
      "id": "16",
      "label": "11",
      "body": "CPR 2 min\nTreat reversible causes",
      "color": "blue",
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
        {"id": "17-0", "to": "0", "body": "No"},
        // TODO "Go to 5 or 5"?
        {"id": "17-10", "to": "10", "body": "Yes"},
      ],
    },
  ],
};