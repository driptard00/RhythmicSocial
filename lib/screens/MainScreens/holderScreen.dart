import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:rhythmic_social/controllers/appStateController.dart';
import 'package:rhythmic_social/controllers/authStateController.dart';
import 'package:rhythmic_social/widget/uploadBottomSheet.dart';

class HolderScreen extends StatelessWidget {
  HolderScreen({super.key});

  final AppStateController _appStateController = Get.put(AppStateController());
  final AuthStateController _authStateController = Get.put(AuthStateController());

  @override
  Widget build(BuildContext context) {

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      print("HEY BEFORE CALL");
      _authStateController.getUserProfile();
      _authStateController.getAllUserProfile();
      print("HEY AFTER CALL");
    },);

    return GetBuilder<AppStateController>(
      builder: (controller) {
        return Scaffold(

          body: controller.screens[controller.selectedIndex],

          bottomNavigationBar: BottomAppBar(
            child: Container(
              height: 70,
              width: Get.width,
              color: const Color(0xff181818),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(
                    onPressed: (() {
                      controller.updateSelectedIndexItem(0);
                    }), 
                    child: Icon(
                      Iconsax.home,
                      color: (controller.selectedIndex == 0) ? 
                      (
                        const Color(0xffFF0054)
                      ) : 
                      (
                        Colors.grey
                      ),
                    )
                  ),
                  TextButton(
                    onPressed: (() {
                      controller.updateSelectedIndexItem(1);
                    }), 
                    child: Icon(
                      Iconsax.search_normal,
                      color: (controller.selectedIndex == 1) ? 
                      (
                        const Color(0xffFF0054)
                      ) : 
                      (
                        Colors.grey
                      ),
                    )
                  ),
                  TextButton(
                    onPressed: (() {
                      controller.updateSelectedIndexItem(2);
                    }), 
                    child: Icon(
                      Iconsax.profile_circle,
                      color: (controller.selectedIndex == 2) ? 
                      (
                        const Color(0xffFF0054)
                      ) : 
                      (
                        Colors.grey
                      ),
                    )
                  ),
                ],
              ),
            ),
          ),

          floatingActionButton: FloatingActionButton(
            onPressed: () {
              UploadBottomSheet.showUploadBottomSheet();
            },
            backgroundColor: const Color(0xffFF0054),
            child: const Icon(
              Iconsax.add,
              color: Colors.white,
            ),
          ),
        );
      }
    );
  }
}