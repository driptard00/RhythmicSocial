import 'package:get/get.dart';
import 'package:rhythmic_social/routes/app_route_names.dart';
import 'package:rhythmic_social/screens/AuthScreens/emailVerificationScreen.dart';
import 'package:rhythmic_social/screens/AuthScreens/musicGenreScreen.dart';
import 'package:rhythmic_social/screens/AuthScreens/profilePictureScreen.dart';
import 'package:rhythmic_social/screens/AuthScreens/registerScreen.dart';
import 'package:rhythmic_social/screens/AuthScreens/usernameScreen.dart';
import 'package:rhythmic_social/screens/AuthScreens/usertypescreen.dart';
import 'package:rhythmic_social/screens/MainScreens/NotificationScreen/notificationScreen.dart';
import 'package:rhythmic_social/screens/MainScreens/holderScreen.dart';

import '../screens/AuthScreens/bioScreen.dart';
import '../screens/AuthScreens/loginScreen.dart';
import '../screens/MainScreens/Settings/settingsScreen.dart';
import '../screens/OnboardingScreens/onboarding1.dart';
import '../screens/OnboardingScreens/onboarding2.dart';
import '../screens/OnboardingScreens/onboarding3.dart';
import '../screens/SplashScreen/splashScreen.dart';

List<GetPage> getPages = [

  // ============= APP ROUTES ==============

  // ========== SPLASH SCREEN ROUTE =========
  GetPage(
    name: splashScreen,
    page: ()=> SplashScreen(),
  ),

  // ========== ONBOARDING SCREEN ROUTE =========
  GetPage(
    name: onboardingscreenone,
    page: ()=> OnboardingScreenOne(),
  ),
  GetPage(
    name: onboardingscreentwo,
    page: ()=> OnboardingScreenTwo(),
  ),
  GetPage(
    name: onboardingscreenthree,
    page: ()=> OnboardingScreenThree(),
  ), 

  // ======== AUTH SCREEN ROUTES ==========
  GetPage(
    name: loginScreen,
    page: ()=> LoginScreen(),
  ), 
  GetPage(
    name: registerScreen,
    page: ()=> RegisterScreen(),
  ), 
  GetPage(
    name: emailverificationScreen,
    page: ()=> EmailVerificationScreen(),
  ), 
  GetPage(
    name: usernameScreen,
    page: ()=> UsernameScreen(),
  ), 
  GetPage(
    name: profilePictureScreen,
    page: ()=> ProfilePictureScreen(),
  ), 
  GetPage(
    name: userTypeScreen,
    page: ()=> UserTypeScreen()
  ), 
  GetPage(
    name: musicGenreScreen,
    page: ()=> MusicGenreScreen()
  ), 
  GetPage(
    name: bioScreen,
    page: ()=> BioScreen(),
  ), 

  // ======== MAIN SCREEN ROUTES =========
  GetPage(
    name: holderScreen,
    page: ()=> HolderScreen(),
  ), 
  GetPage(
    name: notificationScreen,
    page: ()=> NotificationScreen(),
  ), 
  GetPage(
    name: settingsScreen,
    page: ()=> SettingScreen(),
  ), 

];