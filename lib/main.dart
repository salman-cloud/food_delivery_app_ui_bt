import 'package:flutter/material.dart';
import 'package:food_delivery_app_ui_bt/screens/homescreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Delivery food app',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.grey.shade100,
        primaryColor: Colors.deepOrangeAccent.shade700,
      ),
      home: const HomeScreen() ,
    );
  }
}


