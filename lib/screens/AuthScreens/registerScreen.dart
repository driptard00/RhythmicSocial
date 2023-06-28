import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:rhythmic_social/controllers/authStateController.dart';
import 'package:rhythmic_social/routes/app_route_names.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final AuthStateController _authStateController = Get.find<AuthStateController>();
  final TextEditingController _dateController = TextEditingController();
  // String _dateOfBirth = "";

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
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              const Text(
                                "Register",
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Color(0xffFF0054),
                                  fontWeight: FontWeight.bold
                                ),
                              ),
                              const SizedBox(height: 20,),
                              // ========= FULLNAME ========
                              TextFormField(
                                  style: const TextStyle(
                                      color: Colors.white
                                  ),
                                decoration: const InputDecoration(
                                  border: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.grey
                                    )
                                  ),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.grey
                                    )
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.grey
                                    )
                                  ),
                                  contentPadding: EdgeInsets.all(0),
                                  label: Text(
                                    "Fullname",
                                    style: TextStyle(
                                      color: Colors.grey,
                                    ),
                                  ),
                                  floatingLabelBehavior: FloatingLabelBehavior.always
                                ),
                                validator: ValidationBuilder().minLength(3).build(),
                                onChanged: ((value) {
                                  controller.updateFullName(value);
                                }
                                )
                              ),
                              const SizedBox(height: 20,),
                              // ========= EMAIL ========
                              TextFormField(
                                  style: const TextStyle(
                                      color: Colors.white
                                  ),
                                decoration: const InputDecoration(
                                  border: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.grey
                                    )
                                  ),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.grey
                                    )
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.grey
                                    )
                                  ),
                                  contentPadding: EdgeInsets.all(0),
                                  label: Text(
                                    "Email",
                                    style: TextStyle(
                                      color: Colors.grey,
                                    ),
                                  ),
                                  floatingLabelBehavior: FloatingLabelBehavior.always
                                ),
                                  validator: ValidationBuilder().email().minLength(3).build(),
                                  onChanged: ((value) {
                                  controller.updateEmail(value);
                                }
                                )
                              ),  
                              const SizedBox(height: 20,),
                              // ========= PASSWORD ========
                              TextFormField(
                                style: const TextStyle(
                                    color: Colors.white
                                ),
                                keyboardType: TextInputType.visiblePassword,
                                decoration: InputDecoration(
                                  border: const UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.grey
                                    )
                                  ),
                                  enabledBorder: const UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.grey
                                    )
                                  ),
                                  focusedBorder: const UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.grey
                                    )
                                  ),
                                  contentPadding: const EdgeInsets.all(0),
                                  suffixIcon: IconButton(
                                      onPressed: (){
                                        controller.toggleHidePassword;
                                      },
                                      icon: Icon(
                                        (controller.hidePassword) ?
                                        (
                                            Iconsax.eye_slash
                                        ) :
                                        (
                                            Iconsax.eye
                                        ),
                                        color: Colors.grey,
                                      )
                                  ),
                                  label: const Text(
                                    "Password",
                                    style: TextStyle(
                                      color: Colors.grey,
                                    ),
                                  ),
                                  floatingLabelBehavior: FloatingLabelBehavior.always
                                ),
                                obscureText: controller.hidePassword,
                                  validator: ValidationBuilder().minLength(3).build(),
                                  onChanged: ((value) {
                                  controller.updatePassword(value);
                                }
                                )
                              ),   
                              const SizedBox(height: 20,),
                              TextFormField(
                                keyboardType: TextInputType.phone,
                                style: const TextStyle(
                                  color: Colors.white
                                ),
                                decoration: const InputDecoration(
                                  border: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.grey
                                    )
                                  ),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.grey
                                    )
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.grey
                                    )
                                  ),
                                  contentPadding: EdgeInsets.all(0),
                                  label: Text(
                                    "Phonenumber",
                                    style: TextStyle(
                                      color: Colors.grey,
                                    ),
                                  ),
                                  floatingLabelBehavior: FloatingLabelBehavior.always
                                ),
                                  validator: ValidationBuilder().minLength(3).build(),
                                  onChanged: ((value) {
                                  controller.updatePhoneNumber(value);
                                }
                                )
                              ),  
                              const SizedBox(height: 20,),
                              Row(
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: TextFormField(
                                      keyboardType: TextInputType.datetime,
                                      controller: controller.dateController,
                                      onTap: (() {
                                        FocusScope.of(context).requestFocus(FocusNode());
                                        controller.showDateTimePicker(context);
                                      }),
                                      style: const TextStyle(
                                        color: Colors.white
                                      ),
                                      decoration: const InputDecoration(
                                        border: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Colors.grey
                                          )
                                        ),
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Colors.grey
                                          )
                                        ),
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Colors.grey
                                          )
                                        ),
                                        contentPadding: EdgeInsets.all(0),
                                        label: Text(
                                          "dob",
                                          style: TextStyle(
                                            color: Colors.grey,
                                          ),
                                        ),
                                        floatingLabelBehavior: FloatingLabelBehavior.always
                                      ),
                                        validator: ValidationBuilder().minLength(3).build(),
                                        onChanged: ((value) {
                                        controller.updateDateOfBirth(value);
                                      }
                                      )
                                    ),   
                                  ),
                                  const SizedBox(width: 10,),
                                  Expanded(
                                    flex: 1,
                                    child: Container(
                                      child: DropdownButtonFormField<dynamic>(
                                        dropdownColor: const Color(0xff181818),
                                        style: const TextStyle(
                                          color: Colors.white
                                        ),
                                        decoration: const InputDecoration(
                                          border: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Colors.grey
                                            )
                                          ),
                                          enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Colors.grey
                                            )
                                          ),
                                          focusedBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Colors.grey
                                            )
                                          ),
                                         contentPadding: EdgeInsets.all(0),
                                          label: Text(
                                            "Gender",
                                            style: TextStyle(
                                              color: Colors.grey,
                                            ),
                                          ),
                                          floatingLabelBehavior: FloatingLabelBehavior.always
                                        ),
                                        validator: (value){
                                          if (value == null){
                                            return "This fields is required";
                                          }
                                        },
                                        items: controller.genders.map((eachGender) {
                                          return DropdownMenuItem(
                                            value: eachGender,
                                            child: Text(
                                              eachGender
                                            )
                                          );
                                        }).toList(),
                                        onChanged: ((value) {
                                          controller.updateGender(value);
                                        }
                                        )
                                      ),   
                                    )
                                  ),              
                                ],
                              )
                            ],
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
                              "Already a member ?",
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 13
                              ),
                            ),
                            TextButton(
                              onPressed: (() {
                                Get.toNamed(loginScreen);
                              }),
                              child: const Text(
                                "Login",
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
                                (controller.signUpUser()) : 
                                (AutovalidateMode.disabled);
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
                                "Register",
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