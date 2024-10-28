import 'package:flutter/material.dart';

class GridViewWidget extends StatelessWidget {
  final String imageUrl; // Property for the image URL
  final String name; // Property for the name

  const GridViewWidget({
    super.key,
    required this.imageUrl, // Marked as required
    required this.name, // Marked as required
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center, // Center the column vertically
      children: [
        CircleAvatar(
          radius: 30, // Set the radius of the CircleAvatar
          backgroundImage: NetworkImage(imageUrl), // Use the passed image URL
        ),
        const SizedBox(height: 8), // Spacing between avatar and text
        Text(
          name, // Use the passed name
          style: const TextStyle(
            fontSize: 14, // Set the font size of the text
            fontWeight: FontWeight.normal, // Set the font weight (normal, bold, etc.)
          ),
        ),
      ],
    );
  }
}
