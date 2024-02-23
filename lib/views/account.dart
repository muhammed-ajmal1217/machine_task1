import 'package:flutter/material.dart';

class Account extends StatelessWidget {
  const Account({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Acount',
          style: TextStyle(
              color: const Color.fromARGB(255, 4, 52, 90),
              fontSize: 25,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}