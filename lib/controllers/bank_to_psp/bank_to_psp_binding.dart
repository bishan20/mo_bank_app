import 'package:bank_app/controllers/bank_to_psp/bank_to_psp_controller.dart';
import 'package:get/get.dart';

class BankToPspBinding extends Bindings {
  void dependencies() {
    Get.put(BankToPspController());
  }
}
