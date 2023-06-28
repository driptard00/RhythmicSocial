import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rhythmic_social/routes/app_route_names.dart';
import 'package:rhythmic_social/routes/app_routes.dart';

void main() {

  runApp(
    MyApp()
  );

}

class MyApp extends StatelessWidget {

  MyApp({super.key});
  @override
  Widget build(BuildContext context) { 
    return GetMaterialApp(
      title: 'Rhythmic Social',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "Roboto"
      ),
      initialRoute: splashScreen,
      getPages: getPages, 
    );
  }  
}
