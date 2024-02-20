import 'package:crafty_bay/data/model/productListModel.dart';
import 'package:crafty_bay/data/model/responce.dart';
import 'package:crafty_bay/data/service/network_coller.dart';
import 'package:crafty_bay/data/utils/utils.dart';
import 'package:get/get.dart';

class NewProductListController extends GetxController{
  bool _inProgress=false;
  bool get inProgress=>_inProgress;

  String _anError='';
  String get anError=>_anError;

  ProductListModel _productListModel =ProductListModel();
  ProductListModel get productListModel=>_productListModel;

  Future<bool>newProduct()async{
    bool isSuccess=false;
    _inProgress=true;
    update();
    final ResponceData responce=await NetworkColler().getRequest(Utils.newProduct);
    _inProgress=false;
    if(responce.isSuccess){
      _productListModel=ProductListModel.fromJson(responce.responceData);
      isSuccess=true;
    }else{
      _anError=responce.isError;
      isSuccess=false;
    }
    update();
    return isSuccess;

  }
}