import 'package:bank_app/controllers/bank_to_psp/bank_to_psp_binding.dart';
import 'package:bank_app/controllers/sign_in/sign_in_binding.dart';
import 'package:bank_app/controllers/sign_up/sign_up_binding.dart';
import 'package:bank_app/presentation/account/account_page.dart';
import 'package:bank_app/presentation/bank_to_psp/bank_to_psp_page.dart';
import 'package:bank_app/presentation/dashboard/dashboard.dart';
import 'package:bank_app/presentation/screen_decider/create_account_or_dashboard_page.dart';
import 'package:bank_app/presentation/sign_in/sign_in_page.dart';
import 'package:bank_app/presentation/sign_up/sign_up_page.dart';
import 'package:bank_app/presentation/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Centralized_Transaction',
      theme: ThemeData.light().copyWith(
        primaryColor: Color(0xffEE1B2C),
        accentColor: Colors.white,
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: Colors.black,
        ),
        inputDecorationTheme: InputDecorationTheme(
          focusColor: Color(0xffEE1B2C),
          labelStyle: TextStyle(
            color: Colors.grey,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(
              color: Color(0xffEE1B2C),
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
      getPages: [
        GetPage(
          name: '/signin',
          page: () => SignInPage(),
          binding: SignInBinding(),
        ),
        GetPage(
          name: '/',
          page: () => SplashScreen(),
        ),
        GetPage(
          name: '/account',
          page: () => AccountPage(),
          // binding: TransactionBinding(),
        ),
        GetPage(
          name: '/signup',
          page: () => SignUpPage(),
          binding: SignUpBinding(),
        ),
        GetPage(
          name: '/dashboard',
          page: () => Dashboard(),
          // binding: SignUpBinding(),
        ),
        GetPage(
          name: '/decider',
          page: () => AccountOrDashBoardPage(),
          // binding: SignUpBinding(),
        ),
        GetPage(
          name: '/banktopsp',
          page: () => BankToPspPage(),
          binding: BankToPspBinding(),
        ),
      ],
    );
  }
}
