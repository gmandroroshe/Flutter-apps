import 'package:flutter/material.dart';

class ProductDetailPage extends StatelessWidget {
  final String title;
  final String price;
  final String imageUrl;
  final String description;
  final List<String> details;

  const ProductDetailPage({
    super.key,
    required this.title,
    required this.imageUrl,
    required this.price,
    required this.description,
    required this.details,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:
            Colors.brown[900], // Darker AppBar color for dark theme
        title: Text(title),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Hero(
            tag: 'product-image-$title', // Same tag as in ProductItem
            child: Image.asset(
              imageUrl,
              height: 300,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    color: Colors.white, // White text for dark background
                  ),
                ),
                const SizedBox(height: 8.0),
                Text(
                  price,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.white70, // Slightly lighter text
                  ),
                ),
                const SizedBox(height: 16.0),
                Text(
                  description,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white70, // Lighter text for readability
                  ),
                ),
                const SizedBox(height: 16.0),
                Text(
                  'Details:',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.white, // White text for dark background
                  ),
                ),
                const SizedBox(height: 8.0),
                for (var detail in details)
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    child: Text(
                      detail,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white70, // Lighter text for readability
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
      backgroundColor: Colors.brown[900], // Dark background for the page
    );
  }
}
