import 'package:flutter/material.dart';
import 'package:machinetask/controller/bottomnav_provider.dart';
import 'package:machinetask/controller/login_provider.dart';
import 'package:machinetask/controller/meetup_provider.dart';
import 'package:machinetask/views/login/login.dart';
import 'package:provider/provider.dart';

void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => LoginProvider(),),
        ChangeNotifierProvider(create: (context) => BottomNavigationProvider(),),
        ChangeNotifierProvider(create: (context) => MeetupProvider(),),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: LoginScreen(),
      ),
    );
  }
}