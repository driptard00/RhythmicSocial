import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UploadBottomSheet{
  static showUploadBottomSheet() {
    Get.bottomSheet(
      Container(
        height: 200,
        width: Get.width,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        decoration: const BoxDecoration(
          color: Color(0xff181818),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          )
        ),
        child: Column(
          children: const [
            Text(
              "Upload",
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.bold
              ),
            ),
            SizedBox(height: 10,),
            ListTile(
              title: Text(
                "Feed",
                style: TextStyle(
                color: Colors.white,
                fontSize: 15,
              ),
              ),
            ),
            SizedBox(height: 10,),
            ListTile(
              title: Text(
                "Music",
                  style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}