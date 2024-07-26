import 'package:flutter/material.dart';

void main() {
  runApp(BMICalculatorApp());
}

class BMICalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  final List<Widget> _widgetOptions = [
    BMICalculatorScreen(),
    InfoScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.calculate),
            label: 'Calculator',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: 'Info',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blueAccent,
        onTap: _onItemTapped,
      ),
    );
  }
}

class BMICalculatorScreen extends StatefulWidget {
  @override
  _BMICalculatorScreenState createState() => _BMICalculatorScreenState();
}

class _BMICalculatorScreenState extends State<BMICalculatorScreen> {
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  double _height = 170.0;
  double _weight = 70.0;
  double? _bmiResult;
  String _resultText = "";

  void _calculateBMI() {
    double height = _height / 100;
    double weight = _weight;

    setState(() {
      _bmiResult = weight / (height * height);
      if (_bmiResult! < 18.5) {
        _resultText = "Underweight";
      } else if (_bmiResult! >= 18.5 && _bmiResult! < 24.9) {
        _resultText = "Normal weight";
      } else if (_bmiResult! >= 25 && _bmiResult! < 29.9) {
        _resultText = "Overweight";
      } else {
        _resultText = "Obesity";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _heightController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Height (cm)',
                labelStyle: TextStyle(color: Colors.blueAccent),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(color: Colors.blueAccent),
                ),
              ),
              onChanged: (value) {
                setState(() {
                  _height = double.tryParse(value) ?? _height;
                });
              },
            ),
            Slider(
              value: _height,
              min: 100,
              max: 220,
              divisions: 120,
              label: _height.round().toString(),
              onChanged: (double value) {
                setState(() {
                  _height = value;
                  _heightController.text = value.toStringAsFixed(1);
                });
              },
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _weightController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Weight (kg)',
                labelStyle: TextStyle(color: Colors.blueAccent),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(color: Colors.blueAccent),
                ),
              ),
              onChanged: (value) {
                setState(() {
                  _weight = double.tryParse(value) ?? _weight;
                });
              },
            ),
            Slider(
              value: _weight,
              min: 30,
              max: 150,
              divisions: 120,
              label: _weight.round().toString(),
              onChanged: (double value) {
                setState(() {
                  _weight = value;
                  _weightController.text = value.toStringAsFixed(1);
                });
              },
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _calculateBMI,
              child: Text('Calculate'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                textStyle: TextStyle(fontSize: 18),
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              _bmiResult == null
                  ? 'Enter values'
                  : 'BMI: ${_bmiResult!.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 24.0),
            ),
            SizedBox(height: 16.0),
            Text(
              _resultText,
              style: TextStyle(fontSize: 24.0),
            ),
          ],
        ),
      ),
    );
  }
}

class InfoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Info'),
      ),
      body: Center(
        child: Text(
          'This is the info screen',
          style: TextStyle(fontSize: 24.0),
        ),
      ),
    );
  }
}
