
import 'package:flutter/material.dart';

class ListviewWidget extends StatelessWidget {
  final String imageUrl; // Required parameter for image URL
  final String name;     // Required parameter for name
  final String mrp;      // Required parameter for MRP

  const ListviewWidget({
    super.key,
    required this.imageUrl, // Initialize imageUrl
    required this.name,      // Initialize name
    required this.mrp,       // Initialize MRP
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image Container
            Container(
              height: 120,
              width: 150,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(imageUrl), // Use the imageUrl parameter
                  fit: BoxFit.cover, // Ensure the image covers the container
                ),
                borderRadius: BorderRadius.circular(15), // Match the Card's border radius
                color: Colors.red, // Fallback color
              ),
            ),
            const SizedBox(height: 8), // Add some spacing between the image and the text
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                name, // Use the name parameter
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
            const SizedBox(height: 5), // Adjust spacing as needed
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "\$ $mrp", // Use the mrp parameter
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}