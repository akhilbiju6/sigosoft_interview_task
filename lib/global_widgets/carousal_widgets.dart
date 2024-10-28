
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CarouselSliderWidget extends StatelessWidget {
  const CarouselSliderWidget({
    super.key,
    required this.carouselItems,
  });

  final List<Widget> carouselItems;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
       items: carouselItems,
       options: CarouselOptions(
         height: 150, 
         autoPlay: true, 
         onPageChanged: (index, reason) {
         },
         
       ),
     );
  }
}
