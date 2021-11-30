import 'dart:convert';

Credentials credentialsFromJson(String str) =>
    Credentials.fromJson(json.decode(str));

String credentialsToJson(Credentials data) => json.encode(data.toJson());

class Credentials {
  Credentials({
    required this.username,
    required this.password,
  });

  String username;
  String password;

  factory Credentials.fromJson(Map<String, dynamic> json) => Credentials(
        username: json["username"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "username": username,
        "password": password,
      };
}
