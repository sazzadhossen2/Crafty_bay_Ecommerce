

import 'package:crafty_bay/data/model/responce.dart';
import 'package:crafty_bay/data/service/network_coller.dart';
import 'package:crafty_bay/data/utils/utils.dart';
import 'package:get/get.dart';

class AddToCartController extends GetxController {
  bool _inProgress = false;
  bool get inProgress => _inProgress;
  final String _anError = '';
  String get anError => _anError;
  Future<bool> getAddToCart(int productId, String color, String size,int qty) async {
    bool isSuccess = false;
    _inProgress = true;
    update();
    Map<String, dynamic> inPutParams = {
      "product_id":productId,
      "color": color,
      "size": size,
      "qty": qty
    };
    print(inPutParams);
    final ResponceData responce =await NetworkColler().postRequest(Utils.addToCart,body:inPutParams);
    _inProgress = false;
    if (responce.isSuccess) {

      isSuccess = true;
    } else {
      isSuccess = false;
    }
    update();
    return isSuccess;
  }
}
