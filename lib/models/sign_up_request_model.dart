// To parse this JSON data, do
//
//     final signUpRequestModel = signUpRequestModelFromJson(jsonString);

import 'dart:convert';

SignUpRequestModel signUpRequestModelFromJson(String str) =>
    SignUpRequestModel.fromJson(json.decode(str));

String signUpRequestModelToJson(SignUpRequestModel data) =>
    json.encode(data.toJson());

class SignUpRequestModel {
  SignUpRequestModel({
    required this.username,
    required this.password,
    required this.fullname,
    required this.email,
    required this.citizenship,
  });

  String username;
  String password;
  String fullname;
  String email;
  String citizenship;

  factory SignUpRequestModel.fromJson(Map<String, dynamic> json) =>
      SignUpRequestModel(
        username: json["username"],
        password: json["password"],
        fullname: json["fullname"],
        email: json["email"],
        citizenship: json["citizenship"],
      );

  Map<String, dynamic> toJson() => {
        "username": username,
        "password": password,
        "fullname": fullname,
        "email": email,
        "citizenship": citizenship,
      };
}
