import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'News'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          title,
          style: const TextStyle(color: Colors.white),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Screen1()),
                  );
                },
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                      color: const Color.fromRGBO(255, 235, 59, 1),
                      borderRadius: BorderRadius.circular(20)),
                  margin: const EdgeInsets.all(8.0),
                  child: const Center(
                    child: Text(
                      'Box 1',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Screen2()),
                  );
                },
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                      color: const Color.fromRGBO(255, 235, 59, 1),
                      borderRadius: BorderRadius.circular(20)),
                  margin: const EdgeInsets.all(8.0),
                  child: const Center(
                    child: Text(
                      'Box 2',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Screen3()),
                  );
                },
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                      color: const Color.fromRGBO(255, 235, 59, 1),
                      borderRadius: BorderRadius.circular(20)),
                  margin: const EdgeInsets.all(8.0),
                  child: const Center(
                    child: Text(
                      'Box 3',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Screen4()),
                  );
                },
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                      color: const Color.fromRGBO(255, 235, 59, 1),
                      borderRadius: BorderRadius.circular(20)),
                  margin: const EdgeInsets.all(8.0),
                  child: const Center(
                    child: Text(
                      'Box 4',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Screen5()),
                  );
                },
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                      color: const Color.fromRGBO(255, 235, 59, 1),
                      borderRadius: BorderRadius.circular(20)),
                  margin: const EdgeInsets.all(8.0),
                  child: const Center(
                    child: Text(
                      'Box 5',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Screen6()),
                  );
                },
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                      color: const Color.fromRGBO(255, 235, 59, 1),
                      borderRadius: BorderRadius.circular(20)),
                  margin: const EdgeInsets.all(8.0),
                  child: const Center(
                    child: Text(
                      'Box 6',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Screen7()),
                  );
                },
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                      color: const Color.fromRGBO(255, 235, 59, 1),
                      borderRadius: BorderRadius.circular(20)),
                  margin: const EdgeInsets.all(8.0),
                  child: const Center(
                    child: Text(
                      'Box 7',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Screen8()),
                  );
                },
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                      color: const Color.fromRGBO(255, 235, 59, 1),
                      borderRadius: BorderRadius.circular(20)),
                  margin: const EdgeInsets.all(8.0),
                  child: const Center(
                    child: Text(
                      'Box 8',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.black,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
              icon: const Icon(Icons.home, color: Colors.white),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.search, color: Colors.white),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.notifications, color: Colors.white),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.account_circle, color: Colors.white),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}

class Screen1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Screen 1'),
      ),
      body: const Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'This is Screen 1, ',
                style: TextStyle(fontSize: 24, color: Colors.white),
              ),
              SizedBox(height: 20),
              Text(
                'Here is a paragraph for Screen 1. You can add any additional text or content here. You can add any additional text or content here. You can add any additional text or content here. You can add any additional text or content here.',
                style: TextStyle(fontSize: 16, color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.black,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Builder(
              builder: (BuildContext context) {
                return IconButton(
                  icon: const Icon(Icons.home, color: Colors.white),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                );
              },
            ),
            IconButton(
              icon: const Icon(Icons.search, color: Colors.white),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.notifications, color: Colors.white),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.account_circle, color: Colors.white),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}

class Screen2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Screen 2'),
      ),
      body: const Center(
        child: Text(
          'This is Screen 2',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}

class Screen3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Screen 3'),
      ),
      body: const Center(
        child: Text(
          'This is Screen 3',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}

class Screen4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Screen 4'),
      ),
      body: const Center(
        child: Text(
          'This is Screen 4',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}

class Screen5 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Screen 4'),
      ),
      body: const Center(
        child: Text(
          'This is Screen 4',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}

class Screen6 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Screen 4'),
      ),
      body: const Center(
        child: Text(
          'This is Screen 4',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}

class Screen7 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Screen 4'),
      ),
      body: const Center(
        child: Text(
          'This is Screen 4',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}

class Screen8 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Screen 4'),
      ),
      body: const Center(
        child: Text(
          'This is Screen 4',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
