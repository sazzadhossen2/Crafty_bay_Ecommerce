import 'package:crafty_bay/data/model/BannerListModel.dart';
import 'package:crafty_bay/data/model/responce.dart';
import 'package:crafty_bay/data/service/network_coller.dart';
import 'package:crafty_bay/data/utils/utils.dart';
import 'package:get/get.dart';

class HomeBannerListController extends GetxController {
  bool _inProgress = false;

  bool get inProgress => _inProgress;

  String _anError = '';

  String get anerror => _anError;
  BannerListModel _bannerListModel = BannerListModel();

  BannerListModel get bannerListModel => _bannerListModel;

  Future<bool> getHomeBannerList() async {
    bool isSuccess = false;
    _inProgress = true;
    update();
    final ResponceData responce =
        await NetworkColler().getRequest(Utils.homeBannerList);
    _inProgress = false;
    if (responce.isSuccess) {
      _bannerListModel = BannerListModel.fromJson(responce.responceData);
      isSuccess = true;
    } else {
      _anError = responce.isError;
     // isSuccess = false;
    }
    update();
    return isSuccess;
  }
}
