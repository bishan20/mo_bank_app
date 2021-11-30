import 'package:bank_app/controllers/sign_up/sign_up_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final c = Get.find<SignUpController>();
    return Form(
      key: _formKey,
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 80),
        children: <Widget>[
          Text(
            'Sign Up',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 30,
            ),
          ),
          const SizedBox(height: 8),
          TextFormField(
            controller: c.username,
            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.person),
              labelText: 'Username',
            ),
            autocorrect: false,
            validator: (_) {
              if (!c.validateUsername()) return "Username can't be empty";
            },
          ),
          const SizedBox(height: 8),
          CustomTextFormField(c: c),
          const SizedBox(height: 8),
          TextFormField(
            controller: c.fullname,
            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.person),
              labelText: 'Full Name',
            ),
            autocorrect: false,
            validator: (_) {
              if (!c.validateFullname()) return 'Invalid Full Name';
            },
          ),
          const SizedBox(height: 8),
          TextFormField(
            controller: c.citizenship,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.book),
              labelText: 'Citizenship No',
            ),
            autocorrect: false,
            validator: (_) {
              if (c.citizenship.text.trim() == '')
                return "Citizenship number can't be empty";
            },
          ),
          const SizedBox(height: 8),
          TextFormField(
            controller: c.password,
            obscureText: true,
            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.lock),
              labelText: 'Password',
            ),
            autocorrect: false,
            validator: (_) {
              if (!c.validatePassword())
                return "Password must be at least 8 characters";
            },
          ),
          const SizedBox(height: 8),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                padding: EdgeInsets.all(15),
                primary: Color(0xffEE1B2C),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                )),
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                c.signUp(context);
              }
            },
            child: const Text('SIGN UP'),
          ),
          const SizedBox(height: 8),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('Already registered?'),
                const SizedBox(width: 8),
                InkWell(
                  child: Text(
                    'Sign In',
                    style: TextStyle(
                      color: Color(0xffEE1B2C),
                    ),
                  ),
                  onTap: () {
                    Get.toNamed('/signin');
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    Key? key,
    required this.c,
  }) : super(key: key);

  final SignUpController c;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: c.email,
      keyboardType: TextInputType.emailAddress,
      decoration: const InputDecoration(
        prefixIcon: Icon(Icons.email),
        labelText: 'Email',
      ),
      autocorrect: false,
      validator: (_) {
        if (!c.validateEmail()) return "Invalid email";
      },
    );
  }
}
