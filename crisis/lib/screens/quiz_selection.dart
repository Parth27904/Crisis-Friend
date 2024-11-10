import 'package:crisis_friend1/screens/quiz_screen.dart';
import 'package:flutter/material.dart';

class QuizSelection extends StatelessWidget {
  QuizSelection({super.key});

  final List<Map<String, String>> disasters = [
    {
      "name": "Earthquake",
      "image": "https://cf-img-a-in.tosshub.com/sites/visualstory/wp/2024/10/earthquake-2.jpeg?size=*:900"
    },
    {
      "name": "Flood",
      "image": "https://images.indianexpress.com/2024/08/Left-to-right-2024-08-25T100825.021.jpg"
    },
    {
      "name": "Landslide",
      "image": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRvR4KoAeHHb-WGz75Z2yuMIpjeCqAUbJU7MA&s"
    },
    {
      "name": "Fire",
      "image": "https://idsb.tmgrup.com.tr/ly/uploads/images/2020/12/02/76276.jpg"
    },
    {
      "name": "Tsunami",
      "image": "https://i.natgeofe.com/n/0f9e3b7a-d3ca-4418-8e61-f605b4e04bc5/02-rikuzentakata-japan.jpg"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        iconTheme: IconThemeData(color: Colors.white),
        title: const Text(
          "Select a Disaster",
          style: TextStyle(color: Colors.deepOrange),
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: disasters.length,
          itemBuilder: (context, index) {
            final disaster = disasters[index];
            return GestureDetector(
              onTap: () {
                // Navigate to QuizScreen with the selected disaster
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => QuizScreen(
                      disasterName: disaster['name']!,
                    ),
                  ),
                );
              },
              child: Container(
                margin: const EdgeInsets.only(bottom: 16),
                decoration: BoxDecoration(
                  color: Colors.deepOrange,
                  borderRadius: BorderRadius.circular(15),

                ),
                height: 200,
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.network(
                        disaster['image']!,
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: double.infinity,
                      ),
                    ),
                    // Gradient overlay
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        gradient: LinearGradient(
                          colors: [
                            Colors.black.withOpacity(0.6),
                            Colors.transparent,
                          ],
                          begin: Alignment.bottomCenter,
                          end: Alignment.center,
                        ),
                      ),
                    ),
                    // Disaster name
                    Positioned(
                      bottom: 20,
                      left: 20,
                      right: 20,
                      child: Text(
                        disaster['name']!,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          shadows: [
                            Shadow(
                              color: Colors.black54,
                              blurRadius: 6,
                              offset: Offset(1, 1),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
