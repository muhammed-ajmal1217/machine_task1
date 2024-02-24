import 'package:flutter/material.dart';
import 'package:machinetask/controller/bottomnav_provider.dart';
import 'package:machinetask/views/account.dart';
import 'package:machinetask/views/explore.dart';
import 'package:machinetask/views/meetup/meetup.dart';
import 'package:machinetask/views/homepage.dart';
import 'package:machinetask/views/prolet.dart';
import 'package:provider/provider.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color activeColor = Color.fromARGB(255, 4, 146, 159);
    Color color = Color.fromARGB(255, 2, 43, 82);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Consumer<BottomNavigationProvider>(
        builder: (context, provider, _) => IndexedStack(
          index: provider.currentIndex,
          children: const [
            HomePage(),
            Prolet(),
            Meetup(),
            Explore(),
            Account(),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 15),
        child: Consumer<BottomNavigationProvider>(
          builder: (context, provider, _) => NavigationBar(
            backgroundColor: Colors.white,
            selectedIndex: provider.currentIndex,
            onDestinationSelected: (index) {
              provider.updateIndex(index);
            },
            destinations: [
              NavigationDestination(
                icon: Icon(Icons.home_outlined,
                    color: provider.currentIndex == 0
                        ? activeColor
                        : color),
                label: 'Home',
              ),
              NavigationDestination(
                icon: Icon(Icons.view_comfy_alt_outlined,
                    color: provider.currentIndex == 1
                        ? activeColor
                        : color),
                label: 'Prolet',
              ),
              NavigationDestination(
                icon: Icon(Icons.handshake_outlined,
                    color: provider.currentIndex == 2
                        ? activeColor
                        : color),
                label: 'Meetup',
              ),
              NavigationDestination(
                icon: Icon(Icons.travel_explore,
                    color: provider.currentIndex == 3
                        ? activeColor
                        : color),
                label: 'Explore',
              ),
              NavigationDestination(
                icon: Icon(Icons.person_outline_outlined,
                    color: provider.currentIndex == 4
                        ? activeColor
                        : color),
                label: 'Account',
              ),
            ],
            surfaceTintColor: Colors.white,
            indicatorColor: Colors.white,
          ),
        ),
      ),
    );
  }
}
