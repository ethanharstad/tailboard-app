final Map<String, dynamic> blsJson = {
  "id": "aha-bls",
  "name": "BLS for Healthcare Providers",
  "tags": ["BLS", "Adult"],
  "document": "global/protocols/AlgorithmBLS_Adult_200624.pdf",
  "start": "1",
  "steps": {
    "1": {
      "body": "Verify Scene Safety",
      "color": "green",
      "advance": true,
      "transitions": {
        "1-2": {"to": "2"}
      },
    },
    "2": {
      "body":
      "- Check for responsiveness.\n- Shout for nearby help.\n- Activate emergency response system via mobile device.\n- Get AED and emergency equipment.",
      "color": "orange",
      "advance": true,
      "transitions": {
        "2-3": {"to": "3"},
      },
    },
    "3": {
      "body":
      "Look for no breathing or only gasping and check pulse (simultaneously). Is pulse definitely felt within 10 seconds?",
      "type": "choice",
      "color": "red",
      "transitions": {
        "3-4": {"to": "4", "body": "Normal"},
        "3-5": {"to": "5", "body": "Abnormal breathing, pulse felt"},
        "3-6": {"to": "6", "body": "No breathing, pulse not felt"},
      },
    },
    "4": {
      "body": "Monitor until emergency responders arrive.",
      "color": "green",
      "duration": 300,
      "transitions": {
        "4-3": {"to": "3", "body": "Reevaluate"},
      },
    },
    "5": {
      "body":
      "- Provide rescue breathing, 1 breath every 6 seconds.\n- Check pulse every 2 minutes; if no pulse, start CPR.\n- If possible opiod overdose, administer naloxone if available per protocol.",
      "color": "green",
      "duration": 120,
      "transitions": {
        "5-3": {"to": "3", "body": "Reevaluate"},
      },
    },
    "6": {
      "body":
      "<bold>Start CPR</bold>\n- Perform cycles of 30 compressions and 2 breaths.\n- Use AED as soon as it is available.",
      "color": "blue",
      "transitions": {
        "6-8": {"to": "8", "body": "AED Arrived"},
      },
    },
    "8": {
      "body": "Check rhythm. Shockable rhythm?",
      "type": "choice",
      "color": "red",
      "transitions": {
        "8-9": {"to": "9", "body": "Yes, shockable"},
        "8-10": {"to": "10", "body": "No, nonshockable"},
      },
    },
    "9": {
      "body":
      "- Give 1 shock. Resume CPR immediately for 2 minutes (until prompted by AED to allow rhythm check).\n- Continue until ALS providers take over or victim starts to move.",
      "color": "blue",
      "duration": 120,
      "transitions": {
        "9-8": {"to": "8", "body": "Reevaluate (2 min)"},
      },
    },
    "10": {
      "body":
      "- Resume CPR immediately for 2 minutes (until prompted by AED to allow rhythm check).\n- Continue until ALS providers take over or victim starts to move.",
      "color": "blue",
      "duration": 120,
      "transitions": {
        "10-8": {"to": "8", "body": "Reevaluate (2 min)"},
      },
    },
  },
};