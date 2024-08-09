import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'note_page.dart';
import 'settings_page.dart';
import 'todo_page.dart'; // Import the ToDoPage

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
        notes.add(newNote);
        _saveNotes();
      });
    }
  }

  void _editNote(int index) async {
    final editedNote = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => NotePage(note: notes[index]),
      ),
    );

    if (editedNote != null) {
      setState(() {
        notes[index] = editedNote;
        _saveNotes();
      });
    }
  }

  void _deleteNote(int index) {
    setState(() {
      notes.removeAt(index);
      _saveNotes();
    });
  }

  String _getPreview(String note) {
    final words = note.split(' ');
    if (words.length <= 20) return note;
    return words.sublist(0, 20).join(' ') + '...';
  }

  void _viewFullNote(int index) {
    _editNote(index);
  }

  void _openSettingsPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SettingsPage()),
    );
  }

  void _openToDoPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ToDoPage()),
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
              title: Text(_getPreview(notes[index])),
              onTap: () => _viewFullNote(index),
              trailing: IconButton(
                icon: Icon(Icons.delete),
                onPressed: () => _deleteNote(index),
              ),
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
                // Implement home functionality or navigation
              },
            ),
            IconButton(
              icon: Icon(Icons.explore),
              onPressed: () {
                // Implement explore functionality or navigation
              },
            ),
            IconButton(
              icon: Icon(Icons.check_circle), // ToDo icon
              onPressed: _openToDoPage,
            ),
            IconButton(
              icon: Icon(Icons.settings),
              onPressed: _openSettingsPage,
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
