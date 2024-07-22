import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'note_page.dart';
import 'settings_page.dart'; // Import your SettingsPage


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Note App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.light, // Default theme is light mode
      ),
      darkTheme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.dark, // Dark mode theme
      ),
      home: NoteHomePage(),
    );
  }
}

class NoteHomePage extends StatefulWidget {
  @override
  _NoteHomePageState createState() => _NoteHomePageState();
}

class _NoteHomePageState extends State<NoteHomePage> {
  List<String> notes = [];

  @override
  void initState() {
    super.initState();
    _loadNotes();
  }

  Future<void> _loadNotes() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      notes = prefs.getStringList('notes') ?? [];
    });
  }

  Future<void> _saveNotes() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('notes', notes);
  }

  void _addNote() async {
    final newNote = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => NotePage()),
    );

    if (newNote != null) {
      setState(() {
        final truncatedNote =
            newNote.substring(0, newNote.length > 30 ? 30 : newNote.length);
        notes.add(truncatedNote);
        _saveNotes(); // Save notes after adding a new one
      });
    }
  }

  void _viewFullNote(String note) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Full Note'),
          content: Text(note),
          actions: <Widget>[
            TextButton(
              child: Text('Close'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _openSettingsPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SettingsPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Note App'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: _openSettingsPage,
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: notes.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text(notes[index]),
              onTap: () => _viewFullNote(notes[index]),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addNote,
        child: Icon(Icons.add),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: Icon(Icons.home),
              onPressed: () {
                // Navigate to home or implement functionality
              },
            ),
            IconButton(
              icon: Icon(Icons.explore),
              onPressed: () {
                // Navigate to explore or implement functionality
              },
            ),
            IconButton(
              icon: Icon(Icons.notifications),
              onPressed: () {
                // Navigate to notifications or implement functionality
              },
            ),
            IconButton(
              icon: Icon(Icons.settings),
              onPressed: _openSettingsPage,
            ),

            // IconButton(
            //   icon: Icon(Icons.person),
            //   onPressed: () {
            //     // Navigate to profile or implement functionality
            //   },
            // ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
