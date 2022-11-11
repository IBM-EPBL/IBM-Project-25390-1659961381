import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:heart_disease_prediction_system/Screens/home_screen.dart';
import 'package:lottie/lottie.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 3),
        () => Navigator.push(context,
            MaterialPageRoute(builder: (context) => const HomeScreen())));
  }

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
          color: const Color.fromARGB(156, 54, 42, 103),
          child: Container(
            color: const Color.fromARGB(156, 54, 42, 103),
            child: Column(
              children: [
                const SizedBox(
                  height: 90,
                ),
                Text(
                  'HEART DISEASE PREDICTION',
                  style: GoogleFonts.aclonica(color: Colors.amber, fontSize: 45),
                ),
                const SizedBox(
                  height: 90,
                ),
                Center(
                    child: Lottie.network(
                  'https://assets1.lottiefiles.com/private_files/lf30_0icnhmjd.json',
                  height: 250,
                  width: 250,
                  repeat: true,
                  reverse: true,
                  animate: true,
                )),
              ],
            ),
          )),
    );
  }
}
