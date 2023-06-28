import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:rhythmic_social/routes/app_route_names.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: Get.height,
        width: Get.width,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        color: const Color(0xff181818),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 20,),
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(width: 20,),
                    const Text(
                      "Settings",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30,),
                _row("Profile"),
                listTile("Edit Profile", Iconsax.profile_circle, Iconsax.arrow_right, "f"),
                _row("Profile"),
                listTile("Edit Profile", Iconsax.profile_circle, Iconsax.arrow_right, "f"),
                _row("Profile"),
                listTile("Edit Profile", Iconsax.profile_circle, Iconsax.arrow_right, "f"),
                _row("Profile"),
                listTile("Edit Profile", Iconsax.profile_circle, Iconsax.arrow_right, "f"),
              ],
            ),
          ),
        ),
      ),
    );
  }
  ListTile listTile(String text, IconData prefixIcon, IconData suffixIcon, dynamic onTap) {
    return ListTile(
      onTap: () {
        onTap;
      },
      leading: Icon(
        prefixIcon,
        color: const Color(0xffFF0054),
      ),
      title: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 15
        ),
      ),
      trailing: Icon(
        suffixIcon,
        color: const Color(0xffFF0054),
      ),
    );
  }

  Row _row(String text) {
    return Row(
      children: [
        const Expanded(
          flex: 1,
          child: Divider(
            color: Colors.grey,
          ),
        ),
        Expanded(
          flex: 1,
          child: Center(
            child: Text(
              text,
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 15
            ),
            ),
          )
        ),
        const Expanded(
          flex: 1,
          child: Divider(
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}