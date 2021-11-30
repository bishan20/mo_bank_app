import 'package:bank_app/controllers/account/account_controller.dart';
import 'package:get/get.dart';

class AccountBinding extends Bindings {
  void dependencies() {
    Get.put(AccountController());
  }
}
