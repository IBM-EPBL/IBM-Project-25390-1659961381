import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:heart_disease_prediction_system/api/api.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class PredictorPage extends StatefulWidget {
  const PredictorPage({Key? key}) : super(key: key);

  @override
  State<PredictorPage> createState() => _PredictorPageState();
}

class _PredictorPageState extends State<PredictorPage>
    with SingleTickerProviderStateMixin {
  bool loading = false;
  Timer? _timer;
  late double _progress;

  @override
  void initState() {
    super.initState();
    EasyLoading.addStatusCallback((status) {
      if (status == EasyLoadingStatus.dismiss) {
        _timer?.cancel();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: const Color.fromARGB(156, 54, 42, 103),
        child: Container(
          height: double.infinity,
          width: double.infinity,
          color: const Color.fromARGB(156, 54, 42, 103),
          child: Stack(
            children: [
              Positioned(
                top: 20,
                left: 40,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                      width: 30,
                    ),
                    Text(
                      "Heart Disease Prediction System !",
                      style: GoogleFonts.aclonica(
                        fontSize: 35,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Lottie.network(
                        "https://assets6.lottiefiles.com/packages/lf20_nw19osms.json",
                        height: 500,
                        width: 500),
                    const SizedBox(
                      height: 20,
                    ),
                    predictbutton(),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "*Note: Please verify the hint and enter deatils. Mostly Integer type Supported",
                      style: GoogleFonts.adventPro(
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              dataset_details(context),
            ],
          ),
        ),
      ),
    );
  }

  FloatingActionButton predictbutton() {
    return FloatingActionButton.extended(
      onPressed: () async {
        predictApi api = predictApi();
        if (_age.text.toString().isNotEmpty &&
            _sex.text.toString().isNotEmpty &&
            _cp.text.toString().isNotEmpty &&
            _trestbps.text.toString().isNotEmpty &&
            _chol.text.toString().isNotEmpty &&
            _fbs.text.toString().isNotEmpty &&
            _restecg.text.toString().isNotEmpty &&
            _thalach.text.toString().isNotEmpty &&
            _exang.text.toString().isNotEmpty &&
            _oldpeak.text.toString().isNotEmpty &&
            _slope.text.toString().isNotEmpty &&
            _ca.text.toString().isNotEmpty &&
            _thal.text.toString().isNotEmpty) {
          if ((_age.text.toString().contains('.') &&
                  _sex.text.toString().contains('.') &&
                  _cp.text.toString().contains('.') &&
                  _trestbps.text.toString().contains('.') &&
                  _chol.text.toString().contains('.') &&
                  _fbs.text.toString().contains('.') &&
                  _restecg.text.toString().contains('.') &&
                  _thalach.text.toString().contains('.') &&
                  _exang.text.toString().contains('.') &&
                  _oldpeak.text.toString().contains('.') &&
                  _slope.text.toString().contains('.') &&
                  _ca.text.toString().contains('.') &&
                  _thal.text.toString().contains('.')) ==
              false) {
            _timer?.cancel();
            await EasyLoading.show(
              status: 'loading...',
              maskType: EasyLoadingMaskType.black,
            );
            Future.delayed(Duration(seconds: 5), () {
              EasyLoading.showError("Kindly Enter Only Integer values");
              EasyLoading.dismiss();
            });
            final result = await api.sendData(
                int.parse(_age.text.toString()).round(),
                int.parse(_sex.text.toString()).round(),
                int.parse(_cp.text.toString()).round(),
                int.parse(_trestbps.text.toString()).round(),
                int.parse(_chol.text.toString()).round(),
                int.parse(_fbs.text.toString()).round(),
                int.parse(_restecg.text.toString()).round(),
                int.parse(_thalach.text.toString()).round(),
                int.parse(_exang.text.toString()).round(),
                int.parse(_oldpeak.text.toString()).round(),
                int.parse(_slope.text.toString()).round(),
                int.parse(_ca.text.toString()).round(),
                int.parse(_thal.text.toString()).round());
            await EasyLoading.dismiss();
            if (result.toString() == "Disease") {
              EasyLoading.showToast(
                'You Have The Risk Of Heart Disease!😥',
              );
            } else {
              EasyLoading.showToast(
                'You Are Having A Healthy Body! 🎉',
              );
            }
          } else {
            EasyLoading.showError("Kindly Enter Only Integer values");
          }
        } else {
          // Fluttertoast.showToast(
          //     backgroundColor: Colors.deepOrangeAccent,
          //     textColor: Colors.black,
          //     fontSize: 20,
          //     msg: "Plese fill the values!",
          //     timeInSecForIosWeb: 2,
          //     toastLength: Toast.LENGTH_SHORT,
          //     gravity: ToastGravity.TOP_RIGHT);
          EasyLoading.showError("Plese fill the values!");
        }
      },
      icon: const Icon(
        Icons.online_prediction_rounded,
        color: Colors.deepOrangeAccent,
        size: 25,
      ),
      label: Text(
        "Predict",
        style: GoogleFonts.aclonica(
          fontSize: 20,
          fontWeight: FontWeight.w300,
          color: Colors.deepPurple,
        ),
      ),
      backgroundColor: Colors.white,
      foregroundColor: Colors.purple,
    );
  }
}
// Future showMsg(BuildContext context, String message) async {
// Fluttertoast.showToast(
//     msg: message,
//     toastLength:
//     Toast.LENGTH_SHORT,
//     gravity:
//     ToastGravity.BOTTOM,
//     timeInSecForIosWeb: 1,
//     backgroundColor:
//     Colors.orangeAccent,
//     textColor: Colors.black,
//     fontSize: 16.0);
// }

//  Future showErrorPop(BuildContext context,String message) async {
//   return ElegantNotification.error(
//     title: Text(
//       "OOPS"),
//     //   style: GoogleFonts.aclonica(
//     //     fontSize: 10,
//     //     fontWeight: FontWeight.w300,
//     //     color: Colors.deepPurple,
//     //   ),
//     // ),
//     description: Text(
//       "$message",
//       // style: GoogleFonts.aclonica(
//       //   fontSize: 10,
//       //   fontWeight: FontWeight.w300,
//       //   color: Colors.deepPurple,
//       // ),
//     ),

//   ).show(context);
// }

bool _validateDetails(BuildContext context) {
  return true;
}

Align dataset_details(BuildContext context) {
  return Align(
    alignment: Alignment.centerRight,
    child: Container(
      alignment: Alignment.centerRight,
      margin: const EdgeInsets.all(20),
      height: double.infinity,
      width: 500,
      decoration: BoxDecoration(
        color: Colors.deepOrangeAccent.shade200,
        borderRadius: BorderRadius.circular(30), //border corner radius
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5), //color of shadow
            spreadRadius: 5, //spread radius
            blurRadius: 7, // blur radius
            offset: const Offset(0, 2), // changes position of shadow
            //first paramerter of offset is left-right
            //second parameter is top to down
          ),
          //you can set more BoxShadow() here
        ],
      ),
      child: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                age(context, "Age", "Enter your age", isPassword: false),
                const SizedBox(
                  height: 10,
                ),
                const Divider(
                  color: Colors.black,
                  thickness: 5,
                ),
                sex(context, "Gender", "0-male & 1-female", isPassword: false),
                const SizedBox(
                  height: 10,
                ),
                const Divider(
                  color: Colors.black,
                  thickness: 5,
                ),
                cp(context, "Constrictive pericarditis", "Enter value 0-3",
                    isPassword: false),
                const SizedBox(
                  height: 10,
                ),
                const Divider(
                  color: Colors.black,
                  thickness: 5,
                ),
                trestbps(context, " Resting blood pressure",
                    "Enter values (eg:120-190)",
                    isPassword: false),
                const SizedBox(
                  height: 10,
                ),
                const Divider(
                  color: Colors.black,
                  thickness: 5,
                ),
                chol(context, "Cholestrol", "Enter value 125 to 200mg/dL",
                    isPassword: false),
                const SizedBox(
                  height: 10,
                ),
                const Divider(
                  color: Colors.black,
                  thickness: 5,
                ),
                fbs(context, "Fasting Blood Sugar", "Eg:140 mg/dL",
                    isPassword: false),
                const SizedBox(
                  height: 10,
                ),
                const Divider(
                  color: Colors.black,
                  thickness: 5,
                ),
                restecg(
                    context, "Resting electrocardiography", "60-100 beats/min",
                    isPassword: false),
                const SizedBox(
                  height: 10,
                ),
                const Divider(
                  color: Colors.black,
                  thickness: 5,
                ),
                thalach(context, "Maximum heart rate", "Eg:155 beats/min",
                    isPassword: false),
                const SizedBox(
                  height: 10,
                ),
                const Divider(
                  color: Colors.black,
                  thickness: 5,
                ),
                exang(context, "Exercise induced angina", "(1 = yes; 0 = no)",
                    isPassword: false),
                const SizedBox(
                  height: 10,
                ),
                const Divider(
                  color: Colors.black,
                  thickness: 5,
                ),
                oldpeak(context, "Asymptomatic chest pain",
                    "0-normal,1-fixed defect,2-reversable defect",
                    isPassword: false),
                const SizedBox(
                  height: 10,
                ),
                const Divider(
                  color: Colors.black,
                  thickness: 5,
                ),
                slope(context, "ST/heart rate slope", "Eg:Range (0-2)",
                    isPassword: false),
                const SizedBox(
                  height: 10,
                ),
                const Divider(
                  color: Colors.black,
                  thickness: 5,
                ),
                ca(context, "Coronary calcium", "Eg: 155", isPassword: false),
                const SizedBox(
                  height: 10,
                ),
                const Divider(
                  color: Colors.black,
                  thickness: 5,
                ),
                thal(context, "Thalassemia", "1 or 2 or 3", isPassword: false),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}

TextEditingController _age = new TextEditingController();
TextEditingController _sex = new TextEditingController();
TextEditingController _cp = new TextEditingController();
TextEditingController _trestbps = new TextEditingController();
TextEditingController _chol = new TextEditingController();
TextEditingController _fbs = new TextEditingController();
TextEditingController _restecg = new TextEditingController();
TextEditingController _thalach = new TextEditingController();
TextEditingController _exang = new TextEditingController();
TextEditingController _oldpeak = new TextEditingController();
TextEditingController _slope = new TextEditingController();
TextEditingController _ca = new TextEditingController();
TextEditingController _thal = new TextEditingController();

Widget thal(BuildContext context, String title, String hint,
    {bool isPassword = false}) {
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 10),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        DefaultTextStyle(
          child: Text(title),
          style: GoogleFonts.aclonica(
            fontSize: 15,
            fontWeight: FontWeight.w600,
            color: Colors.deepPurple,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        TextFormField(
          controller: _thal,
          obscureText: isPassword,
          decoration: InputDecoration(
              hintText: hint,
              hintStyle: Theme.of(context).textTheme.caption!.copyWith(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: Colors.black),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide: const BorderSide(
                  width: 1,
                  style: BorderStyle.solid,
                ),
              ),
              fillColor: Colors.purple.shade50,
              filled: true),
          keyboardType: TextInputType.number,

          // ],
        )
      ],
    ),
  );
}

