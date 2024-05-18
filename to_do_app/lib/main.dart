import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'To-Do App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const TodoListScreen(),
    );
  }
}

class TodoListScreen extends StatefulWidget {
  const TodoListScreen({Key? key}) : super(key: key);

  @override
  _TodoListScreenState createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  final TextEditingController _controller = TextEditingController();
  List<String> _todoList = [];

  @override
  void initState() {
    super.initState();
    _loadTodoList();
  }

  Future<void> _loadTodoList() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _todoList = prefs.getStringList('todoList') ?? [];
    });
  }

  Future<void> _saveTodoList() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('todoList', _todoList);
  }

  void _addTodoItem(String item) {
    if (item.isNotEmpty) {
      setState(() {
        _todoList.add(item);
        _saveTodoList();
      });
      _controller.clear();
    }
  }

  void _removeTodoItem(int index) {
    setState(() {
      _todoList.removeAt(index);
      _saveTodoList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('To-Do List'),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.blue, Colors.purple],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.info_outline),
            onPressed: () {
              // Add your onPressed code here!
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _controller,
              decoration: const InputDecoration(
                labelText: 'Enter a to-do item',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () => _addTodoItem(_controller.text),
            child: const Text('Add'),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _todoList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_todoList[index]),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () => _removeTodoItem(index),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
