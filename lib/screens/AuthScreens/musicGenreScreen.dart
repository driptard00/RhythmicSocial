import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:rhythmic_social/controllers/authStateController.dart';
import 'package:rhythmic_social/routes/app_route_names.dart';

class MusicGenreScreen extends StatelessWidget {
  MusicGenreScreen({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final AuthStateController _authStateController = Get.find<AuthStateController>();

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
                                  "Music Genre",
                                  style: TextStyle(
                                    color: Color(0xffFF0054),
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold
                                  ),
                                ),
                                const SizedBox(height: 20,),
                                const Text(
                                  "What music genre do u specialize in",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 15,
                                  ),
                                ),
                                const SizedBox(height: 20,),
                                Container(
                                  height: 60,
                                  width: Get.width,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    color: Colors.grey.withOpacity(0.2)
                                  ),
                                  child: DropdownButtonFormField(
                                    decoration: const InputDecoration(
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide.none
                                      ),
                                      contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                                      label: Text(
                                        "Select music genre",
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 15
                                        ),
                                      ),
                                      floatingLabelBehavior: FloatingLabelBehavior.never
                                    ),
                                    items: controller.genres.map((eachGenre) {
                                      return DropdownMenuItem(
                                        value: eachGenre,
                                        child: Text(
                                          eachGenre
                                        ),
                                      );
                                    }).toList(),
                                    onChanged: ((value) {
                                      controller.updateMusicGenre(value);
                                    }
                                    ),
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
                          child: SizedBox(
                            height: 60,
                            width: Get.width,
                            child: ElevatedButton(
                              onPressed: (() {
                                Get.toNamed(bioScreen);
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
                          ),
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