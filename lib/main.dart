import 'package:capstone_layout/pages/homepage.dart';
import 'package:capstone_layout/pages/courses.dart';
import 'package:capstone_layout/pages/lessons.dart';
import 'package:capstone_layout/pages/loginpage.dart';
import 'package:capstone_layout/pages/user_settings.dart';
import 'package:flutter/material.dart';
import 'package:capstone_layout/pages/registerpage.dart';

void main() {
  runApp(Layout());
}

class Layout extends StatelessWidget {
  const Layout({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/login',
      routes: {
        '/login': (context) => Loginpage(),
        '/register': (context) => Registerpage(),
        '/home': (context) => Homepage(),
        '/user_settings': (context) => UserSettingsPage(),
        '/courses': (context) => CoursesPage(),
        '/lessons': (context) => LessonsPage(),
      },
    );
  }
}
