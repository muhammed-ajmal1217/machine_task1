
import 'package:flutter/material.dart';
import 'package:machinetask/views/login/widgets.dart';

class MediaSigninOption extends StatelessWidget {
  const MediaSigninOption({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        LoginPageOptions(
          image: 'assets/google (1).png',
        ),
        SizedBox(
          width: 15,
        ),
        LoginPageOptions(
          image: 'assets/linkedin.png',
        ),
        SizedBox(
          width: 15,
        ),
        LoginPageOptions(
          image: 'assets/facebook.png',
        ),
        SizedBox(
          width: 15,
        ),
        LoginPageOptions(
          image: 'assets/instagram.png',
        ),
        SizedBox(
          width: 15,
        ),
        LoginPageOptions(
          image: 'assets/whatsapp.png',
        ),
      ],
    );
  }
}
