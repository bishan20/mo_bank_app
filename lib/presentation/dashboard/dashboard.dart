import 'package:bank_app/controllers/transfer/transfer_controller.dart';
import 'package:bank_app/local_repo/service_preferences.dart';
import 'package:bank_app/presentation/dashboard/widgets/transfer_form.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final c = Get.put(TransferController());
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Dashboard'),
          leading: IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () async {
              await ServicePref().setStatus(false);
              Get.back();
              Get.toNamed('/');
            },
          ),
          actions: [
            Center(child: Text('Balance: ')),
            StreamBuilder(
                stream: c.getAccountDetailStream(),
                builder: (context, AsyncSnapshot<dynamic> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                        child: SizedBox(
                      child: CircularProgressIndicator(color: Colors.white),
                      width: 20,
                      height: 20,
                    ));
                  } else if (snapshot.connectionState ==
                      ConnectionState.active) {
                    return Center(
                      child: Text(
                        // ServicePref().getBalance().toString(),
                        snapshot.data.balance.toString(),
                        style: TextStyle(
                          fontSize: 22,
                        ),
                      ),
                    );
                  }
                  return Center(child: CircularProgressIndicator());
                }),
            SizedBox(width: 8),
          ],
        ),
        body: TransferForm(),
      ),
    );
  }
}
