import 'package:bank_app/local_repo/service_preferences.dart';
import 'package:bank_app/models/account_request_model.dart';
import 'package:bank_app/models/account_response_model.dart';
import 'package:bank_app/services/constraints.dart';
import 'package:bank_app/services/repositories/remote_repository.dart';
import 'package:get/get.dart';

class AccountController extends GetxController {
  void createAccount() async {
    final body = accountRequestModelToJson(AccountRequestModel(
      citizenship: ServicePref().getCitizenship(),
      currency: 'NP',
    ));

    final url = BASE_URL + '/accounts';
    final header = {
      "Authorization": "bearer ${ServicePref().getToken()}",
    };
    final response = await RemoteRepository().apiWithHeader(
      url,
      body,
      header,
    );

    if (response.statusCode == 200) {
      Get.toNamed("/dashboard");
    }
    //statusCode  :401
    //{"error":"token has expired"}

//statusCode : 403
    //{"error":"pq: duplicate key value violates unique constraint \"accounts_citizenship_key\""}
    final responseModel = accountResponseModelFromJson(response.body);
    await ServicePref().setAccountId(responseModel.id);
    ServicePref().setCurrency(responseModel.currency);
    ServicePref().setBalance(responseModel.balance);

    ServicePref().setCitizenship(responseModel.citizenship);
  }
}
