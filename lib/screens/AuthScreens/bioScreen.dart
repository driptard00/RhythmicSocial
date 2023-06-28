import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rhythmic_social/controllers/authStateController.dart';
import 'package:rhythmic_social/routes/app_route_names.dart';

class BioScreen extends StatelessWidget {
  BioScreen({super.key});

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
                                  "Create Bio",
                                  style: TextStyle(
                                    color: Color(0xffFF0054),
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold
                                  ),
                                ),
                                const SizedBox(height: 20,),
                                const Text(
                                  "Tell Us a little bit about yourself",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 15,
                                  ),
                                ),
                                const SizedBox(height: 20,),
                                TextFormField(
                                  textAlignVertical: TextAlignVertical.top,
                                  style: const TextStyle(
                                    color: Colors.white
                                  ),
                                  maxLength: 100,
                                  maxLines: 5,
                                  decoration: const InputDecoration(
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.grey
                                      )
                                    ),
                                    contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 20), 
                                    floatingLabelBehavior: FloatingLabelBehavior.never
                                  ),
                                  onChanged: ((value) {
                                    controller.updateBio(value);
                                  }
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
                                (_formKey.currentState!.validate())?
                                (
                                  controller.setProfile()
                                ):
                                (
                                  AutovalidateMode.disabled
                                );
                              }),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xffFF0054),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30)
                                )
                              ),
                              child: (controller.isLoading)? 
                              (
                                const CircularProgressIndicator(
                                  color: Colors.white,
                                )
                              ): 
                              (
                                const Text(
                                  "Continue",
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white
                                  ),
                                )
                              )
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