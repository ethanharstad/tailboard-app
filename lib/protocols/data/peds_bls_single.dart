final Map<String, dynamic> pedsBlsSingleJson = {
  "id": "aha-bls-peds-single",
  "name": "Pediatric BLS (Single Rescuer)",
  "tags": ["BLS", "Pediatric"],
  "document": "global/protocols/AlgorithmBLS_Ped_Single_Rescuer_200624.pdf",
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
      "Check for responsiveness.\nShout for nearby help.\nActivate emergency response system via mobile device.",
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
        {"id": "3-9", "to": "9", "body": "No breathing, pulse not felt"},
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
      "Provide rescue breathing, 1 breath every 2-3 seconds.\nAsses pulse rate for no more than 10 seconds.",
      "color": "green",
      "transitions": [],
    },
    {
      "id": "6",
      "body": "HR <60/min with signs of poor perfusion?",
      "color": "red",
      "type": "choice",
      "transitions": [
        {"id": "6-7", "to": "7", "body": "Yes"},
        {"id": "6-8", "to": "8", "body": "No"},
      ],
    },
    {
      "id": "7",
      "body": "Start CPR.",
      "color": "gray",
      "transitions": [
        {"id": "7-11", "to": "11", "body": "Start CPR"},
      ],
    },
    {
      "id": "8",
      "body": "Continue rescue breathing; check pulse every 2 minutes.\nIf no pulse, start CPR.",
      "color": "green",
    },
    {
      "id": "9",
      "body":
      "Witnessed sudden collapse?",
      "type": "choice",
      "color": "red",
      "transitions": [
        {"id": "9-10", "to": "10", "body": "Yes"},
        {"id": "9-11", "to": "11", "body": "No"},
      ],
    },
    {
      "id": "10",
      "body": "Activate emergency response system (if not already done), and retrieve AED/defibrillator.",
      "color": "green",
      "transitions": [
        {"id": "10-11", "to": "11"},
      ],
    },
    {
      "id": "11",
      "body": "Start CPR\n- 1 rescuer: Perform cycles of 30 compressions and 2 breaths.\n- When second rescuer arrives, perform cycles of 15 compressions and 2 breaths.\n- Use AED as soon as it is available.",
      "color": "blue",
      "transitions": [
        {"id": "11-12", "to": "12"},
      ],
    },
    {
      "id": "12",
      "body": "After about 2 minutes, if still alone, activate emergency response system and retrieve AED (if not already done).",
      "color": "orange",
      "transitions": [
        {"id": "12-13", "to": "13"},
      ],
    },
    {
      "id": "13",
      "body": "Check rhythm. Shockable rhythm?",
      "type": "choice",
      "color": "red",
      "transitions": [
        {"id": "13-14", "to": "14", "body": "Yes, shockable"},
        {"id": "13-15", "to": "15", "body": "No, nonshockable"},
      ],
    },
    {
      "id": "14",
      "body": "- Give 1 shock. Resume CPR immediately for 2 minutes (until prompted by AED to allow rhythm check).\n- Continue until ALS providers take over or the child starts to move.",
      "color": "blue",
      "transitions": [
        {"id": "14-13", "to": "13", "body": "2 minutes"},
      ],
    },
    {
      "id": "15",
      "body": "- Resume CPR immediately for 2 minutes (until prompted by AED to allow rhythm check).\n- Continue until ALS providers take over or the child starts to move.",
      "color": "blue",
      "transitions": [
        {"id": "15-13", "to": "13", "body": "2 minutes"},
      ],
    },
  ],
};