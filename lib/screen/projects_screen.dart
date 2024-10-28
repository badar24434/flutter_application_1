// lib/screens/projects_screen.dart
import 'package:flutter/material.dart';
import '../widgets/bottom_navigation.dart';
import '../widgets/project_item.dart';

class ProjectsScreen extends StatefulWidget {
  const ProjectsScreen({super.key});

  @override
  State<ProjectsScreen> createState() => _ProjectsScreenState();
}

class _ProjectsScreenState extends State<ProjectsScreen> {
  void _onNavigate(int index) {
    switch (index) {
      case 0:
        Navigator.pushReplacementNamed(context, '/homescreen');
        break;
      case 1:
        // Already on projects screen
        break;
      case 2:
        Navigator.pushReplacementNamed(context, '/messages');
        break;
      case 3:
        Navigator.pushReplacementNamed(context, '/profile');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top bar
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    const Text(
                      'My Projects',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Spacer(),
                    IconButton(
                      icon: const Icon(Icons.add),
                      onPressed: () {
                        // Add new project functionality
                      },
                    ),
                  ],
                ),
              ),

              // Active Projects Section
              _buildProjectsSection('Active Projects', [
                ProjectItem(
                  title: 'House Cleaning',
                  provider: 'John\'s Cleaning Service',
                  status: 'In Progress',
                  date: 'Oct 30, 2024',
                  statusColor: Colors.orange,
                ),
                ProjectItem(
                  title: 'Electrical Repair',
                  provider: 'Elite Electricians',
                  status: 'Scheduled',
                  date: 'Nov 2, 2024',
                  statusColor: Colors.blue,
                ),
              ]),

              // Completed Projects Section
              _buildProjectsSection('Completed Projects', [
                ProjectItem(
                  title: 'Garden Maintenance',
                  provider: 'Green Thumb Pro',
                  status: 'Completed',
                  date: 'Oct 25, 2024',
                  statusColor: Colors.green,
                ),
              ]),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: 1,
        selectedItemColor: Colors.deepPurple,
        onTap: _onNavigate,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Browse'),
          BottomNavigationBarItem(icon: Icon(Icons.assignment), label: 'Projects'),
          BottomNavigationBarItem(icon: Icon(Icons.message), label: 'Messages'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }

  Widget _buildProjectsSection(String title, List<Widget> projects) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        ...projects,
      ],
    );
  }
}