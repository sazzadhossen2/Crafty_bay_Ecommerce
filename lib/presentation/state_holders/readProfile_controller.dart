import 'package:crafty_bay/data/model/profile.dart';
import 'package:crafty_bay/data/model/responce.dart';
import 'package:crafty_bay/data/service/network_coller.dart';
import 'package:crafty_bay/data/utils/utils.dart';
import 'package:get/get.dart';

class ReadProfileController extends GetxController {
  bool _inPrgress = false;

  bool get inProgress => _inPrgress;
  String _anError = '';
  String get anError => _anError;

  ProfileData _profileData =ProfileData();
  ProfileData get profiledata=>_profileData;

  bool _isProfileCompleted=false;
  bool get isProfileCompleted=>_isProfileCompleted;
  Future<bool> readProfile(String token) async {
    _inPrgress=true;
    update();
    final ResponceData responce =
        await NetworkColler().getRequest(Utils.readProfile, token: token);
    _inPrgress=false;
    if(responce.isSuccess){
      final profile=responce.responceData['data'];
      if(profile==null){
        _isProfileCompleted=false;
      }else{
        _profileData=ProfileData.fromJson(profile);
        _isProfileCompleted=true;
      }
      update();
      return true;
    }else{
      _anError=responce.isError;
      update();
      return false;
    }
  }
}
