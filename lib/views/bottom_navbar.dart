import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:machinetask/views/account.dart';
import 'package:machinetask/views/explore.dart';
import 'package:machinetask/views/meetup/meetup.dart';
import 'package:machinetask/views/homepage.dart';
import 'package:machinetask/views/prolet.dart';
class BottomNavigation extends StatefulWidget {

   BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  final List<Widget> _pages = [
    const HomePage(),
    const Prolet(),
    const Meetup(),
    const Explore(),
    const Account(),
  ];

   int currentIndex=2;
   Color activeColor=Color.fromARGB(255, 4, 146, 159);
   Color color=Color.fromARGB(255, 2, 43, 82);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _pages[currentIndex],
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 15),
        child: NavigationBar(
          backgroundColor: Colors.white,
          selectedIndex: currentIndex,
          onDestinationSelected: (index) {
            setState(() {
              currentIndex=index;
            });
          },
          destinations: [
            NavigationDestination(
              icon: Icon(Icons.home_outlined,
                  color:  currentIndex == 0 ? activeColor : color),
              label: 'Home',
            ),
            NavigationDestination(
              icon: Icon(Icons.view_comfy_alt_outlined,
                  color:  currentIndex == 1 ? activeColor : color),
              label: 'Prolet',
              
            ),
            NavigationDestination(
              icon: Icon(Icons.handshake_outlined,
                  color:  currentIndex == 2 ? activeColor : color),
              label: 'Meetup',
            ),
            NavigationDestination(
              icon: Icon(Icons.travel_explore,
                  color:  currentIndex == 3 ? activeColor : color),
              label: 'Explore',
        
            ),
            NavigationDestination(
              icon: Icon(Icons.person_outline_outlined,
                  color:  currentIndex == 4 ? activeColor : color),
              label: 'Account',
        
            ),
        
          ],
          surfaceTintColor: Colors.white,
          indicatorColor: Colors.white,
        ),
      ),
    );
  }
}