// To parse this JSON data, do
//
//     final signInResponse = signInResponseFromJson(jsonString);

import 'dart:convert';

SignInResponse signInResponseFromJson(String str) =>
    SignInResponse.fromJson(json.decode(str));

String signInResponseToJson(SignInResponse data) => json.encode(data.toJson());

class SignInResponse {
  SignInResponse({
    required this.accessToken,
    required this.user,
  });

  String accessToken;
  User user;

  factory SignInResponse.fromJson(Map<String, dynamic> json) => SignInResponse(
        accessToken: json["access_token"],
        user: User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "access_token": accessToken,
        "user": user.toJson(),
      };
}

class User {
  User({
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

  factory User.fromJson(Map<String, dynamic> json) => User(
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
