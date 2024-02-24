import 'package:flutter/material.dart';

class BottomNavigationProvider extends ChangeNotifier {
  int currentIndex = 2;

  void updateIndex(int index) {
    currentIndex = index;
    notifyListeners();
  }
}
