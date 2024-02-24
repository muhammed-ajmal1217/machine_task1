import 'package:flutter/material.dart';

class LoginPageOptions extends StatelessWidget {
  String image;
   LoginPageOptions({
    super.key,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      width: 45,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage(image,))
      ),
    );
  }
}


class TextWidgets extends StatelessWidget {
  String text;
  double size;
   TextWidgets({
    super.key,
    required this.text,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          color: Color.fromARGB(255, 6, 55, 118),
          fontSize: size,
          fontWeight: FontWeight.w600),
    );
  }
}