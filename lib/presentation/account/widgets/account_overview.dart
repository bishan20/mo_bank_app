import 'package:bank_app/controllers/account/account_controller.dart';
import 'package:bank_app/presentation/account/widgets/account_detail.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AccountOverview extends StatelessWidget {
  const AccountOverview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            AccountDetail(),
            const SizedBox(height: 100),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: Color(0xffEE1B2C),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  )),
              onPressed: () {
                final c = Get.put(AccountController());
                c.createAccount();
              },
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text('CREATE ACCOUNT'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