Widget ca(BuildContext context, String title, String hint,
    {bool isPassword = false}) {
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 10),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        DefaultTextStyle(
          child: Text(title),
          style: GoogleFonts.aclonica(
            fontSize: 15,
            fontWeight: FontWeight.w600,
            color: Colors.deepPurple,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        TextFormField(
          controller: _ca,
          obscureText: isPassword,
          decoration: InputDecoration(
              hintText: hint,
              hintStyle: Theme.of(context).textTheme.caption!.copyWith(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: Colors.black),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide: const BorderSide(
                  width: 1,
                  style: BorderStyle.solid,
                ),
              ),
              fillColor: Colors.purple.shade50,
              filled: true),
          keyboardType: TextInputType.number,

          // ],
        )
      ],
    ),
  );
}

Widget slope(BuildContext context, String title, String hint,
    {bool isPassword = false}) {
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 10),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        DefaultTextStyle(
          child: Text(title),
          style: GoogleFonts.aclonica(
            fontSize: 15,
            fontWeight: FontWeight.w600,
            color: Colors.deepPurple,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        TextFormField(
          controller: _slope,
          obscureText: isPassword,
          decoration: InputDecoration(
              hintText: hint,
              hintStyle: Theme.of(context).textTheme.caption!.copyWith(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: Colors.black),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide: const BorderSide(
                  width: 1,
                  style: BorderStyle.solid,
                ),
              ),
              fillColor: Colors.purple.shade50,
              filled: true),
          keyboardType: TextInputType.number,

          // ],
        )
      ],
    ),
  );
}

