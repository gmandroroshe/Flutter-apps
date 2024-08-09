import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // For date and time formatting
import 'package:shared_preferences/shared_preferences.dart'; // For shared preferences

class ToDoPage extends StatefulWidget {
  @override
  _ToDoPageState createState() => _ToDoPageState();
}

class _ToDoPageState extends State<ToDoPage> {
  List<ToDoItem> todoItems = [];

  final TextEditingController _controller = TextEditingController();
  DateTime _selectedDate = DateTime.now();
  TimeOfDay _selectedTime = TimeOfDay.now();

  @override
  void initState() {
    super.initState();
    _loadToDoItems();
  }

  Future<void> _loadToDoItems() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? items = prefs.getStringList('todo_items');

    if (items != null) {
      setState(() {
        todoItems = items.map((item) {
          final parts = item.split('|');
          final dateTime = DateTime.parse(parts[1]);
          return ToDoItem(
              text: parts[0], isDone: parts[2] == 'true', dateTime: dateTime);
        }).toList();
      });
    }
  }

  Future<void> _saveToDoItems() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> items = todoItems.map((item) {
      return '${item.text}|${item.dateTime.toIso8601String()}|${item.isDone}';
    }).toList();
    await prefs.setStringList('todo_items', items);
  }

  Future<void> _selectDate() async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (pickedDate != null && pickedDate != _selectedDate)
      setState(() {
        _selectedDate = pickedDate;
      });
  }

  Future<void> _selectTime() async {
    TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: _selectedTime,
    );
    if (pickedTime != null && pickedTime != _selectedTime)
      setState(() {
        _selectedTime = pickedTime;
      });
  }

  void _addToDo() {
    final newToDo = _controller.text;
    if (newToDo.isNotEmpty) {
      final dateTime = DateTime(
        _selectedDate.year,
        _selectedDate.month,
        _selectedDate.day,
        _selectedTime.hour,
        _selectedTime.minute,
      );
      setState(() {
        todoItems.add(ToDoItem(
          text: newToDo,
          dateTime: dateTime,
        ));
        _controller.clear();
        _saveToDoItems(); // Save items after adding a new one
      });
    }
  }

  void _toggleDone(int index) {
    setState(() {
      todoItems[index].isDone = !todoItems[index].isDone;
      _saveToDoItems(); // Save items after updating status
    });
  }

  void _deleteToDo(int index) {
    setState(() {
      todoItems.removeAt(index);
      _saveToDoItems(); // Save items after deleting
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ToDo List'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Text(
                'Add a new ToDo',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Enter your task',
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
              ),
              maxLength: 100,
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: _selectDate,
                    child: Text(
                        'Date: ${DateFormat('yyyy-MM-dd').format(_selectedDate)}'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueAccent,
                      padding: EdgeInsets.symmetric(vertical: 12),
                      textStyle: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton(
                    onPressed: _selectTime,
                    child: Text('Time: ${_selectedTime.format(context)}'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueAccent,
                      padding: EdgeInsets.symmetric(vertical: 12),
                      textStyle: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _addToDo,
              child: Text('Add ToDo'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal,
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: todoItems.length,
                itemBuilder: (context, index) {
                  final item = todoItems[index];
                  return Card(
                    margin: EdgeInsets.symmetric(vertical: 8.0),
                    elevation: 4,
                    child: ListTile(
                      contentPadding: EdgeInsets.all(16.0),
                      title: Text(
                        item.text,
                        style: TextStyle(
                          fontSize: 16,
                          decoration:
                              item.isDone ? TextDecoration.lineThrough : null,
                        ),
                      ),
                      subtitle: Text(
                        DateFormat('yyyy-MM-dd – kk:mm').format(item.dateTime),
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: Icon(
                              item.isDone
                                  ? Icons.check_circle
                                  : Icons.arrow_forward,
                              color: item.isDone ? Colors.green : Colors.grey,
                            ),
                            onPressed: () => _toggleDone(index),
                          ),
                          IconButton(
                            icon: Icon(Icons.delete, color: Colors.red),
                            onPressed: () => _deleteToDo(index),
                          ),
                        ],
                      ),
                      onTap: () => _toggleDone(index),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ToDoItem {
  String text;
  bool isDone;
  DateTime dateTime;

  ToDoItem({required this.text, this.isDone = false, required this.dateTime});
}
