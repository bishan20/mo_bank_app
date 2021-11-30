import 'dart:convert';
import 'package:another_flushbar/flushbar_helper.dart';
import 'package:bank_app/local_repo/service_preferences.dart';
import 'package:bank_app/models/credentials.dart';
import 'package:bank_app/models/sign_in_response_model.dart';
import 'package:bank_app/services/constraints.dart';
import 'package:bank_app/services/repositories/remote_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

enum SignInState {
  NoError,
  InvalidEmailAndPassword,
}

class SignInController extends GetxController {
  final TextEditingController username = TextEditingController();
  final TextEditingController password = TextEditingController();

  bool validateEmail() {
    return username.text.length > 2;
  }

  bool validatePassword() {
    return password.text.length > 8;
  }

  void signIn(BuildContext context) async {
    var body = credentialsToJson(
      Credentials(
        username: username.text,
        password: password.text,
      ),
    );

    final url = BASE_URL + '/users/login';

    var response = await RemoteRepository().postApi(url, body);

    if (response.statusCode == 200) {
      // final responseModel = loginResponseModelFromJson(response.body);
      final responseModel = signInResponseFromJson(response.body);
      String token = responseModel.accessToken;
      String citizenship = responseModel.user.citizenship;
      String fullName = responseModel.user.fullName;
      String username = responseModel.user.username;

      await ServicePref().setToken(token);
      await ServicePref().setCitizenship(citizenship);
      await ServicePref().setFullname(fullName);
      await ServicePref().setUsername(username);
      await ServicePref().setStatus(true);
      password.text = "";
      Get.toNamed("/decider");
    } else {
      final decoded = jsonDecode(response.body);
      String errorMessage = decoded["error"];
      // Key: 'loginUserRequest.Username' Error:Field validation for 'Username' failed on the 'required' tag
      //{"error":"sql: no rows in result set"}
      if (errorMessage ==
              'crypto/bcrypt: hashedPassword is not the hash of the given password' ||
          errorMessage == "sql: no rows in result set") {
        FlushbarHelper.createError(
          message: 'Invalid username and password combination',
          duration: Duration(seconds: 2),
        ).show(context);
      } else {
        FlushbarHelper.createError(
          message: 'Server Error',
          duration: Duration(seconds: 2),
        ).show(context);
      }
    }
  }
}
