import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipe/views/screens/profile_page.dart';
import '../../views/screens/home_view.dart';

class ControlViewModel extends GetxController {
  int _navigatorValue = 0;

  get navigatorValue => _navigatorValue;

  Widget currentScreen = HomeView();

  void changeSelectedValue(int selectedValue) {
    _navigatorValue = selectedValue;
    switch (selectedValue) {
      case 0:
        {
          currentScreen = HomeView();
          break;
        }
      case 1:
        {
          currentScreen = ProfilePage();
          break;
        }
    }
    update();
  }
}
