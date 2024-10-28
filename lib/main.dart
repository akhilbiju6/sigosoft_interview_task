import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sigosoft_interview_task/control/homescreen_controller/homescreen_controller.dart';
import 'package:sigosoft_interview_task/view/homescreen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ProductController(), // Provide the ProductController
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
