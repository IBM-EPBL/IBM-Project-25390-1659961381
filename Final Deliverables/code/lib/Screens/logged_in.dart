
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:heart_disease_prediction_system/Screens/homePage.dart';
import 'package:heart_disease_prediction_system/controllers/login_controller.dart';
import 'package:lottie/lottie.dart';

class LoggedIn extends StatefulWidget {
  const LoggedIn({Key? key}) : super(key: key);

  @override
  State<LoggedIn> createState() => _LoggedInState();
}

class _LoggedInState extends State<LoggedIn> {
  final controller = Get.put(LoginController());

  late String userName;

  @override
  void initState() {
    super.initState();
    build(context);
    Timer(
        const Duration(seconds: 1),
        () => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => HomePage(
                      userName: userName,
                    ))));
  }

  @override
  Widget build(BuildContext context) {
    userName = controller.googleAccount.value?.displayName.toString() ??
        "Default".toString();
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
                  backgroundImage: Image.network(
                          "https://cdn.dribbble.com/users/4358240/screenshots/14825308/preview.gif")
                      .image,
                  radius: 100,
                ),
                const SizedBox(
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
                const SizedBox(
                  height: 25,
                ),

                // ActionChip(
                //     label: Text("Logout"),
                //     avatar: Icon(Icons.logout),
                //     onPressed: () {
                //       controller.logout();
                //     })
              ],
            ))),
      ),
    );
  }
}
