import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rhythmic_social/controllers/authStateController.dart';
import 'package:rhythmic_social/routes/app_route_names.dart';

class ProfilePictureScreen extends StatelessWidget {
  ProfilePictureScreen({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
   final AuthStateController _authStateController = Get.put(AuthStateController());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<AuthStateController>(
        builder: (controller) {
          return Container(
            height: Get.height,
            width: Get.width,
            padding: const EdgeInsets.all(20),
            color: const Color(0xff181818),
            child: SafeArea(
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    Expanded(
                      flex: 22,
                      child: Container(
                        child: Center(
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                Image.asset("assets/images/Rythmic.png"),
                                const SizedBox(height: 10,),
                                const Text(
                                  "Profile Picture",
                                  style: TextStyle(
                                    color: Color(0xffFF0054),
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold
                                  ),
                                ),
                                const SizedBox(height: 20,),
                                const Text(
                                  "This is what we will know you as, it can also be your stage name",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 15,
                                  ),
                                ),
                                const SizedBox(height: 20,),
                                Container(
                                  height: 200,
                                  width: 200,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                    image: DecorationImage(
                                      image: (controller.selectedImage != null) 
                                        ? FileImage(controller.selectedImage!)
                                        : const AssetImage("assets/images/profileavatar.png") as ImageProvider,
                                      fit: BoxFit.cover
                                    )
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Container(
                        child: Center(
                          child: (controller.selectedImage != null) ? 
                          (
                            SizedBox(
                              height: 60,
                              width: Get.width,
                              child: ElevatedButton(
                                onPressed: (() {
                                  Get.toNamed(userTypeScreen);
                                }),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xffFF0054),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30)
                                  )
                                ),
                                child: const Text(
                                  "Continue",
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white
                                  ),
                                ),
                              ),
                            )
                          ) : 
                          (
                            Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: SizedBox(
                                    height: 60,
                                    child: ElevatedButton(
                                      onPressed: (() {
                                        controller.getImage(ImageSource.camera);
                                      }),
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: const Color(0xffFF0054),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(30)
                                        )
                                      ),
                                      child: const Text(
                                        "Camera",
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 10,),
                                Expanded(
                                  flex: 1,
                                  child: SizedBox(
                                    height: 60,
                                    child: ElevatedButton(
                                      onPressed: (() {
                                        controller.getImage(ImageSource.gallery);
                                      }),
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: const Color(0xffFF0054),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(30)
                                        )
                                      ),
                                      child: const Text(
                                        "Gallery",
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            )
                          )
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }
      ),
    );
  }
}