// To parse this JSON data, do
//
//     final transferRequestModel = transferRequestModelFromJson(jsonString);

import 'dart:convert';

TransferRequestModel transferRequestModelFromJson(String str) =>
    TransferRequestModel.fromJson(json.decode(str));

String transferRequestModelToJson(TransferRequestModel data) =>
    json.encode(data.toJson());

class TransferRequestModel {
  TransferRequestModel({
    required this.fromAccountId,
    required this.toAccountId,
    required this.amount,
    required this.currency,
    required this.type,
  });

  int fromAccountId;
  int toAccountId;
  int amount;
  String currency;
  String type;

  factory TransferRequestModel.fromJson(Map<String, dynamic> json) =>
      TransferRequestModel(
        fromAccountId: json["from_account_id"],
        toAccountId: json["to_account_id"],
        amount: json["amount"],
        currency: json["currency"],
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "from_account_id": fromAccountId,
        "to_account_id": toAccountId,
        "amount": amount,
        "currency": currency,
        "type": type,
      };
}
