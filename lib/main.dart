// lib/main.dart
import 'package:flutter/material.dart';
import 'screen/homepage.dart';
import 'screen/projects_screen.dart';
import 'screen/messages_screen.dart';
import 'screen/profile_screen.dart';
import 'screen/signup.dart'; 

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        scaffoldBackgroundColor: Colors.grey[50],
      ),
      initialRoute: '/signup',
      routes: {
        '/homescreen': (context) => const HomeScreen(),
        '/projects': (context) => const ProjectsScreen(),
        '/messages': (context) => const MessagesScreen(),
        '/profile': (context) => const ProfileScreen(),
        '/signup': (context) => SignUpPage(), 

      },
    );
  }
}



