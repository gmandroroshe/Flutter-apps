import 'package:flutter/material.dart';
import 'category_item.dart';
import 'product_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Coffee Shop'),
        backgroundColor: Colors.brown[900], // Darker color for dark theme
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              // Handle settings button press
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Section 2: Search bar
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search...',
                  prefixIcon: Icon(Icons.search, color: Colors.white70),
                  fillColor: Colors.brown[800],
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12.0)),
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12.0)),
                    borderSide: BorderSide.none,
                  ),
                ),
                style: TextStyle(color: Colors.white),
              ),
            ),
            // Section 3: Category list
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Categories',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            Container(
              height: 120,
              margin: const EdgeInsets.symmetric(vertical: 8.0),
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: const [
                  CategoryItem(
                    title: 'Espresso',
                    imageUrl: 'assets/space1.webp',
                  ),
                  CategoryItem(
                    title: 'Latte',
                    imageUrl: 'assets/space2.jpg',
                  ),
                  CategoryItem(
                    title: 'Cappuccino',
                    imageUrl: 'assets/space3.jpg',
                  ),
                  CategoryItem(
                    title: 'Mocha',
                    imageUrl: 'assets/space4.jpg',
                  ),
                ],
              ),
            ),
            // Section 4: Products
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Products',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            GridView.builder(
              padding: const EdgeInsets.all(8.0),
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 8.0,
                childAspectRatio: 0.7,
              ),
              itemCount: 4,
              itemBuilder: (context, index) {
                return ProductItem(
                  title: 'Coffee ${index + 1}',
                  price: '\$${(index + 1) * 5}',
                  imageUrl:
                      'assets/space${index + 1}.${index == 0 ? 'webp' : 'jpg'}',
                  description:
                      'Delicious Coffee ${index + 1} made from the finest beans. Enjoy a rich and aromatic experience with every sip.', // Example description
                  details: [
                    'High quality beans',
                    'Freshly roasted',
                    'Perfectly brewed',
                    'Available in various sizes'
                  ], // Example details
                );
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.brown[200],
        unselectedItemColor: Colors.brown[400],
        backgroundColor: Colors.brown[900], // Darker background for bottom bar
        onTap: _onItemTapped,
      ),
    );
  }
}
