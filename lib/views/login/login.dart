import 'package:flutter/material.dart';
import 'package:machinetask/service/authservice.dart';
import 'package:machinetask/views/bottom_navbar.dart';
import 'package:machinetask/views/meetup/meetup.dart';
import 'package:machinetask/views/login/widgets.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _formKey1 = GlobalKey<FormState>();
  final _formKey2 = GlobalKey<FormState>();
  bool isEmailValid = false;
  bool isPasswordValid = false;
  bool taskCompleted = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 30, right: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 130,
              ),
              Center(
                child: Text(
                  'Hi, Welcome Back!',
                  style: TextStyle(
                      color: Color.fromARGB(255, 6, 55, 118),
                      fontSize: 23,
                      fontWeight: FontWeight.w600),
                ),
              ),
              SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Please Sign in to Continue',
                  style: TextStyle(
                      color: Color.fromARGB(255, 6, 55, 118), fontSize: 16),
                ),
              ),
              Form(
                key: _formKey1,
                child: TextFormField(
                  onChanged: (value) {
                    setState(() {
                      isEmailValid =
                          _formKey1.currentState?.validate() ?? false;
                    });
                  },
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
                  child: TextWidget(
                    text: 'Sign-In With OTP',
                  )),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Password',
                  style: TextStyle(
                      color: Color.fromARGB(255, 6, 55, 118), fontSize: 16),
                ),
              ),
              Form(
                key: _formKey2,
                child: TextFormField(
                  onChanged: (value) {
                    setState(() {
                      isPasswordValid =
                          _formKey2.currentState?.validate() ?? false;
                    });
                  },
                  validator: (value) =>
                      value == null || value.isEmpty ? 'Field is empty' : null,
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
                        value: taskCompleted,
                        onChanged: (value) {
                          setState(() {
                            taskCompleted = value ?? false;
                          });
                        },
                      ),
                      Text(
                        'Remember me',
                        style: TextStyle(
                            color: Color.fromARGB(255, 6, 70, 118),
                            fontSize: 14,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                  TextWidget(text: 'Forgot Password'),
                ],
              ),
              InkWell(
                onTap: () async {
                  //test45@yopmail.com
                  //Test@123
                  // emailController.text='abc@abc.com';
                  // passwordController.text='password123';
                  // if (isEmailValid && isPasswordValid) {
                  //   bool loggedIn = await ApiService()
                  //       .login(emailController.text, passwordController.text);
                  //   if (loggedIn) {
                  //     Navigator.pushReplacement(
                  //       context,
                  //       MaterialPageRoute(builder: (context) => BottomNavigation()),
                  //     );
                  //   } else {
                  //     print('Login failed');
                  //   }
                  // } else {
                  //   print('Data is Empty');
                  // }

                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => BottomNavigation(),));
                },
                child: Container(
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: isEmailValid && isPasswordValid
                        ? Colors.blue
                        : Color.fromARGB(255, 207, 207, 207),
                  ),
                  child: Center(
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
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(height: 1, width: 120, color: Colors.grey),
                  ),
                  Text('Or'),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(height: 1, width: 120, color: Colors.grey),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
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
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Business User?',
                        style: TextStyle(
                            color: const Color.fromARGB(255, 100, 100, 100)),
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
                            color: const Color.fromARGB(255, 100, 100, 100)),
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
              SizedBox(
                height: 17,
              ),
              Align(
                alignment: Alignment.center,
                child: Column(
                  children: [
                    Text(
                      'By Continuing, you agree to',
                      style:
                          TextStyle(color: Color.fromARGB(255, 157, 172, 227)),
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
    );
  }
}
