final Map<String, dynamic> blsJson = {
  "id": "aha-bls",
  "name": "BLS",
  "tags": ["BLS", "Adult"],
  "document": "global/protocols/AlgorithmBLS_Adult_200624.pdf",
  "start": "1",
  "steps": [
    {
      "id": "1",
      "body": "Verify Scene Safety",
      "color": "green",
      "transitions": [
        {"id": "1-2", "to": "2"}
      ],
    },
    {
      "id": "2",
      "body":
      "Check for responsiveness.\nShout for nearby help.\nActivate emergency response system via mobile device.\nGet AED and emergency equipment.",
      "color": "orange",
      "transitions": [
        {"id": "2-3", "to": "3"},
      ],
    },
    {
      "id": "3",
      "body":
      "Look for no breathing or only gasping and check pulse (simultaneously). Is pulse definitely felt within 10 seconds?",
      "type": "choice",
      "color": "red",
      "transitions": [
        {"id": "3-4", "to": "4", "body": "Normal"},
        {"id": "3-5", "to": "5", "body": "Abnormal breathing, pulse felt"},
        {"id": "3-6", "to": "6", "body": "No breathing, pulse not felt"},
      ],
    },
    {
      "id": "4",
      "body": "Monitor until emergency responders arrive.",
      "color": "green",
    },
    {
      "id": "5",
      "body":
      "Provide rescue breathing, 1 breath every 6 seconds.\nCheck pulse every 2 minutes; if no pulse, start CPR.\nIf possible opiod overdose, administer naloxone if available per protocol.",
      "color": "green",
      "transitions": [],
    },
    {
      "id": "6",
      "body":
      "Start CPR\nPerform cycles of 30 compressions and 2 breaths.\nUse AED as soon as it is available.",
      "color": "blue",
      "transitions": [
        {"id": "6-7", "to": "7"},
      ],
    },
    {
      "id": "7",
      "body": "AED arrives",
      "color": "gray",
      "transitions": [
        {"id": "7-8", "to": "8"},
      ],
    },
    {
      "id": "8",
      "body": "Check rhythm. Shockable rhythm?",
      "type": "choice",
      "color": "red",
      "transitions": [
        {"id": "8-9", "to": "9", "body": "Yes, shockable"},
        {"id": "8-10", "to": "10", "body": "No, nonshockable"},
      ],
    },
    {
      "id": "9",
      "body":
      "Give 1 shock. Resume CPR immediately for 2 minutes (until prompted by AED to allow rhythm check).\nContinue until ALS providers take over or victim starts to move.",
      "color": "blue",
      "transitions": [
        {"id": "9-8", "to": "8"},
      ],
    },
    {
      "id": "10",
      "body":
      "Resume CPR immediately for 2 minutes (until prompted by AED to allow rhythm check).\nContinue until ALS providers take over or victim starts to move.",
      "color": "blue",
      "transitions": [
        {"id": "10-8", "to": "8"},
      ],
    },
  ],
};