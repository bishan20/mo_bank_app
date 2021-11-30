import 'dart:convert';

AccountResponseModel accountResponseModelFromJson(String str) =>
    AccountResponseModel.fromJson(json.decode(str));

String accountResponseModelToJson(AccountResponseModel data) =>
    json.encode(data.toJson());

class AccountResponseModel {
  AccountResponseModel({
    required this.id,
    required this.owner,
    required this.citizenship,
    required this.balance,
    required this.currency,
    required this.createdAt,
  });

  int id;
  String owner;
  String citizenship;
  int balance;
  String currency;
  DateTime createdAt;

  factory AccountResponseModel.fromJson(Map<String, dynamic> json) =>
      AccountResponseModel(
        id: json["id"],
        owner: json["owner"],
        citizenship: json["citizenship"],
        balance: json["balance"],
        currency: json["currency"],
        createdAt: DateTime.parse(json["createdAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "owner": owner,
        "citizenship": citizenship,
        "balance": balance,
        "currency": currency,
        "createdAt": createdAt.toIso8601String(),
      };
}
