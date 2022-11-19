import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:heart_disease_prediction_system/Screens/home_screen.dart';
import 'package:heart_disease_prediction_system/Screens/predictionPage.dart';
import 'package:heart_disease_prediction_system/controllers/login_controller.dart';

class HomePage extends StatefulWidget {
  final String userName;
  const HomePage({Key? key, required this.userName}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = Get.put(LoginController());
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
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
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    backgroundColor: Colors.deepPurple.shade400,
                                    content: Container(
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.amberAccent),
                                          color: Colors.deepPurple.shade400,
                                          borderRadius:
                                              BorderRadius.circular(30)),
                                      height: 200,
                                      width: 200,
                                      child: Container(
                                        color: Colors.amberAccent,
                                      ),
                                    ),
                                  );
                                });
                          },
                          child: Text(
                            "Our Sevices",
                            style: GoogleFonts.aclonica(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        SizedBox(width: screenSize.width / 20),
                        InkWell(
                          onTap: () {},
                          child: Text(
                            "History",
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
                      controller.logout();
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomeScreen()),
                      );
                    },
                    child: const Tooltip(
                        message: "Logout!",
                        child: Icon(
                          Icons.logout_rounded,
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
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 10,
                    width: 10,
                  ),
                  welcome_card(),
                  const SizedBox(
                    height: 30,
                    width: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const SizedBox(
                        width: 20,
                        height: 30,
                      ),
                      prediction_card(),
                      const SizedBox(
                        width: 250,
                        height: 30,
                      ),
                      Container(
                        width: 900,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            color: Colors.teal.shade50,
                            borderRadius: BorderRadius.circular(30)),
                        child: quotes_card(),
                      ),

                      //Card
                    ],
                  ),
                ],
              ),
            ),
          ),
        ));
  }

  CarouselSlider quotes_card() {
    return CarouselSlider(
      options: CarouselOptions(
        height: 590,
        autoPlayCurve: Curves.easeInOut,
        autoPlay: true,
        aspectRatio: 2.0,
        enlargeCenterPage: true,
      ),
      items: imageSliders,
    );
  }

  Row welcome_card() {
    return Row(
      children: [
        const SizedBox(
          height: 10,
          width: 10,
        ),
        Text(
          "Welcome, ",
          style: GoogleFonts.aclonica(
            fontSize: 15,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        Text(
          '${widget.userName}' + " 🎉",
          style: GoogleFonts.aBeeZee(
            fontSize: 25,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
      ],
    );
  }

  Card prediction_card() {
    return Card(
      elevation: 100,
      shadowColor: Colors.black,
      color: Colors.amber,
      child: SizedBox(
        width: 300,
        height: 450,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              const CircleAvatar(
                backgroundColor: Colors.black,
                radius: 108,
                child: CircleAvatar(
                  backgroundImage: NetworkImage(
                      "https://i.ibb.co/T0XkFXL/Heart-Health-Checkup.jpg"), //NetworkImage
                  radius: 100,
                ), //CircleAvatar
              ), //CircleAvatar
              const SizedBox(
                height: 20,
              ),
              Text(
                'Predict your results using Data',
                style: GoogleFonts.aclonica(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: Colors.deepPurple,
                ),
              ), //SizedBox
              //Text
              const SizedBox(
                height: 20,
              ),
              Text(
                'A medical industry standard Machine Learning Model for Heart Disease Prediction',
                style: GoogleFonts.aclonica(
                  fontSize: 10,
                  fontWeight: FontWeight.w200,
                  color: Colors.black,
                ),
              ), //SizedBox
              //Text
              const SizedBox(
                height: 30,
              ), //SizedBox
              SizedBox(
                width: 100,
                child: ElevatedButton(
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const PredictorPage()),
                  ),
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.blueGrey)),
                  child: Padding(
                    padding: const EdgeInsets.all(4),
                    child: Row(
                      children: const [Icon(Icons.touch_app), Text('Visit')],
                    ),
                  ),
                ),
              ) //SizedBox
            ],
          ), //Column
        ), //Padding
      ), //SizedBox
    );
  }
}

final List<String> imgList = [
  "https://i.postimg.cc/Pr6jf3Mv/1.jpg",
  "https://i.postimg.cc/fTRGP7hz/10.webp",
  "https://i.postimg.cc/NjyWsgMZ/11.png",
  "https://i.postimg.cc/hPZkRJS9/12.webp",
  "https://i.postimg.cc/Z51X01vn/13.webp",
  "https://i.postimg.cc/mrCJ987w/14.webp",
  "https://i.postimg.cc/RFm8LKRz/15.webp",
  "https://i.postimg.cc/HLMD2p1b/2.webp",
  "https://i.postimg.cc/rw32xD38/3.webp",
  "https://i.postimg.cc/9QrjDdx8/4.webp",
  "https://i.postimg.cc/vTQJbfgv/5.webp",
  "https://i.postimg.cc/yxvwdx0C/6.webp",
  "https://i.postimg.cc/Jn3ffPnn/7.webp",
  "https://i.postimg.cc/bYgXLCWV/8.webp"
      "https://i.postimg.cc/fLh4q6Mp/9.webp"
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
// <a href="https://imgbb.com/"><img src="https://i.ibb.co/825RWVh/1.jpg" alt="1" border="0"></a>
// <a href="https://imgbb.com/"><img src="https://i.ibb.co/Db8C5wf/2.jpg" alt="2" border="0"></a>
// <a href="https://ibb.co/zmdrnsw"><img src="https://i.ibb.co/sg72mjr/3.jpg" alt="3" border="0"></a>
// <a href="https://ibb.co/VgWn0cX"><img src="https://i.ibb.co/2v7V01X/4.jpg" alt="4" border="0"></a>
// <a href="https://ibb.co/t3S6cjS"><img src="https://i.ibb.co/3kwbW6w/5.jpg" alt="5" border="0"></a>
// <a href="https://ibb.co/qsq5B0M"><img src="https://i.ibb.co/0M4tqBj/6.jpg" alt="6" border="0"></a>
// <a href="https://ibb.co/LthWtB5"><img src="https://i.ibb.co/DCgyCmp/7.jpg" alt="7" border="0"></a>
// <a href="https://ibb.co/k9Cs7YF"><img src="https://i.ibb.co/vQn6F28/8.jpg" alt="8" border="0"></a>
// <a href="https://imgbb.com/"><img src="https://i.ibb.co/6b8HdZV/9.webp" alt="9" border="0"></a>
// <a href="https://imgbb.com/"><img src="https://i.ibb.co/9cHVG86/10.webp" alt="10" border="0"></a>
// <a href="https://imgbb.com/"><img src="https://i.ibb.co/rGqJTSn/11.jpg" alt="11" border="0"></a>