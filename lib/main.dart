import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Notes application",
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Notes Application",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          backgroundColor: const Color.fromARGB(255, 6, 31, 51),
        ),
        body: const Center(
          child: Text(
            "Welcome to the Notes application",
            style: TextStyle(color: Colors.green, fontSize: 15),
          ),
        ),
      ),
    );
  }
}
