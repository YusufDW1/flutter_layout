import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    // Example username (replace with actual user data later)
    const String username = "John Doe";

    // Example chat history items
    final List<String> chatHistory = [
      "Math Basics",
      "Physics Notes",
      "AI Discussion",
      "Flutter Help",
    ];

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 37, 37, 37),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 77, 0, 5),
        title: const Text(
          "AmbaLearn",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu, color: Colors.white),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
      ),

      // LEFT DRAWER
      drawer: Drawer(
        backgroundColor: const Color.fromARGB(255, 37, 37, 37),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Color.fromARGB(255, 77, 0, 5)),
              child: Center(
                child: Text(
                  "AmbaLearn Menu",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            // MENU ITEMS
            ListTile(
              leading: const Icon(Icons.add, color: Colors.white),
              title: const Text("New Chat", style: TextStyle(color: Colors.white)),
              onTap: () {
                // TODO: Handle new chat
              },
            ),
            ListTile(
              leading: const Icon(Icons.school, color: Colors.white),
              title: const Text("Courses", style: TextStyle(color: Colors.white)),
              onTap: () {
                Navigator.pushNamed(context, '/courses');
              },
            ),
            const Padding(
              padding: EdgeInsets.only(left: 16, top: 10, bottom: 5),
              child: Text(
                "Chats",
                style: TextStyle(color: Colors.white70, fontWeight: FontWeight.bold),
              ),
            ),

            // CHAT HISTORY
            Expanded(
              child: ListView.builder(
                itemCount: chatHistory.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: const Icon(Icons.chat_bubble_outline, color: Colors.white),
                    title: Text(
                      chatHistory[index],
                      style: const TextStyle(color: Colors.white),
                    ),
                    onTap: () {
                      // TODO: Open chat
                    },
                  );
                },
              ),
            ),

            // ACCOUNT SECTION AT THE BOTTOM
            const Divider(color: Colors.white24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              child: InkWell(
                onTap: () {
                  Navigator.pushNamed(context, '/user_settings');
                },
                borderRadius: BorderRadius.circular(8),
                child: Row(
                  children: [
                    const CircleAvatar(
                      radius: 20,
                      backgroundImage: NetworkImage("https://placehold.co/600x400.png?text=JD"), // Replace with real image
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        username,
                        style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const Icon(Icons.arrow_forward_ios, color: Colors.white70, size: 16),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),

      body: Column(
        children: [
          const Expanded(
            child: Center(
              child: Text(
                "Mau belajar apa hari ini?",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            color: const Color.fromARGB(255, 77, 0, 5),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Tulis disini",
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 12,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 5),
                CircleAvatar(
                  backgroundColor: Colors.white,
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.send,
                      color: Color.fromARGB(255, 135, 0, 5),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
