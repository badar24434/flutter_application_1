import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mood Tracker',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MoodTrackerPage(),
    );
  }
}

// Data class for mood entries
class MoodEntry {
  final DateTime timestamp;
  final String mood;
  final String note;

  MoodEntry({
    required this.timestamp,
    required this.mood,
    required this.note,
  });
}

class MoodTrackerPage extends StatefulWidget {
  const MoodTrackerPage({super.key});

  @override
  State<MoodTrackerPage> createState() => _MoodTrackerPageState();
}

class _MoodTrackerPageState extends State<MoodTrackerPage> {
  String _currentMood = '';
  final TextEditingController _noteController = TextEditingController();
  final List<MoodEntry> _moodEntries = [];

  @override
  void dispose() {
    _noteController.dispose();
    super.dispose();
  }

  void _saveMoodEntry() {
    if (_currentMood.isNotEmpty) {
      setState(() {
        _moodEntries.insert(
          0,
          MoodEntry(
            timestamp: DateTime.now(),
            mood: _currentMood,
            note: _noteController.text,
          ),
        );
        _currentMood = '';
        _noteController.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Mood Tracker',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'How are you feeling right now?',
                style: TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildMoodButton('Happy'),
                  _buildMoodButton('Neutral'),
                  _buildMoodButton('Sad'),
                ],
              ),
              if (_currentMood.isNotEmpty) ...[
                const SizedBox(height: 16),
                Text(
                  "You're feeling $_currentMood",
                  style: const TextStyle(fontSize: 20),
                ),
              ],
              const SizedBox(height: 16),
              TextField(
                controller: _noteController,
                decoration: const InputDecoration(
                  labelText: 'Add a note',
                  border: OutlineInputBorder(),
                ),
                maxLines: 3,
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: _saveMoodEntry,
                child: const Text('Save Entry'),
              ),
              const SizedBox(height: 16),
              const Text(
                'Recent Entries',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Expanded(
                child: ListView.builder(
                  itemCount: _moodEntries.length,
                  itemBuilder: (context, index) {
                    return _buildMoodEntryCard(_moodEntries[index]);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMoodButton(String mood) {
  return ElevatedButton(
    onPressed: () {
      setState(() {
        _currentMood = mood;
      });
    },
    style: ElevatedButton.styleFrom(
      backgroundColor: _currentMood == mood
          ? Theme.of(context).colorScheme.primary
          : Theme.of(context).colorScheme.secondary,
      foregroundColor: Colors.white, // Set the text color to white
    ),
    child: Text(mood),
  );
}

  Widget _buildMoodEntryCard(MoodEntry entry) {
    final formatter = DateFormat('MMM dd, yyyy HH:mm');
    
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 4),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              formatter.format(entry.timestamp),
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            Text('Mood: ${entry.mood}'),
            if (entry.note.isNotEmpty) Text('Note: ${entry.note}'),
          ],
        ),
      ),
    );
  }
}