Widget oldpeak(BuildContext context, String title, String hint,
    {bool isPassword = false}) {
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 10),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        DefaultTextStyle(
          child: Text(title),
          style: GoogleFonts.aclonica(
            fontSize: 15,
            fontWeight: FontWeight.w600,
            color: Colors.deepPurple,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        TextFormField(
          controller: _oldpeak,
          obscureText: isPassword,
          decoration: InputDecoration(
              hintText: hint,
              hintStyle: Theme.of(context).textTheme.caption!.copyWith(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: Colors.black),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide: const BorderSide(
                  width: 1,
                  style: BorderStyle.solid,
                ),
              ),
              fillColor: Colors.purple.shade50,
              filled: true),
          keyboardType: TextInputType.number,

          // ],
        )
      ],
    ),
  );
}

Widget exang(BuildContext context, String title, String hint,
    {bool isPassword = false}) {
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 10),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        DefaultTextStyle(
          child: Text(title),
          style: GoogleFonts.aclonica(
            fontSize: 15,
            fontWeight: FontWeight.w600,
            color: Colors.deepPurple,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        TextFormField(
          controller: _exang,
          obscureText: isPassword,
          decoration: InputDecoration(
              hintText: hint,
              hintStyle: Theme.of(context).textTheme.caption!.copyWith(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: Colors.black),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide: const BorderSide(
                  width: 1,
                  style: BorderStyle.solid,
                ),
              ),
              fillColor: Colors.purple.shade50,
              filled: true),
          keyboardType: TextInputType.number,

          // ],
        )
      ],
    ),
  );
}

