import 'package:flutter/material.dart';

import 'package:bank_app/local_repo/service_preferences.dart';

class AccountDetail extends StatelessWidget {
  const AccountDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          AccountDetailEntity(
            name: 'Name:',
            value: '${ServicePref().getFullname()}',
          ),
          const SizedBox(height: 10),
          AccountDetailEntity(
            name: 'Citizenship No:',
            value: '${ServicePref().getCitizenship()}',
          ),
          const SizedBox(height: 10),
          AccountDetailEntity(
            name: 'Username:',
            value: '${ServicePref().getUsername()}',
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}

class AccountDetailEntity extends StatelessWidget {
  final String name;
  final String value;
  const AccountDetailEntity({
    Key? key,
    required this.name,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Text(
            name,
            style: TextStyle(
              fontSize: 19,
              color: Colors.grey[600],
            ),
          ),
        ),
        Expanded(
          child: Text(
            value,
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        ),
      ],
    );
  }
}
