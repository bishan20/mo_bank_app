import 'dart:convert';

import 'package:bank_app/local_repo/service_preferences.dart';
import 'package:bank_app/models/account_response_model.dart';
import 'package:bank_app/models/transfer_request_model.dart';
import 'package:bank_app/services/constraints.dart';
import 'package:bank_app/services/repositories/remote_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TransferController extends GetxController {
  final TextEditingController toAccountId = TextEditingController();
  final TextEditingController amount = TextEditingController();
  final TextEditingController purpose = TextEditingController();

  bool validateAmount() {
    String amountString = amount.text.trim().toString();
    int amountInt = int.tryParse(amountString) ?? 0;
    if (amountInt == 0 || amountInt < 0) {
      return false;
    } else {
      return true;
    }
  }

  void transferMoney(BuildContext context) async {
    final body = transferRequestModelToJson(
      TransferRequestModel(
        fromAccountId: ServicePref().getAccountId(),
        toAccountId: int.parse(toAccountId.text),
        amount: int.parse(amount.text.toString()),
        currency: 'NP',
        type: purpose.text.toString(),
      ),
    );
    final url = BASE_URL + '/transfers';
    final header = {"Authorization": "bearer ${ServicePref().getToken()}"};
    final response = await RemoteRepository().apiWithHeader(url, body, header);
    // statusCode = 404;
    // {"error":"sql: no rows in result set"}

    if (response.statusCode == 200) {
      _showDeletionDialog(
        context: context,
        statusIconString: '✔',
        title: 'Transfer Successful',
        body:
            '${ServicePref().getCurrency()}: ${amount.text} was transferred to Account No: ${toAccountId.text}',
      );
    } else if (response.statusCode == 400) {
      _showDeletionDialog(
        context: context,
        statusIconString: '😱',
        title: 'Transfer Failed',
        body: "Insufficient Balance",
      );
    } else if (response.statusCode == 404) {
      final body = jsonDecode(response.body);
      final errorMessage = body["error"];
      if (errorMessage == "sql: no rows in result set") {
        _showDeletionDialog(
          context: context,
          statusIconString: '❌',
          title: 'Transfer Failed',
          body: "Receiver's Account Number doesn't exist",
        );
      }
    }
  }

  void _showDeletionDialog({
    required BuildContext context,
    required String statusIconString,
    required String title,
    required String body,
  }) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Column(
            children: <Widget>[
              Text(
                statusIconString,
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.green,
                ),
              ),
              Text(title),
            ],
          ),
          content: Text(
            body,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Get.back();
                toAccountId.text = '';
                amount.text = '';
                purpose.text = '';
              },
            ),
          ],
        );
      },
    );
  }

  Future<AccountResponseModel> getAccountDetails() async {
    final url = BASE_URL + '/account/${ServicePref().getCitizenship()}';
    final header = {
      "Authorization": "bearer ${ServicePref().getToken()}",
    };
    final response = await RemoteRepository().getApi(
      url,
      header,
    );
    final responseModel = accountResponseModelFromJson(response.body);
    return responseModel;
  }

  getAccountDetailStream() async* {
    while (true) {
      yield await Future.delayed(Duration(seconds: 3), () {
        return getAccountDetails();
      });
    }
  }
}
