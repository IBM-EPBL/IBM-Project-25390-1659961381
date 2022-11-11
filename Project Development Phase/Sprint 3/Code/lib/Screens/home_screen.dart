import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:heart_disease_prediction_system/Screens/logged_in.dart';
import 'package:heart_disease_prediction_system/controllers/login_controller.dart';

import 'package:carousel_slider/carousel_slider.dart';

final List<String> imgList = [
  'https://images.unsplash.com/photo-1624727828489-a1e03b79bba8?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2071&q=80',
  'https://images.unsplash.com/photo-1505751172876-fa1923c5c528?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
  'https://images.unsplash.com/photo-1513224502586-d1e602410265?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1331&q=80',
  'https://images.unsplash.com/photo-1542884748-2b87b36c6b90?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
  'https://images.unsplash.com/photo-1590105577767-e21a1067899f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1228&q=80'
];

final List<Widget> imageSliders = imgList
    .map((item) => Container(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(25.0)),
                child: Image.network(
                  item,
                  fit: BoxFit.cover,
                  width: 1200,
                )),
          ),
        ))
    .toList();

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final controller = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(screenSize.width, 1000),
        child: Container(
          color: Colors.deepPurple.shade400,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              children: [
                const Text('🫀', style: TextStyle(fontSize: 30)),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                  
                      InkWell(
                        onTap: () {},
                        child: Text(
                          "About us",
                          style: GoogleFonts.aclonica(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            backgroundColor: Colors.deepPurple.shade400,
                            content: Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.amberAccent),
                                  color: Colors.deepPurple.shade400,
                                  borderRadius: BorderRadius.circular(30)),
                              height: 450,
                              width: 450,
                              child: Obx(() {
                                if (controller.googleAccount.value == null)
                                  return buildLoginbutton();
                                else
                                  return LoggedIn();
                              }),
                            ),
                          );
                        });
                  },
                  child: const Tooltip(
                      message: "Login / Registration",
                      child: Icon(
                        Icons.login_rounded,
                        size: 25,
                        color: Colors.amberAccent,
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Container(
        color: const Color.fromARGB(156, 54, 42, 103),
        child: Container(
          color: const Color.fromARGB(156, 54, 42, 103),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "Heart Disease Prediction System",
                  style: GoogleFonts.aclonica(
                    fontSize: 35,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
                const Divider(
                  thickness: 6,
                  color: Colors.orangeAccent,
                ),
                CarouselSlider(
                  options: CarouselOptions(
                    height: 590,
                    autoPlayCurve: Curves.easeInOut,
                    autoPlay: true,
                    aspectRatio: 2.0,
                    enlargeCenterPage: true,
                  ),
                  items: imageSliders,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Center buildLoginbutton() {
    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
             Text(
                  "Login",
                  style: GoogleFonts.aclonica(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
            FloatingActionButton.extended(
      onPressed: () {
            controller.login();
            // GoogleSignIn().signIn();
      },
      icon: Icon(Icons.g_mobiledata),
      label: Text(
            "Sign in With Google",
            style: GoogleFonts.aclonica(
              fontSize: 10,
              fontWeight: FontWeight.w200,
              color: Colors.deepPurpleAccent,
            ),
      ),
      backgroundColor: Colors.white,
      foregroundColor: Colors.purple,
    ),
          ],
        ));
  }
}
