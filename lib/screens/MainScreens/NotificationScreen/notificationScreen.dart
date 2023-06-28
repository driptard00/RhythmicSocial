import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rhythmic_social/screens/MainScreens/NotificationScreen/tab_views/messagesView.dart';
import 'package:rhythmic_social/screens/MainScreens/NotificationScreen/tab_views/notificationView.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: Container(
          height: Get.height,
          width: Get.width,
          color: const Color(0xff181818),
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SafeArea(
            child: Column(
              children: const [
                SizedBox(height: 20,),
                TabBar(
                  unselectedLabelColor: Colors.grey,
                  indicatorColor: Color(0xff181818),
                  labelColor: Color(0xffFF0054),
                  tabs: [
                    Tab(
                      text: "Notification",
                    ),
                    Tab(
                      text: "Messages",
                    ),
                  ]
                ),
                Expanded(
                  child: TabBarView(
                    children: [
                      // ========= Notification View ========
                      NotificationView(),

                      // ========= Messages View =========
                      MessagesView()
                    ],
                  )
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}