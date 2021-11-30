import 'package:bank_app/local_repo/service_preferences.dart';
import 'package:bank_app/presentation/account/widgets/account_overview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Account'),
        leading: IconButton(
          icon: Icon(Icons.exit_to_app),
          onPressed: () {
            ServicePref().setStatus(false);
            Get.toNamed('/');
          },
        ),
      ),
      body: AccountOverview(),
    );
  }
}
