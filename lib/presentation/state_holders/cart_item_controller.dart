import 'package:crafty_bay/data/model/CartListModel.dart';
import 'package:crafty_bay/data/model/responce.dart';
import 'package:crafty_bay/data/service/network_coller.dart';
import 'package:crafty_bay/data/utils/utils.dart';
import 'package:get/get.dart';

class CartItemController extends GetxController {
  bool _inProgress = false;

  bool get inProgress => _inProgress;
  String _anError = '';

  String get anError => _anError;

  CartListModel _cartListModel = CartListModel();

  CartListModel get cartListModel => _cartListModel;

  Future<bool> getCartList() async {
    bool isSuccess = false;
    _inProgress = true;
    update();

    final ResponceData responce =
        await NetworkColler().getRequest(Utils.cartItemList);
    _inProgress = false;
    if (responce.isSuccess) {
      _cartListModel = CartListModel.fromJson(responce.responceData);
      isSuccess = true;
    } else {
      _anError = responce.isError;
      isSuccess = false;
    }
    update();
    return isSuccess;
  }

  double get totalPrice {
    double total = 0;
    for (CartItemList item in _cartListModel.cartItems ?? []) {
      total += (double.tryParse(item.product?.price ?? '0') ?? 0) * item.quantity;
    }
    return total;
  }
}
