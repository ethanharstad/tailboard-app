final Map<String, dynamic> pedsBlsSingleJson = {
  "id": "aha-bls-peds-single",
  "name": "Pediatric BLS (Single Rescuer)",
  "tags": ["BLS", "Pediatric"],
  "document": "global/protocols/AlgorithmBLS_Ped_Single_Rescuer_200624.pdf",
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
          "- Check for responsiveness.\n- Shout for nearby help.\n- Activate emergency response system via mobile device.",
      "color": "orange",
      "advance": true,
      "transitions": {
        "2-3": {"to": "3"},
      },
    },
    "3": {
      "body":
          "Look for no breathing or only gasping and check pulse (simultaneously).\nIs pulse <bold>definitely</bold> felt within 10 seconds?",
      "type": "choice",
      "color": "red",
      "transitions": {
        "3-4": {"to": "4", "body": "Normal"},
        "3-5": {"to": "5", "body": "Abnormal breathing, pulse felt"},
        "3-9": {"to": "9", "body": "No breathing, pulse not felt"},
      },
    },
    "4": {
      "body": "Monitor until emergency responders arrive.",
      "color": "green",
      "duration": 300,
      "transitions": {
        "4-3": {"to": "3", "body": "Reevaluate (5 min)"},
      },
    },
    "5": {
      "body":
          "- Provide rescue breathing, 1 breath every 2-3 seconds.\n- Asses pulse rate for no more than 10 seconds.",
      "color": "green",
      "advance": true,
      "transitions": {
        "5-6": {"to": "6"},
      },
    },
    "6": {
      "body": "HR &lt;60/min with signs of poor perfusion?",
      "color": "red",
      "type": "choice",
      "transitions": {
        "6-11": {"to": "11", "body": "Yes"},
        "6-8": {"to": "8", "body": "No"},
      },
    },
    "8": {
      "body":
          "- Continue rescue breathing; check pulse every 2 minutes.\n- If no pulse, start CPR.",
      "color": "green",
      "duration": 120,
      "transitions": {
        "8-6": {"to": "6", "body": "Reevaluate (2 min)"},
      },
    },
    "9": {
      "body": "Witnessed sudden collapse?",
      "type": "choice",
      "color": "red",
      "transitions": {
        "9-10": {"to": "10", "body": "Yes"},
        "9-11": {"to": "11", "body": "No"},
      },
    },
    "10": {
      "body":
          "Activate emergency response system (if not already done), and retrieve AED/defibrillator.",
      "color": "green",
      "advance": true,
      "transitions": {
        "10-11": {"to": "11"},
      },
    },
    "11": {
      "body":
          "<bold>Start CPR</bold>\n- 1 rescuer: Perform cycles of 30 compressions and 2 breaths.\n- When second rescuer arrives, perform cycles of 15 compressions and 2 breaths.\n- Use AED as soon as it is available.",
      "color": "blue",
      "duration": 120,
      "transitions": {
        "11-12": {"to": "12"},
      },
    },
    "12": {
      "body":
          "After about 2 minutes, if still alone, activate emergency response system and retrieve AED (if not already done).",
      "color": "orange",
      "advance": true,
      "transitions": {
        "12-13": {"to": "13"},
      },
    },
    "13": {
      "body": "Check rhythm. Shockable rhythm?",
      "type": "choice",
      "color": "red",
      "transitions": {
        "13-14": {"to": "14", "body": "Yes, shockable"},
        "13-15": {"to": "15", "body": "No, nonshockable"},
      },
    },
    "14": {
      "body":
          "- Give 1 shock. Resume CPR immediately for 2 minutes (until prompted by AED to allow rhythm check).\n- Continue until ALS providers take over or the child starts to move.",
      "color": "blue",
      "duration": 120,
      "transitions": {
        "14-13": {"to": "13", "body": "2 minutes"},
      },
    },
    "15": {
      "body":
          "- Resume CPR immediately for 2 minutes (until prompted by AED to allow rhythm check).\n- Continue until ALS providers take over or the child starts to move.",
      "color": "blue",
      "duration": 120,
      "transitions": {
        "15-13": {"to": "13", "body": "2 minutes"},
      },
    },
  },
};
