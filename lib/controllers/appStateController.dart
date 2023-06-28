import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rhythmic_social/screens/MainScreens/exploreScreen.dart';
import 'package:rhythmic_social/screens/MainScreens/homeScreen.dart';
import 'package:rhythmic_social/screens/MainScreens/profileScreen.dart';

class AppStateController extends GetxController{
  // Instant Variables
  final List<Widget> _screens = [
    HomeScreen(),
    ExploreScreen(),
    ProfileScreen()
  ];
  int _selectedIndex = 0;


  // GETTERS
  List<Widget> get screens => _screens;
  int get selectedIndex => _selectedIndex;

  // SETTERS
  updateSelectedIndexItem(value) {
    _selectedIndex = value;
    update();
  }

}