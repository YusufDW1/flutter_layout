import 'package:flutter/material.dart';

class CoursesPage extends StatefulWidget {
  const CoursesPage({super.key});

  @override
  State<CoursesPage> createState() => _CoursesPageState();
}

class _CoursesPageState extends State<CoursesPage> {
  final TextEditingController _topicController = TextEditingController();

  // Example course list with .png placeholders
  final List<Map<String, String>> courses = [
    {
      "title": "Flutter Basics",
      "image": "https://placehold.co/600x400.png?text=Flutter+Basics",
    },
    {
      "title": "Introduction to AI",
      "image": "https://placehold.co/600x400.png?text=Intro+to+AI",
    },
    {
      "title": "Data Science 101",
      "image": "https://placehold.co/600x400.png?text=Data+Science+101",
    },
    {
      "title": "Machine Learning",
      "image": "https://placehold.co/600x400.png?text=Machine+Learning",
    },
  ];

  void _showAddCourseDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: const Color.fromARGB(255, 37, 37, 37),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          title: const Text(
            "Generate New Course",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _topicController,
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  labelText: "Topic",
                  labelStyle: const TextStyle(color: Colors.white70),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.white24),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Color.fromARGB(255, 200, 80, 80),
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text(
                "Back",
                style: TextStyle(color: Colors.white70),
              ),
            ),
            TextButton(
              onPressed: () {
                if (_topicController.text.trim().isNotEmpty) {
                  final topic = _topicController.text.trim();
                  setState(() {
                    courses.add({
                      "title": topic,
                      "image":
                          "https://placehold.co/600x400.png?text=${Uri.encodeComponent(topic)}",
                    });
                  });
                  _topicController.clear();
                  Navigator.pop(context);
                }
              },
              child: const Text(
                "Generate Course",
                style: TextStyle(
                  color: Color.fromARGB(255, 200, 80, 80),
                  fontWeight: FontWeight.bold,
                ),
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
      backgroundColor: const Color.fromARGB(255, 37, 37, 37),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 77, 0, 5),
        title: const Text(
          "Courses",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 135, 0, 5),
        onPressed: _showAddCourseDialog,
        child: const Icon(Icons.add, color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: GridView.builder(
          itemCount: courses.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 0.8,
          ),
          itemBuilder: (context, index) {
            final course = courses[index];
            return Card(
              color: const Color.fromARGB(255, 51, 51, 51),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 4,
              child: InkWell(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    '/lessons',
                    arguments:
                        course["title"], // pass course title as parameter
                  );
                },

                borderRadius: BorderRadius.circular(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: ClipRRect(
                        borderRadius: const BorderRadius.vertical(
                          top: Radius.circular(12),
                        ),
                        child: Image.network(
                          course["image"]!,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) =>
                              Image.network(
                                "https://placehold.co/600x400.png?text=No+Image",
                                fit: BoxFit.cover,
                              ),
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(8.0),
                      alignment: Alignment.center,
                      child: Text(
                        course["title"]!,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
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
