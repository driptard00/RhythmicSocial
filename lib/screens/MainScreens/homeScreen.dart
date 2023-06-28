import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:rhythmic_social/controllers/authStateController.dart';
import 'package:rhythmic_social/routes/app_route_names.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final AuthStateController _authStateController = Get.put(AuthStateController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthStateController>(
      builder: (controller) {
        return Scaffold(
          backgroundColor: const Color(0xff181818),
          body: (controller.isLoading) ? 
          (
           const Center(
              child: CircularProgressIndicator(
                color: Color(0xffFF0054),
              ),
            )
          ) : 
          (
          Container(
            height: Get.height,
            width: Get.width,
            color: const Color(0xff181818),
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Welcome,",
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 12
                              ),
                            ),
                            Text(
                              controller.user.username!,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.bold
                              ),
                            ),
                          ],
                        ),

                        Row(
                          children: [
                            IconButton(
                              onPressed: (() {
                                Get.toNamed(notificationScreen);
                              }), 
                              icon: const Icon(
                                Iconsax.notification,
                                color: Colors.white,
                                size: 25,
                              )
                            ),
                            IconButton(
                              onPressed: (() {
                                Get.toNamed(settingsScreen);
                              }), 
                              icon: const Icon(
                                Iconsax.setting_2,
                                color: Colors.white,
                                size: 25,
                              )
                            ),
                          ],
                        )
                      ],
                    ),
                    const SizedBox(height: 30,),
                    ListView.separated(
                      primary: false,
                      shrinkWrap: true,
                      itemBuilder: (context, index){
                        return Flexible(
                          fit: FlexFit.loose,
                          child: Container(
                            width: Get.width,
                            padding: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                color: const Color(0xffFF0054)
                              )
                            ),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      flex: 15,
                                      child: Row(
                                        children: [
                                          const CircleAvatar(
                                            radius: 30,
                                          ),
                                          const SizedBox(width: 10,),
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: const [
                                              Text(
                                                "Blaqrose",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold
                                                ),
                                              ),
                                              SizedBox(height: 10,),
                                              Text(
                                                "5 hours ago",
                                                style: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 12
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      flex: 5,
                                      child: Container(
                                        alignment: Alignment.centerRight,
                                        child: const Icon(
                                          Icons.more_vert,
                                          color: Colors.white,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                const SizedBox(height: 20,),
                                const Text(
                                  "My name is blaqrose i am 23 years old and i am into afrobeat and fucking your sister!!!",
                                  maxLines: 5,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12
                                  ),
                                ),
                                const SizedBox(height: 20,),
                                Row(
                                  children: const [
                                    Icon(
                                      Iconsax.heart,
                                      color: Color(0xffFF0054),
                                    ),
                                    SizedBox(width: 10,),
                                    Text(
                                      "400",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 12
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            )
                          )
                        );
                      }, 
                      separatorBuilder: (context, int){
                        return const SizedBox(
                          height: 20, 
                        );
                      }, 
                      itemCount: 5
                    )
                  ],
                ),
              ),
            ),
          )
          )
        );
      }
    );
  }
}