// To parse this JSON data, do
//
//     final signUpResponseModel = signUpResponseModelFromJson(jsonString);

import 'dart:convert';

SignUpResponseModel signUpResponseModelFromJson(String str) =>
    SignUpResponseModel.fromJson(json.decode(str));

String signUpResponseModelToJson(SignUpResponseModel data) =>
    json.encode(data.toJson());

class SignUpResponseModel {
  SignUpResponseModel({
    required this.username,
    required this.fullName,
    required this.email,
    required this.citizenship,
    required this.passwordChangedAt,
    required this.createdAt,
  });

  String username;
  String fullName;
  String email;
  String citizenship;
  DateTime passwordChangedAt;
  DateTime createdAt;

  factory SignUpResponseModel.fromJson(Map<String, dynamic> json) =>
      SignUpResponseModel(
        username: json["username"],
        fullName: json["fullName"],
        email: json["email"],
        citizenship: json["citizenship"],
        passwordChangedAt: DateTime.parse(json["passwordChangedAt"]),
        createdAt: DateTime.parse(json["createdAt"]),
      );

  Map<String, dynamic> toJson() => {
        "username": username,
        "fullName": fullName,
        "email": email,
        "citizenship": citizenship,
        "passwordChangedAt": passwordChangedAt.toIso8601String(),
        "createdAt": createdAt.toIso8601String(),
      };
}
