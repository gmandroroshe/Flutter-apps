import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Beautiful UI App',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        title: Text('Beautiful UI Home'),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.teal.shade200, Colors.teal.shade800],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: kToolbarHeight + 20),
                Text(
                  'Welcome to the Beautiful UI App',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 20),
                SectionHeader(title: 'Favorites'),
                CustomCard(
                  icon: Icons.star,
                  text: 'This is a card with some text and an icon.',
                ),
                SizedBox(height: 20),
                CustomCard(
                  icon: Icons.favorite,
                  text: 'Another beautiful card with a different icon.',
                ),
                SizedBox(height: 20),
                SectionHeader(title: 'Ideas'),
                CustomCard(
                  icon: Icons.lightbulb,
                  text: 'Yet another card with an inspiring icon.',
                ),
                SizedBox(height: 20),
                SectionHeader(title: 'Gallery'),
                GalleryImage(imagePath: 'assets/images/sample1.jpg'),
                SizedBox(height: 20),
                GalleryImage(imagePath: 'assets/images/sample2.jpg'),
                SizedBox(height: 20),
                Center(
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text('Get Started'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.teal.shade700,
                      padding:
                          EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                      textStyle: TextStyle(fontSize: 18),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Center(
                  child: TextButton(
                    onPressed: () {},
                    child: Text('Learn More',
                        style: TextStyle(color: Colors.white, fontSize: 16)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 10,
        child: Container(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: Icon(Icons.home, color: Colors.white),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.vpn_key, color: Colors.white),
                onPressed: () {},
              ),
              SizedBox(width: 40), // The gap for the floating action button
              IconButton(
                icon: Icon(Icons.calendar_today, color: Colors.white),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.settings, color: Colors.white),
                onPressed: () {},
              ),
            ],
          ),
        ),
        color: Colors.teal.shade800,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.pinkAccent,
        child: Icon(Icons.add),
      ),
    );
  }
}

class CustomCard extends StatelessWidget {
  final IconData icon;
  final String text;

  CustomCard({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.8),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 6,
            offset: Offset(2, 2),
          ),
        ],
      ),
      padding: EdgeInsets.all(16),
      child: Row(
        children: [
          Icon(icon, color: Colors.teal, size: 40),
          SizedBox(width: 10),
          Expanded(
            child: Text(
              text,
              style: TextStyle(fontSize: 18, color: Colors.teal.shade900),
            ),
          ),
        ],
      ),
    );
  }
}

class SectionHeader extends StatelessWidget {
  final String title;

  SectionHeader({required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    );
  }
}

class GalleryImage extends StatelessWidget {
  final String imagePath;

  GalleryImage({required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 6,
            offset: Offset(2, 2),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Image.asset(
          imagePath,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
