import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:heart_disease_prediction_system/controllers/login_controller.dart';
import 'package:lottie/lottie.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color.fromARGB(156, 54, 42, 103),
        child: Container(
            color: const Color.fromARGB(156, 54, 42, 103),
            child: Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundImage: Image.network("https://cdn.dribbble.com/users/4358240/screenshots/14825308/preview.gif")
                      .image,
                  radius: 100,
                ),
                SizedBox(
                  height: 35,
                ),
                Text(
                  controller.googleAccount.value?.displayName ?? "",
                  style: GoogleFonts.aclonica(
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                    color: Colors.amberAccent,
                  ),
                ),
                Text(
                  controller.googleAccount.value?.email ?? "",
                  style: GoogleFonts.aclonica(
                    fontSize: 15,
                    fontWeight: FontWeight.w300,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                ActionChip(
                    label: Text("Logout"),
                    avatar: Icon(Icons.logout),
                    onPressed: () {
                      controller.logout();
                    })
              ],
            ))),
      ),
    );
  }
}
