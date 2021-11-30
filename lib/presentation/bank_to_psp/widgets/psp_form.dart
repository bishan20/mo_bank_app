import 'package:bank_app/controllers/bank_to_psp/bank_to_psp_controller.dart';
import 'package:bank_app/local_repo/service_preferences.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PspForm extends StatefulWidget {
  const PspForm({Key? key}) : super(key: key);

  @override
  _PspFormState createState() => _PspFormState();
}

class _PspFormState extends State<PspForm> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final c = Get.find<BankToPspController>();
    return Form(
      key: _formKey,
      child: ListView(
        padding: const EdgeInsets.all(8),
        children: [
          const Text(
            'Transfer Money to PSP',
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
              controller: c.pspAccountId,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.person),
                labelText: "Receivers PSP ID",
              ),
              validator: (_) {
                if (c.pspAccountId.text.trim().length < 1) {
                  return "PSP ID can't be empty";
                } else if (int.parse(c.pspAccountId.text.trim()) < 0) {
                  return "PSP ID can't be negative";
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
                if (!c.validateAmount()) {
                  return "Invalid amount";
                }
                return null;
              }),
          const SizedBox(height: 10),
          TextFormField(
              controller: c.purpose,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.book),
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
                c.transferToPsp(context);
              }
            },
            child: Text('TRANSFER'),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
