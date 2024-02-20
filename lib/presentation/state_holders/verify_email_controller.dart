import 'package:crafty_bay/data/model/responce.dart';
import 'package:crafty_bay/data/service/network_coller.dart';
import 'package:crafty_bay/data/utils/utils.dart';
import 'package:get/get.dart';

class VerifyEmailController extends GetxController {
  bool _isSuccess = false;

  bool get isSuccess => _isSuccess;

  String _anError = '';

  String get anError => _anError;

  Future<bool> verifyEmailController(String email) async {
    _isSuccess = true;
    update();
    final ResponceData responce =
        await NetworkColler().getRequest(Utils.verifyEmail(email));
    _isSuccess = false;
    if (responce.isSuccess) {
      update();
      return true;
    } else {
      _anError = responce.isError;
      update();
      return false;
    }
  }
}
