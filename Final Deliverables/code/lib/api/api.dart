import 'dart:core';

import 'package:dio/dio.dart';

class bodyParameters {
  final int age;
  final int sex;
  final int cp;
  final int trestbps;
  final int chol;
  final int fbs;
  final int restecg;
  final int thalach;
  final int exang;
  final int oldpeak;
  final int slope;
  final int ca;
  final int thal;

  const bodyParameters._(
      this.age,
      this.sex,
      this.cp,
      this.trestbps,
      this.exang,
      this.oldpeak,
      this.ca,
      this.chol,
      this.fbs,
      this.restecg,
      this.slope,
      this.thal,
      this.thalach);

  factory bodyParameters.fromJson(Map json) {
    final age = json["age"].toInt();
    final sex = json["sex"].toInt();
    final cp = json["cp"].toInt();
    final trestbps = json["trestbps"].toInt();
    final chol = json["chol"].toInt();
    final fbs = json["fbs"].toInt();
    final restecg = json["restecg"].toInt();
    final thalach = json["thalach"].toInt();
    final exang = json["exang"].toInt();
    final oldpeak = json["oldpeak"].toInt();
    final slope = json["slope"].toInt();
    final ca = json["ca"].toInt();
    final thal = json["thal"].toInt();

    return bodyParameters._(age, sex, cp, trestbps, chol, fbs, restecg, thalach,
        exang, oldpeak, slope, ca, thal);
  }
}

class predictApi {
  static String apiUrl = 'http://127.0.0.1:8000';

  final _dio = Dio(BaseOptions(baseUrl: apiUrl));

  Future<Response> sendData(
      int age,
      int sex,
      int cp,
      int trestbps,
      int chol,
      int fbs,
      int restecg,
      int thalach,
      int exang,
      int oldpeak,
      int slope,
      int ca,
      int thal) async {
    final response = await _dio.post('/predict', data: {
      'age': age,
      'sex': sex,
      'cp': cp,
      'trestbps': trestbps,
      'chol': chol,
      'fbs': fbs,
      'restecg': restecg,
      'thalach': thalach,
      'exang': exang,
      'oldpeak': oldpeak,
      'slope': slope,
      'ca': ca,
      'thal': thal,
    });
    return response;
  }
}
