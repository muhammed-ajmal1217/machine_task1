import 'package:flutter/material.dart';
import 'package:machinetask/controller/login_provider.dart';
import 'package:machinetask/service/authservice.dart';
import 'package:machinetask/views/bottom_navbar.dart';
import 'package:machinetask/views/login/widgets.dart';
import 'package:machinetask/views/login/widgets/media_signini_widget.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => LoginProvider(),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 30, right: 30),
            child: Consumer<LoginProvider>(
              builder: (context, pro, child) => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 130,
                  ),
                  Center(
                    child: TextWidgets(text: 'Hi, Welcome Back!', size: 23),
                  ),
                  const SizedBox(height: 40),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Please Sign in to Continue',
                      style: TextStyle(
                          color: Color.fromARGB(255, 6, 55, 118), fontSize: 16),
                    ),
                  ),
                  Form(
                    key: pro.formKey1,
                    child: TextFormField(
                      onChanged: pro.validateEmail,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Field is empty';
                        } else if (!value.contains('.com')) {
                          return 'Enter a valid E-mail"';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          hintText: 'Enter E-mail or Mob No. ',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15))),
                    ),
                  ),
                  Align(
                      alignment: Alignment.centerRight,
                      child: TextWidgets(
                        text: 'Sign-In With OTP',
                        size: 16,
                      )),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Password',
                      style: TextStyle(
                          color: Color.fromARGB(255, 6, 55, 118), fontSize: 16),
                    ),
                  ),
                  Form(
                    key: pro.formKey2,
                    child: TextFormField(
                      onChanged: pro.validatePassword,
                      validator: (value) => value == null || value.isEmpty
                          ? 'Field is empty'
                          : null,
                      obscureText: true,
                      decoration: InputDecoration(
                          hintText: 'Enter Password',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15))),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Checkbox(
                            activeColor: Colors.blue,
                            value: pro.remeberMe,
                            onChanged: (value) {
                              pro.rememberMe(value);
                            },
                          ),
                          const Text(
                            'Remember me',
                            style: TextStyle(
                                color: Color.fromARGB(255, 6, 70, 118),
                                fontSize: 14,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                      TextWidgets(
                        text: 'Forgot Password',
                        size: 16,
                      ),
                    ],
                  ),
                  InkWell(
                    onTap: () async {
                      if (pro.isEmailValid && pro.isPasswordValid) {
                        bool loggedIn = await ApiService().login(
                            pro.emailController.text,
                            pro.passwordController.text);
                        if (loggedIn) {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => BottomNavigation()),
                          );
                        } else {
                          print('Login failed');
                        }
                      } else {
                        print('Data is Empty');
                      }
                    },
                    child: Container(
                      width: double.infinity,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: pro.isEmailValid && pro.isPasswordValid
                            ? Colors.blue
                            : const Color.fromARGB(255, 207, 207, 207),
                      ),
                      child: const Center(
                        child: Text(
                          'Submit',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                            height: 1, width: 120, color: Colors.grey),
                      ),
                      const Text('Or'),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                            height: 1, width: 120, color: Colors.grey),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  // media signin options
                  const MediaSigninOption(),
                  const SizedBox(
                    height: 30,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Business User?',
                            style: TextStyle(
                                color: Color.fromARGB(255, 100, 100, 100)),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Login here',
                            style: TextStyle(
                                color: Color.fromARGB(255, 6, 70, 118),
                                fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            'Dont have an account?',
                            style: TextStyle(
                                color: Color.fromARGB(255, 100, 100, 100)),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Sign Up',
                            style: TextStyle(
                                color: Color.fromARGB(255, 6, 70, 118),
                                fontWeight: FontWeight.w500),
                          )
                        ],
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 17,
                  ),
                  const Align(
                    alignment: Alignment.center,
                    child: Column(
                      children: [
                        Text(
                          'By Continuing, you agree to',
                          style: TextStyle(
                              color: Color.fromARGB(255, 157, 172, 227)),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Promilo's",
                                style: TextStyle(
                                    color: Color.fromARGB(255, 157, 172, 227))),
                            Text(
                              'Terms of Use & Privacy Policy',
                              style: TextStyle(fontWeight: FontWeight.w500),
                            )
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