Widget thalach(BuildContext context, String title, String hint,
    {bool isPassword = false}) {
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 10),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        DefaultTextStyle(
          child: Text(title),
          style: GoogleFonts.aclonica(
            fontSize: 15,
            fontWeight: FontWeight.w600,
            color: Colors.deepPurple,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        TextFormField(
          controller: _thalach,
          obscureText: isPassword,
          decoration: InputDecoration(
              hintText: hint,
              hintStyle: Theme.of(context).textTheme.caption!.copyWith(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: Colors.black),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide: const BorderSide(
                  width: 1,
                  style: BorderStyle.solid,
                ),
              ),
              fillColor: Colors.purple.shade50,
              filled: true),
          keyboardType: TextInputType.number,

          // ],
        )
      ],
    ),
  );
}

Widget restecg(BuildContext context, String title, String hint,
    {bool isPassword = false}) {
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 10),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        DefaultTextStyle(
          child: Text(title),
          style: GoogleFonts.aclonica(
            fontSize: 15,
            fontWeight: FontWeight.w600,
            color: Colors.deepPurple,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        TextFormField(
          controller: _restecg,
          obscureText: isPassword,
          decoration: InputDecoration(
              hintText: hint,
              hintStyle: Theme.of(context).textTheme.caption!.copyWith(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: Colors.black),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide: const BorderSide(
                  width: 1,
                  style: BorderStyle.solid,
                ),
              ),
              fillColor: Colors.purple.shade50,
              filled: true),
          keyboardType: TextInputType.number,

          // ],
        )
      ],
    ),
  );
}

Widget fbs(BuildContext context, String title, String hint,
    {bool isPassword = false}) {
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 10),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        DefaultTextStyle(
          child: Text(title),
          style: GoogleFonts.aclonica(
            fontSize: 15,
            fontWeight: FontWeight.w600,
            color: Colors.deepPurple,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        TextFormField(
          controller: _fbs,
          obscureText: isPassword,
          decoration: InputDecoration(
              hintText: hint,
              hintStyle: Theme.of(context).textTheme.caption!.copyWith(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: Colors.black),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide: const BorderSide(
                  width: 1,
                  style: BorderStyle.solid,
                ),
              ),
              fillColor: Colors.purple.shade50,
              filled: true),
          keyboardType: TextInputType.number,

          // ],
        )
      ],
    ),
  );
}

