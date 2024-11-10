import 'dart:math';
import 'package:flutter/material.dart';

class QuizScreen extends StatefulWidget {
  final String disasterName;

  const QuizScreen({super.key, required this.disasterName});

  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  final Map<String, List<Map<String, dynamic>>> disasterQuestions = {
    "Earthquake": [
      {
        "question": "What should you do during an earthquake?",
        "options": [
          "Stand under a tree",
          "Take cover under a table",
          "Run outside",
          "Stand near a window"
        ],
        "answer": 1
      },
      {
        "question": "Which scale measures earthquake magnitude?",
        "options": ["Fujita", "Richter", "Saffir-Simpson", "Beaufort"],
        "answer": 1
      },
      {
        "question": "What should you avoid during an earthquake?",
        "options": [
          "Using elevators",
          "Taking cover under furniture",
          "Staying indoors",
          "Finding an open field"
        ],
        "answer": 0
      },
      {
        "question": "What is a common sign of an impending earthquake?",
        "options": [
          "Sudden heavy rainfall",
          "Strange animal behavior",
          "Rapid wind changes",
          "Increase in temperature"
        ],
        "answer": 1
      },
      {
        "question": "How can you prepare your home for an earthquake?",
        "options": [
          "Fix heavy objects to walls",
          "Open all doors and windows",
          "Store extra water outside",
          "Cover mirrors with cloth"
        ],
        "answer": 0
      },
    ],
    "Flood": [
      {
        "question": "What is the primary cause of floods?",
        "options": [
          "Excessive rainfall",
          "Volcanic eruptions",
          "Earthquakes",
          "Forest fires"
        ],
        "answer": 0
      },
      {
        "question": "What should you do if a flood warning is issued?",
        "options": ["Evacuate", "Stay indoors", "Go outside", "Ignore it"],
        "answer": 0
      },
      {
        "question": "How can you prepare for a flood?",
        "options": [
          "Elevate electrical appliances",
          "Cut down trees",
          "Increase indoor temperature",
          "Dig holes around your house"
        ],
        "answer": 0
      },
      {
        "question": "What should you avoid during a flood?",
        "options": [
          "Walking through moving water",
          "Moving to higher ground",
          "Listening to the news",
          "Packing an emergency kit"
        ],
        "answer": 0
      },
      {
        "question": "Which of these is a flood prevention measure?",
        "options": [
          "Building dams",
          "Cutting down forests",
          "Ignoring weather warnings",
          "Planting crops near rivers"
        ],
        "answer": 0
      },
    ],
    "Fire": [
      {
        "question": "What is the first step to take in a fire emergency?",
        "options": [
          "Search for the source of fire",
          "Stay in the building",
          "Use the elevator to evacuate",
          "Exit the building immediately"
        ],
        "answer": 3
      },
      {
        "question": "Which of these helps prevent fires?",
        "options": [
          "Keeping flammable materials away from heat",
          "Leaving candles unattended",
          "Overloading electrical sockets",
          "Smoking indoors"
        ],
        "answer": 0
      },
      {
        "question": "What should you do if your clothes catch fire?",
        "options": [
          "Run around quickly",
          "Stop, drop, and roll",
          "Use a fan to cool down",
          "Spray with perfume"
        ],
        "answer": 1
      },
      {
        "question": "What type of fire extinguisher is used for electrical fires?",
        "options": ["Water", "Foam", "CO2", "Sand"],
        "answer": 2
      },
      {
        "question": "How often should you check smoke detectors?",
        "options": ["Every week", "Every month", "Every 6 months", "Every year"],
        "answer": 1
      },
    ],
    "Tsunami": [
      {
        "question": "What should you do if a tsunami warning is issued?",
        "options": [
          "Stay at the beach",
          "Move to higher ground",
          "Go swimming",
          "Drive towards the shore"
        ],
        "answer": 1
      },
      {
        "question": "What is a tsunami?",
        "options": [
          "A large earthquake",
          "A series of ocean waves",
          "A tropical storm",
          "A volcanic eruption"
        ],
        "answer": 1
      },
      {
        "question": "Which of these is a natural sign of a tsunami?",
        "options": [
          "Sudden sea level rise",
          "Earth shaking",
          "Sea water receding",
          "Heavy rainfall"
        ],
        "answer": 2
      },
      {
        "question": "How can you protect yourself from a tsunami?",
        "options": [
          "Seek shelter in low areas",
          "Move to high ground",
          "Stay indoors",
          "Wait near the coast"
        ],
        "answer": 1
      },
      {
        "question": "What should you do after a tsunami?",
        "options": [
          "Go to the beach",
          "Drink tap water",
          "Listen to emergency broadcasts",
          "Ignore evacuation orders"
        ],
        "answer": 2
      },
    ],
    "Landslide": [
      {
        "question": "What causes landslides?",
        "options": [
          "Heavy rainfall",
          "Strong winds",
          "Loud noises",
          "Cold temperatures"
        ],
        "answer": 0
      },
      {
        "question": "What should you do if you are caught in a landslide?",
        "options": [
          "Run uphill",
          "Lie flat on the ground",
          "Stand still",
          "Move away quickly"
        ],
        "answer": 3
      },
      {
        "question": "How can you prepare for landslides?",
        "options": [
          "Planting trees",
          "Building on steep slopes",
          "Cutting down trees",
          "Ignoring warning signs"
        ],
        "answer": 0
      },
      {
        "question": "What is a sign of an impending landslide?",
        "options": [
          "Sudden ground cracks",
          "Clear skies",
          "Dry riverbeds",
          "Falling snow"
        ],
        "answer": 0
      },
      {
        "question": "What should you avoid after a landslide?",
        "options": [
          "Entering damaged buildings",
          "Staying on high ground",
          "Listening to authorities",
          "Checking for injured"
        ],
        "answer": 0
      },
    ],
  };

