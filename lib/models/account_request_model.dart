// To parse this JSON data, do
//
//     final accountRequestModel = accountRequestModelFromJson(jsonString);

import 'dart:convert';

AccountRequestModel accountRequestModelFromJson(String str) =>
    AccountRequestModel.fromJson(json.decode(str));

String accountRequestModelToJson(AccountRequestModel data) =>
    json.encode(data.toJson());

class AccountRequestModel {
  AccountRequestModel({
    required this.currency,
    required this.citizenship,
  });

  String currency;
  String citizenship;

  factory AccountRequestModel.fromJson(Map<String, dynamic> json) =>
      AccountRequestModel(
        currency: json["currency"],
        citizenship: json["citizenship"],
      );

  Map<String, dynamic> toJson() => {
        "currency": currency,
        "citizenship": citizenship,
      };
}
