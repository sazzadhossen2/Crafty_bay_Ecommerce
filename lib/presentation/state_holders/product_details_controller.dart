import 'package:crafty_bay/data/model/ProductDetaulsModel.dart';
import 'package:crafty_bay/data/model/responce.dart';
import 'package:crafty_bay/data/service/network_coller.dart';
import 'package:crafty_bay/data/utils/utils.dart';
import 'package:get/get.dart';

class ProductDetailsController extends GetxController{
  bool _isInprogress=false;
  bool get isInprogress=>_isInprogress;
  String _anError='';
  String get anError=>_anError;
  ProductDetaulsModel _productDetaulsModel =ProductDetaulsModel();
  ProductData get  productDetaulsModel=>_productDetaulsModel.productData!.first;

  Future<bool>getProductDetails(int ProdutcId)async{
    bool isSuccess=false;
    _isInprogress=true;
    update();
    final ResponceData responce = await NetworkColler().getRequest(Utils.productDetails(ProdutcId));
    _isInprogress=false;
    if(responce.isSuccess){
      _productDetaulsModel=ProductDetaulsModel.fromJson(responce.responceData);
      isSuccess=true;
    }else{
      _anError=responce.isError;
      isSuccess=false;
    }
    update();
    return isSuccess;
  }
}