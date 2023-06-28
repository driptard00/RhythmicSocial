import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:rhythmic_social/controllers/authStateController.dart';
import 'package:rhythmic_social/routes/app_route_names.dart';

class EmailVerificationScreen extends StatelessWidget {
  EmailVerificationScreen({super.key});

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
                      flex: 24,
                      child: Container(
                        child: Center(
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                Image.asset("assets/images/Rythmic.png"),
                                const SizedBox(height: 10,),
                                const Text(
                                  "Email Verification",
                                  style: TextStyle(
                                    color: Color(0xffFF0054),
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold
                                  ),
                                ),
                                const SizedBox(height: 20,),
                                const Text(
                                  "We just sent a four digit otp to this email akintadeseun816@gmail",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 15,
                                  ),
                                ),
                                const SizedBox(height: 20,),
                                PinCodeTextField(
                                  textStyle: const TextStyle(color: Colors.white),
                                  appContext: context, 
                                  length: 4, 
                                  onChanged: (value){

                                  },
                                  pinTheme: PinTheme(
                                    shape: PinCodeFieldShape.box,
                                    borderRadius: BorderRadius.circular(10),
                                    activeColor: const Color(0xffFF0054),
                                    selectedColor: const Color(0xffFF0054),
                                    inactiveColor: const Color(0xffFF0054),
                                    fieldHeight: 60,
                                    fieldWidth: 50,
                                    fieldOuterPadding: const EdgeInsets.symmetric(horizontal: 10)
                                  ),
                                )
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
                                Get.toNamed(usernameScreen);
                              }),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xffFF0054),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30)
                                )
                              ),
                              child: const Text(
                                "Submit",
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