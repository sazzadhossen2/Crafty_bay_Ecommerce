import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../data/model/productListModel.dart';
import '../../data/model/responce.dart';
import '../../data/service/network_coller.dart';
import '../../data/utils/utils.dart';

class ProductListControl extends GetxController {
  bool _inProgress = false;

  bool get inProgress => _inProgress;

  String _anError = '';

  String get anError => _anError;

  ProductListModel _productListModel = ProductListModel();

  ProductListModel get productListModel => _productListModel;

  Future<bool> productList({required int categoryId}) async {
    bool isSuccess = false;
    _inProgress = true;
    update();
    final ResponceData responce =
        await NetworkColler().getRequest(Utils.Listproduct(categoryId));
    _inProgress = false;
    if (responce.isSuccess) {
      _productListModel = ProductListModel.fromJson(responce.responceData);
      isSuccess = true;
    } else {
      _anError = responce.isError;
      isSuccess = false;
    }
    update();
    return isSuccess;
  }
}
