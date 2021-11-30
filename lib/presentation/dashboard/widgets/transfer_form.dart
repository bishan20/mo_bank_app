import 'package:bank_app/controllers/transfer/transfer_controller.dart';
import 'package:bank_app/local_repo/service_preferences.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TransferForm extends StatefulWidget {
  const TransferForm({Key? key}) : super(key: key);

  @override
  _TransferFormState createState() => _TransferFormState();
}

class _TransferFormState extends State<TransferForm> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final c = Get.put(TransferController());
    return Form(
      key: _formKey,
      child: ListView(
        padding: const EdgeInsets.all(8),
        children: [
          const Text(
            'Transfer Money',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              const Text('Your Account ID: '),
              Text(
                ServicePref().getAccountId().toString(),
              )
            ],
          ),
          const SizedBox(height: 20),
          TextFormField(
              controller: c.toAccountId,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.person),
                labelText: "Receivers Account Number",
              ),
              validator: (_) {
                if (c.toAccountId.text.trim().length < 1) {
                  return "Account Number can't be empty";
                }
              }),
          const SizedBox(height: 10),
          TextFormField(
              controller: c.amount,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.money),
                labelText: "Amount in NP",
              ),
              validator: (_) {
                if (c.validateAmount() == false) {
                  return "Invalid amount";
                }
                return null;
              }),
          const SizedBox(height: 10),
          TextFormField(
              controller: c.purpose,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.book_outlined),
                labelText: "Purpose",
              ),
              validator: (_) {
                if (c.amount.text.trim() == '0') {
                  return "Purpose can't empty";
                } else {
                  return null;
                }
              }),
          const SizedBox(height: 30),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                padding: EdgeInsets.all(15),
                primary: Color(0xffEE1B2C),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                )),
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                c.transferMoney(context);
              }
            },
            child: Text('TRANSFER'),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Transfer to PSP?',
                style: TextStyle(
                  color: Colors.grey[600],
                ),
              ),
              SizedBox(width: 20),
              InkWell(
                onTap: () {
                  Get.back();
                  Get.toNamed('/banktopsp');
                },
                child: Text(
                  'Click Here',
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(0xffEE1B2C),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
