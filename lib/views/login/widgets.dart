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

class TextWidget extends StatelessWidget {
  String text;
   TextWidget({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        text,
        style: TextStyle(
            color: Color.fromARGB(255, 6, 70, 118),
            fontSize: 16,
            fontWeight: FontWeight.w600),
      ),
    );
  }
}