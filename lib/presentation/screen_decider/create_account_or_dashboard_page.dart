import 'package:bank_app/controllers/decider/decider_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AccountOrDashBoardPage extends StatelessWidget {
  const AccountOrDashBoardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final c = Get.put(DeciderController());
    c.checkAccountExist();
    return Scaffold(
      body: Center(
          child: CircularProgressIndicator(
        backgroundColor: Color(0xffEE1B2C),
        color: Colors.white,
      )),
    );
  }
}
