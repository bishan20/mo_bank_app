import 'package:bank_app/local_repo/service_preferences.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool status = false;
  @override
  void initState() {
    super.initState();
    status = ServicePref().getStatus();
    (status)
        ? Future.delayed(Duration(seconds: 2), () {
            Get.toNamed("/decider");
          })
        : Future.delayed(Duration(seconds: 2), () {
            Get.toNamed("/signin");
          });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        child: Center(
          child: LinearProgressIndicator(
              color: Colors.white, backgroundColor: Color(0xffEE1B2C)),
        ),
      ),
    );
  }
}
