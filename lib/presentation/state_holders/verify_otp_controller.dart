import 'package:crafty_bay/data/model/responce.dart';
import 'package:crafty_bay/data/service/network_coller.dart';
import 'package:crafty_bay/data/utils/utils.dart';
import 'package:crafty_bay/presentation/state_holders/auth_controller.dart';
import 'package:crafty_bay/presentation/state_holders/readProfile_controller.dart';
import 'package:get/get.dart';

class VerifyOtpController extends GetxController {
  bool _inProgress = false;
  bool get inProgress => _inProgress;

  String _anError = '';
  String get anError => _anError;

  String _token = '';
  String get token => _token;

bool _NavigationCompleteProfile = false;
bool get  NavigationCompleteProfile=>_NavigationCompleteProfile;

  Future<bool> verofyOtp(String email, String otp) async {
    _inProgress = true;
    update();
    final ResponceData response =
        await NetworkColler().getRequest(Utils.verifyOtp(email, otp));
    _inProgress = false;
    if (response.isSuccess) {
      _token = response.responceData['data'];
    final result=await Get.find<ReadProfileController>().readProfile(token);
    if(result){
     _NavigationCompleteProfile =Get.find<ReadProfileController>().isProfileCompleted==false;
    await Get.find<Authcontroller>().SaveUserData(token, Get.find<ReadProfileController>().profiledata);
    }else{
     Get.find<ReadProfileController>().anError;
    }
      update();
      return true;
    } else {
      _anError = response.isError;
      update();
      return false;
    }
  }
}
