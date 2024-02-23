import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Home page',
          style: TextStyle(
              color: const Color.fromARGB(255, 4, 52, 90),
              fontSize: 25,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
