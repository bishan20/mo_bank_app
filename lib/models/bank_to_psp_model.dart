// To parse this JSON data, do
//
//     final bankToPspModel = bankToPspModelFromJson(jsonString);

import 'dart:convert';

BankToPspModel bankToPspModelFromJson(String str) =>
    BankToPspModel.fromJson(json.decode(str));

String bankToPspModelToJson(BankToPspModel data) => json.encode(data.toJson());

class BankToPspModel {
  BankToPspModel({
    required this.accountId,
    required this.pspAccountId,
    required this.type,
    required this.amount,
    required this.currency,
  });

  int accountId;
  int pspAccountId;
  String type;
  int amount;
  String currency;

  factory BankToPspModel.fromJson(Map<String, dynamic> json) => BankToPspModel(
        accountId: json["accountID"],
        pspAccountId: json["pspAccountID"],
        type: json["type"],
        amount: json["amount"],
        currency: json["currency"],
      );

  Map<String, dynamic> toJson() => {
        "accountID": accountId,
        "pspAccountID": pspAccountId,
        "type": type,
        "amount": amount,
        "currency": currency,
      };
}
