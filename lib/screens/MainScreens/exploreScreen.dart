import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:rhythmic_social/controllers/authStateController.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthStateController>(
      builder: (controller) {
        return Scaffold(
          body: Container(
            height: Get.height,
            width: Get.width,
            color: const Color(0xff181818),
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SafeArea(
              child: Column(
                children: [
                  const SizedBox(height: 20,),
                  const Text(
                    "Explore",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  const SizedBox(height: 30,),
                  Row(
                    children: [
                      Expanded(
                        flex: 8,
                        child: Container(
                          height: 60,
                          width: Get.width,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.grey
                            ),
                            borderRadius: BorderRadius.circular(10)
                          ),
                          child: SizedBox(
                            height: 30,
                            child: TextFormField(
                              decoration: const InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide.none
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide.none
                                ),
                                contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                                hintText: "Search for other artists, producers",
                                hintStyle: TextStyle(
                                  color: Colors.grey
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Container(
                          alignment: Alignment.centerRight,
                          child: SizedBox(
                            height: 60,
                            width: 60,
                            child: TextButton(
                              style: TextButton.styleFrom(                          
                                backgroundColor: const Color(0xffFF0054),                          
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)
                                )
                              ),
                              onPressed: () {
                              },
                              child: const Icon(
                                Iconsax.filter_edit,
                                color: Colors.white,
                                size: 25,
                              )
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20,),
                  (controller.isLoading) ? 
                  (
                    const Center(
                      child: CircularProgressIndicator(),
                    )
                  ) : 
                  (
                  Expanded(
                    child: Container(
                      color: Colors.blue,
                      child: ListView.separated(
                        itemBuilder: (context, index){
                          return Container(
                            height: 100,
                            width: Get.width,
                            color: Colors.red,
                          );
                        }, 
                        separatorBuilder: (context, index) {
                          return const SizedBox(
                            height: 20,
                          );
                        }, 
                        itemCount: controller.allUsers.length
                      ),
                    ),
                  )
                  )
                ],
              ),
            ),
          ),
        );
      }
    );
  }
}