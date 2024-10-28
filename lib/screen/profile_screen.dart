// lib/screens/profile_screen.dart
import 'package:flutter/material.dart';
import '../widgets/profile_option.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  void _onNavigate(int index) {
    switch (index) {
      case 0:
        Navigator.pushReplacementNamed(context, '/homescreen');
        break;
      case 1:
        Navigator.pushReplacementNamed(context, '/projects');
        break;
      case 2:
        Navigator.pushReplacementNamed(context, '/messages');
        break;
      case 3:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Profile Header
              Container(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  children: [
                    // Profile Picture
                    Container(
                      width: 120,
                      height: 120,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.grey[300],
                        border: Border.all(
                          color: Colors.deepPurple,
                          width: 3,
                        ),
                      ),
                      child: const Center(
                        child: Text(
                          'RJ',
                          style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            color: Colors.deepPurple,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Roti John',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'rotijohn@hotmail.com',
                      style: TextStyle(
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ),

              // Profile Options
              const ProfileOption(
                icon: Icons.person_outline,
                title: 'Personal Information',
              ),
              const ProfileOption(
                icon: Icons.payment,
                title: 'Payment Methods',
              ),
              const ProfileOption(
                icon: Icons.location_on_outlined,
                title: 'Saved Addresses',
              ),
              const ProfileOption(
                icon: Icons.settings_outlined,
                title: 'Settings',
              ),
              const ProfileOption(
                icon: Icons.help_outline,
                title: 'Help Center',
              ),
              const ProfileOption(
                icon: Icons.logout,
                title: 'Logout',
                textColor: Colors.red,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: 3,
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
}