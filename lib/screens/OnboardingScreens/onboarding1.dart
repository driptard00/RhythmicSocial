import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardingScreenOne extends StatelessWidget {
  const OnboardingScreenOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: Get.height,
          width: Get.width,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                "assets/images/blaqrose1.JPG",
              ),
              fit: BoxFit.cover
            )
          ),
          child: Container(
            height: Get.height,
            width: Get.width,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.black.withOpacity(0.8),
                  Colors.black.withOpacity(0),
                ],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter
              )
            ),
            child: Column(
              children: [
                Expanded(
                  flex: 12,
                  child: Container(
                  ),
                ),
                Flexible(
                  flex: 8,
                  child: Container(
                    color: Colors.green,
                    child: Column(
                      children: [
                        
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}