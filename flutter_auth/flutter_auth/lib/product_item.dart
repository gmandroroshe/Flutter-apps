import 'package:flutter/material.dart';
import 'product_detail_page.dart';

class ProductItem extends StatelessWidget {
  final String title;
  final String price;
  final String imageUrl;
  final String description;
  final List<String> details;

  const ProductItem({
    super.key,
    required this.title,
    required this.price,
    required this.imageUrl,
    required this.description,
    required this.details,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                ProductDetailPage(
              title: title,
              imageUrl: imageUrl,
              price: price,
              description: description,
              details: details,
            ),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              const begin = 0.0;
              const end = 1.0;
              const curve = Curves.easeInOut;

              // Create a scale animation
              var scaleTween =
                  Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
              var scaleAnimation = animation.drive(scaleTween);

              // Create a fade animation
              var fadeTween =
                  Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
              var fadeAnimation = animation.drive(fadeTween);

              // Use a combined scale and fade transition
              return FadeTransition(
                opacity: fadeAnimation,
                child: ScaleTransition(
                  scale: scaleAnimation,
                  child: child,
                ),
              );
            },
            transitionDuration: const Duration(
                milliseconds: 300), // Shorter duration for quicker transitions
          ),
        );
      },
      child: Hero(
        tag: 'product-image-$title', // Unique tag for the hero animation
        child: Container(
          margin: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            color: Colors.brown[800], // Dark background for dark theme
            borderRadius: BorderRadius.circular(16.0),
            boxShadow: [
              BoxShadow(
                color:
                    Colors.black.withOpacity(0.4), // Darker shadow for contrast
                spreadRadius: 2,
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(16.0)),
                child: Image.asset(
                  imageUrl,
                  height: 150,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.white, // White text for dark background
                      ),
                    ),
                    const SizedBox(height: 4.0),
                    Text(
                      price,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color:
                            Colors.white70, // Slightly lighter text for price
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
