
import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final String location;
  final String searchHint;
  final Color backgroundColor;
  final Color locationIconColor;
  final double searchBarHeight;

  const AppBarWidget({
    super.key,
    required this.location, 
    this.searchHint = "Search...", 
    this.backgroundColor = Colors.red, 
    this.locationIconColor = Colors.white, 
    this.searchBarHeight = 40, 
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(
                Icons.location_on_outlined,
                color: locationIconColor,
                size: 18,
              ),
              const SizedBox(width: 10),
              Flexible( // Make the Text widget flexible
                child: Text(
                  location, // Use passed location text
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
