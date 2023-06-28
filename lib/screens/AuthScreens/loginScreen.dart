import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:rhythmic_social/controllers/authStateController.dart';
import 'package:rhythmic_social/routes/app_route_names.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

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
                      flex: 20,
                      child: Container(
                        child: Center(
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                Image.asset("assets/images/Rythmic.png"),
                                const SizedBox(height: 10,),
                                const Text(
                                  "Login to continue",
                                  style: TextStyle(
                                    color: Color(0xffFF0054),
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold
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
                                  child: TextFormField(
                                    style: const TextStyle(
                                      color: Colors.white
                                    ),
                                    keyboardType: TextInputType.emailAddress,
                                    decoration: const InputDecoration(
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide.none
                                      ),
                                      contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                                      label: Text(
                                        "Email",
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 15
                                        ),
                                      ),
                                      floatingLabelBehavior: FloatingLabelBehavior.never
                                    ),
                                    validator: ValidationBuilder().email().minLength(3).build(),
                                    onChanged: ((value) {
                                      controller.updateEmail(value);
                                    }
                                    )
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Container(
                                  height: 60,
                                  width: Get.width,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    color: Colors.grey.withOpacity(0.2)
                                  ),
                                  child: TextFormField(
                                    style: const TextStyle(
                                      color: Colors.white
                                    ),
                                    keyboardType: TextInputType.visiblePassword,
                                    decoration: InputDecoration(
                                      border: const OutlineInputBorder(
                                        borderSide: BorderSide.none
                                      ),
                                      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                                      label: const Text(
                                        "Password",
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 15
                                        ),
                                      ),
                                      suffixIcon: IconButton(
                                        onPressed: (() {
                                          controller.toggleHidePassword();
                                        }),
                                        icon: Icon(
                                          (controller.hidePassword)?
                                          (
                                            Iconsax.eye_slash
                                          ):
                                          (
                                            Iconsax.eye
                                          ),
                                          color: Colors.grey,
                                        ),
                                      ),
                                      floatingLabelBehavior: FloatingLabelBehavior.never
                                    ),
                                    onChanged: ((value) {
                                      controller.updatePassword(value);
                                    }
                                    ),
                                    obscureText: controller.hidePassword,
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    TextButton(
                                      onPressed: (() {
                                        
                                      }), 
                                      child: const Text(
                                        "Forgot password ?",
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Color(0xffFF0054),
                                          fontWeight: FontWeight.bold
                                        ),
                                      )
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Not a member ?",
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 13
                              ),
                            ),
                            TextButton(
                              onPressed: (() {
                                Get.toNamed(registerScreen);
                              }),
                              child: const Text(
                                "Register",
                                style: TextStyle(
                                  color: Color(0xffFF0054),
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold
                                ),
                              ),
                            ),
                          ],
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
                                (_formKey.currentState!.validate()) ?
                                (
                                controller.loginUser()
                                ) :
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
                              child: (controller.isLoading) ?
                                (
                                const CircularProgressIndicator(
                                  color: Colors.white,
                                )
                                ) :
                                (
                                const Text(
                                  "Login",
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