Widget chol(BuildContext context, String title, String hint,
    {bool isPassword = false}) {
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 10),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        DefaultTextStyle(
          child: Text(title),
          style: GoogleFonts.aclonica(
            fontSize: 15,
            fontWeight: FontWeight.w600,
            color: Colors.deepPurple,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        TextFormField(
          controller: _chol,
          obscureText: isPassword,
          decoration: InputDecoration(
              hintText: hint,
              hintStyle: Theme.of(context).textTheme.caption!.copyWith(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: Colors.black),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide: const BorderSide(
                  width: 1,
                  style: BorderStyle.solid,
                ),
              ),
              fillColor: Colors.purple.shade50,
              filled: true),
          keyboardType: TextInputType.number,

          // ],
        )
      ],
    ),
  );
}

Widget trestbps(BuildContext context, String title, String hint,
    {bool isPassword = false}) {
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 10),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        DefaultTextStyle(
          child: Text(title),
          style: GoogleFonts.aclonica(
            fontSize: 15,
            fontWeight: FontWeight.w600,
            color: Colors.deepPurple,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        TextFormField(
          controller: _trestbps,
          obscureText: isPassword,
          decoration: InputDecoration(
              hintText: hint,
              hintStyle: Theme.of(context).textTheme.caption!.copyWith(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: Colors.black),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide: const BorderSide(
                  width: 1,
                  style: BorderStyle.solid,
                ),
              ),
              fillColor: Colors.purple.shade50,
              filled: true),
          keyboardType: TextInputType.number,

          // ],
        )
      ],
    ),
  );
}

Widget cp(BuildContext context, String title, String hint,
    {bool isPassword = false}) {
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 10),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        DefaultTextStyle(
          child: Text(title),
          style: GoogleFonts.aclonica(
            fontSize: 15,
            fontWeight: FontWeight.w600,
            color: Colors.deepPurple,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        TextFormField(
          controller: _cp,
          obscureText: isPassword,
          decoration: InputDecoration(
              hintText: hint,
              hintStyle: Theme.of(context).textTheme.caption!.copyWith(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: Colors.black),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide: const BorderSide(
                  width: 1,
                  style: BorderStyle.solid,
                ),
              ),
              fillColor: Colors.purple.shade50,
              filled: true),
          keyboardType: TextInputType.number,

          // ],
        )
      ],
    ),
  );
}

Widget sex(BuildContext context, String title, String hint,
    {bool isPassword = false}) {
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 10),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        DefaultTextStyle(
          child: Text(title),
          style: GoogleFonts.aclonica(
            fontSize: 15,
            fontWeight: FontWeight.w600,
            color: Colors.deepPurple,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        TextFormField(
          controller: _sex,
          obscureText: isPassword,
          decoration: InputDecoration(
              hintText: hint,
              hintStyle: Theme.of(context).textTheme.caption!.copyWith(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: Colors.black),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide: const BorderSide(
                  width: 1,
                  style: BorderStyle.solid,
                ),
              ),
              fillColor: Colors.purple.shade50,
              filled: true),
          keyboardType: TextInputType.number,

          // ],
        )
      ],
    ),
  );
}

Widget age(BuildContext context, String title, String hint,
    {bool isPassword = false}) {
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 10),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        DefaultTextStyle(
          child: Text(title),
          style: GoogleFonts.aclonica(
            fontSize: 15,
            fontWeight: FontWeight.w600,
            color: Colors.deepPurple,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        TextFormField(
          controller: _age,
          obscureText: isPassword,
          decoration: InputDecoration(
              hintText: hint,
              hintStyle: Theme.of(context).textTheme.caption!.copyWith(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: Colors.black),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide: const BorderSide(
                  width: 1,
                  style: BorderStyle.solid,
                ),
              ),
              fillColor: Colors.purple.shade50,
              filled: true),
          keyboardType: TextInputType.number,

          // ],
        )
      ],
    ),
  );
}
