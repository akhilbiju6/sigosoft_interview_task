import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CarouselSliderWidget extends StatelessWidget {
  const CarouselSliderWidget({
    super.key,
  });

  // Instead of passing the carouselItems, we define them here
  final List<String> imageUrls = const [
    'https://img.freepik.com/premium-psd/healthy-delicious-fresh-sea-fish-with-exploding-salad-banner-social-media-post-ai-generated_600260-4385.jpg',
    'https://d1csarkz8obe9u.cloudfront.net/posterpreviews/fish-sale-banner-design-template-4aed97d0677d85cea5f71516822b902d_screen.jpg?ts=1679859206',
    'https://d1csarkz8obe9u.cloudfront.net/posterpreviews/frozen-fish-sale-ad-design-template-ac653bbe001ee260c02b3653c430ef29_screen.jpg?ts=1708963262',
  ];

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: imageUrls.map((imageUrl) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            color: Colors.grey[200], 
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8.0), 
            child: Image.network(
              imageUrl,
              fit: BoxFit.fill, // Set the BoxFit property here
              width: double.infinity, // Ensure the image covers the full width of the container
              height: double.infinity, // Ensure the image covers the full height of the container
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child;
                return Center(
                  child: CircularProgressIndicator(
                    value: loadingProgress.expectedTotalBytes != null
                        ? loadingProgress.cumulativeBytesLoaded / (loadingProgress.expectedTotalBytes ?? 1)
                        : null,
                  ),
                );
              },
              errorBuilder: (context, error, stackTrace) {
                return Center(child: Icon(Icons.error));
              },
            ),
          ),
        );
      }).toList(),
      options: CarouselOptions(
        height: 150,
        autoPlay: true,
        enlargeCenterPage: true,
        onPageChanged: (index, reason) {
          // Handle page change if needed
        },
      ),
    );
  }
}
