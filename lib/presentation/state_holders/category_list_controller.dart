import 'package:crafty_bay/data/model/cateGoryListModel.dart';
import 'package:crafty_bay/data/model/responce.dart';
import 'package:crafty_bay/data/service/network_coller.dart';
import 'package:crafty_bay/data/utils/utils.dart';
import 'package:get/get.dart';

class CategoryListController extends GetxController {
  bool _inProgress = false;

  bool get inprogress => _inProgress;

  String _anError = '';

  String get anError => _anError;

  CateGoryListModel _cateGoryListModel = CateGoryListModel();

  CateGoryListModel get cateGoryListModel => _cateGoryListModel;

  Future<bool> getCatrgoryList() async {
    bool isSuccess = false;
    _inProgress = true;
    update();
    final ResponceData responce =
        await NetworkColler().getRequest(Utils.categoryList);
    _inProgress=false;
    if(responce.isSuccess){
      _cateGoryListModel=CateGoryListModel.fromJson(responce.responceData);
      isSuccess=true;
    }else{
      _anError=responce.isError;

    }
    update();
    return isSuccess;
  }
}
