import 'package:flutter/material.dart';

class Prolet extends StatelessWidget {
  const Prolet({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Prolet',
          style: TextStyle(
              color: const Color.fromARGB(255, 4, 52, 90),
              fontSize: 25,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}