import 'package:bank_app/local_repo/service_preferences.dart';
import 'package:bank_app/models/bank_to_psp_model.dart';
import 'package:bank_app/services/constraints.dart';
import 'package:bank_app/services/repositories/remote_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BankToPspController extends GetxController {
  final TextEditingController pspAccountId = TextEditingController();
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

  void transferToPsp(BuildContext context) async {
    final body = bankToPspModelToJson(
      BankToPspModel(
        accountId: ServicePref().getAccountId(),
        pspAccountId: int.parse(pspAccountId.text.trim().toString()),
        amount: int.parse(amount.text.trim().toString()),
        currency: 'NP',
        type: purpose.text.trim().toString(),
      ),
    );

    final url = BASE_URL + '/transfers/psp';
    final header = {
      "Authorization": "bearer ${ServicePref().getToken()}",
    };
    final response = await RemoteRepository().apiWithHeader(
      url,
      body,
      header,
    );

    final r = response;

    if (response.statusCode == 200) {
      _showDeletionDialog(
        context: context,
        statusIconString: '✔',
        title: 'Transfer Successful',
        body:
            '${ServicePref().getCurrency()}: ${amount.text} was transferred to Account No: ${pspAccountId.text}',
      );
    } else if (response.statusCode == 401) {
      _showDeletionDialog(
        context: context,
        statusIconString: '❌',
        title: 'Transfer Failed',
        body: "Receiver's PSP id doesn't exist",
      );
    } else if (response.statusCode == 400) {
      _showDeletionDialog(
        context: context,
        statusIconString: '😱',
        title: 'Transfer Failed',
        body: "Insufficient balance",
      );
    }
  }

  void _showDeletionDialog(
      {required BuildContext context,
      required String statusIconString,
      required String title,
      required String body}) {
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
                pspAccountId.text = '';
                amount.text = '';
                purpose.text = '';
                Get.back();
              },
            ),
          ],
        );
      },
    );
  }
}
