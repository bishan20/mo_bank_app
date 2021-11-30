import 'dart:convert';

import 'package:another_flushbar/flushbar_helper.dart';
import 'package:bank_app/models/sign_up_request_model.dart';
import 'package:bank_app/models/sign_up_response_model.dart';
import 'package:bank_app/services/constraints.dart';
import 'package:bank_app/services/repositories/remote_repository.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  final TextEditingController username = TextEditingController();
  final TextEditingController fullname = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController citizenship = TextEditingController();
  final TextEditingController password = TextEditingController();

  bool validateEmail() {
    return RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email.text);
  }

  bool validateUsername() {
    return username.text.trim().length > 2;
  }

  bool validateFullname() {
    return fullname.text.trim().length > 2;
  }

  bool validatePassword() {
    return password.text.length > 8;
  }

  void signUp(context) async {
    // var body = credentialsToJson(
    //     Credentials(email: email.text, password: password.text));
    var body = signUpRequestModelToJson(
      SignUpRequestModel(
        fullname: fullname.text,
        username: username.text,
        email: email.text,
        citizenship: citizenship.text,
        password: password.text,
      ),
    );

    final url = BASE_URL + '/users';

    var response = await RemoteRepository().postApi(url, body);

    if (response.statusCode == 200) {
      final responseDecoded = signUpResponseModelFromJson(response.body);
      username.text = "";
      password.text = "";
      fullname.text = "";
      citizenship.text = "";
      email.text = "";
      Get.toNamed("/signin");
    } else {
      final decoded = jsonDecode(response.body);
      String errorMessage = decoded["error"];
//{"error":"pq: duplicate key value violates unique constraint \"users_pkey\""}

      FlushbarHelper.createError(
        message: errorMessage,
        duration: Duration(seconds: 2),
      ).show(context);
    }
  }
}
