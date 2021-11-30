import 'dart:convert';

import 'package:bank_app/local_repo/service_preferences.dart';
import 'package:bank_app/models/account_response_model.dart';
import 'package:bank_app/services/constraints.dart';
import 'package:bank_app/services/repositories/remote_repository.dart';
import 'package:get/get.dart';

class DeciderController extends GetxController {
  void checkAccountExist() async {
    final url = BASE_URL + '/account/${ServicePref().getCitizenship()}';
    final header = {
      "Authorization": "bearer ${ServicePref().getToken()}",
    };
    final response = await RemoteRepository().getApi(
      url,
      header,
    );

    if (response.statusCode == 200) {
      final responseModel = accountResponseModelFromJson(response.body);
      ServicePref().setCurrency(responseModel.currency);
      ServicePref().setBalance(responseModel.balance);
      ServicePref().setAccountId(responseModel.id);
      ServicePref().setCitizenship(responseModel.citizenship);
      Get.toNamed('/dashboard');
    } else if (response.statusCode == 401) {
      final decoded = jsonDecode(response.body);
      final error = decoded["error"];
      if (error == "token has expired") {
        await ServicePref.clear();
        Get.toNamed("/login");
      }
    } else if (response.statusCode == 404) {
      Get.toNamed('/account');
    }
  }
}
