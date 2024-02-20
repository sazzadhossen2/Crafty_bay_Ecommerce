
import 'package:crafty_bay/data/model/creat_prodile_perems.dart';
import 'package:crafty_bay/data/model/profile.dart';
import 'package:crafty_bay/data/model/responce.dart';
import 'package:crafty_bay/data/service/network_coller.dart';
import 'package:crafty_bay/data/utils/utils.dart';
import 'package:crafty_bay/presentation/state_holders/auth_controller.dart';
import 'package:get/get.dart';

class CreatProfileController extends GetxController {
  bool _inPrgress = false;

  bool get inProgress => _inPrgress;
  String _anError = '';
  String get anError => _anError;

  ProfileData _profileData =ProfileData();
  ProfileData get profiledata=>_profileData;



  Future<bool> creatProfile(String token,CreatProfilePerams perams) async {
    _inPrgress=true;
    update();
    final ResponceData responce =
    await NetworkColler().postRequest(Utils.creatProfile, token: token,body:perams.toJson());
    _inPrgress=false;
    if(responce.isSuccess){
      final profile=responce.responceData['data'];
        _profileData=ProfileData.fromJson(profile);
      await  Get.find<Authcontroller>().SaveUserData(token, profiledata);

      update();
      return true;
    }else{
      _anError=responce.isError;
      update();
      return false;
    }
  }
}