  List<Map<String, dynamic>> _questions = [];
  final List<int?> _selectedAnswers = List.filled(5, null);
  int _score = 0;

  @override
  void initState() {
    super.initState();
    _questions = disasterQuestions[widget.disasterName] ?? [];
  }

  void _evaluateQuiz() {
    setState(() {
      _score = 0;
      for (int i = 0; i < _questions.length; i++) {
        if (_selectedAnswers[i] == _questions[i]["answer"]) {
          _score++;
        }
      }
    });

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.black,
          title: const Text(
            "Quiz Results",
            style: TextStyle(color: Colors.deepOrange),
          ),
          content: Text(
            "You scored $_score out of ${_questions.length}",
            style: const TextStyle(color: Colors.white),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                // Clear the answers after submitting
                setState(() {
                  _selectedAnswers.fillRange(0, _selectedAnswers.length, null);
                });
                Navigator.of(context).pop();
              },
              child: const Text(
                "OK",
                style: TextStyle(color: Colors.deepOrange),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(color: Colors.white),
        title: Text(
          '${widget.disasterName} Quiz',
          style: const TextStyle(color: Colors.deepOrange),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: _questions.length,
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Q${index + 1}: ${_questions[index]["question"]}",
                        style: const TextStyle(color: Colors.white, fontSize: 18),
                      ),
                      const SizedBox(height: 10),
                      ...List.generate(4, (optionIndex) {
                        return RadioListTile<int>(
                          activeColor: Colors.deepOrange,
                          title: Text(
                            _questions[index]["options"][optionIndex],
                            style: const TextStyle(color: Colors.white),
                          ),
                          value: optionIndex,
                          groupValue: _selectedAnswers[index],
                          onChanged: (value) {
                            setState(() {
                              _selectedAnswers[index] = value;
                            });
                          },
                        );
                      }),
                      const Divider(color: Colors.white),
                    ],
                  );
                },
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepOrange,
                padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onPressed: _evaluateQuiz,
              child: const Text(
                "Submit",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
