import 'package:bank_app/presentation/bank_to_psp/widgets/psp_form.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BankToPspPage extends StatelessWidget {
  const BankToPspPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Transfer to PSP'),
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              Get.back();
              Get.toNamed('/dashboard');
            },
          )),
      body: PspForm(),
    );
  }
}
