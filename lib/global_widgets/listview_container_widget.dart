import 'package:flutter/material.dart';

class ListViewContainer extends StatelessWidget {
  final String imageUrl;   // Required parameter for image URL
  final String name;       // Required parameter for name
  final String mrp;        // Required parameter for MRP (Maximum Retail Price)
  final String netPrice;   // Required parameter for Net Price
  final String netQuantity; // Required parameter for Net Quantity
  final String? offerPrice; // Optional parameter for Offer Price

  const ListViewContainer({
    super.key,
    required this.imageUrl,    // Initialize imageUrl
    required this.name,        // Initialize name
    required this.mrp,         // Initialize MRP
    required this.netPrice,    // Initialize net price
    required this.netQuantity, // Initialize net quantity
    this.offerPrice,           // Optional offer price
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.grey.shade300), // Subtle border
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
                borderRadius: BorderRadius.circular(10), // Rounded corners for the image
              ),
            ),
            const SizedBox(height: 8), // Spacing between image and text
            // Product Name
            Text(
              name, // Use the name parameter
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 5), // Spacing
            // Net Quantity
            Text(
              "Net Quantity: $netQuantity", // Use the netQuantity parameter
              style: const TextStyle(
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 5), // Spacing
            // Net Price
            Text(
              "Net Price: \$ $netPrice", // Use the netPrice parameter
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
                color: Colors.green, // Highlight net price with green
              ),
            ),
            const SizedBox(height: 5), // Spacing
            // MRP
            Text(
              "MRP: \$ $mrp", // Use the mrp parameter
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
                decoration: TextDecoration.lineThrough, // Strikethrough for MRP
                color: Colors.redAccent, // Red color for MRP to show it's slashed
              ),
            ),
            const SizedBox(height: 5), // Spacing
            // Offer Price (Optional)
            if (offerPrice != null)
              Text(
                "Offer: \$ $offerPrice", // Use the offerPrice parameter if available
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  color: Colors.blue, // Offer price highlighted with blue
                ),
              ),
          ],
        ),
      ),
    );
  }
}
