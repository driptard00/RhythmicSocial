import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rhythmic_social/routes/app_route_names.dart';

import '../../storage/secureStorage.dart';

class SplashScreen extends StatefulWidget {
  Map<String, dynamic>? loggedInUserDetails;

  SplashScreen({super.key, this.loggedInUserDetails});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  Future<void> checkForUser() async {
    String userId = await LocalStorage().fetchUserId();

    (userId == "") ? 
    (Get.toNamed(loginScreen)) :
    (Get.toNamed(holderScreen));
  }

  @override
  void initState() {
    super.initState();
    checkForUser();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: Get.height,
        width: Get.width,
        color: const Color(0xff181818),
        child: SafeArea(
          child: Image.asset("assets/images/Rythmic.png")),
      ),
    );
  }
}