import 'package:crafty_bay/presentation/state_holders/add_to_cart_controller.dart';
import 'package:crafty_bay/presentation/state_holders/auth_controller.dart';
import 'package:crafty_bay/presentation/state_holders/cart_item_controller.dart';
import 'package:crafty_bay/presentation/state_holders/category_list_controller.dart';
import 'package:crafty_bay/presentation/state_holders/creatProfile_controller.dart';
import 'package:crafty_bay/presentation/state_holders/homeBannerList.dart';
import 'package:crafty_bay/presentation/state_holders/main_button_nav_controll.dart';
import 'package:crafty_bay/presentation/state_holders/new_product_controller.dart';
import 'package:crafty_bay/presentation/state_holders/popular_productList_controller.dart';
import 'package:crafty_bay/presentation/state_holders/product_details_controller.dart';
import 'package:crafty_bay/presentation/state_holders/product_list_controller.dart';
import 'package:crafty_bay/presentation/state_holders/readProfile_controller.dart';
import 'package:crafty_bay/presentation/state_holders/special_product_controller.dart';
import 'package:crafty_bay/presentation/state_holders/verify_email_controller.dart';
import 'package:crafty_bay/presentation/state_holders/verify_otp_controller.dart';
import 'package:get/get.dart';

class ControllerBinder extends Bindings {
  @override
  void dependencies() {
    Get.put(MainButtonNavControll());
    Get.put(VerifyEmailController());
    Get.put(ReadProfileController());
    Get.put(VerifyOtpController());
    Get.put(CreatProfileController());
    Get.put(Authcontroller());
    Get.put(HomeBannerListController());
    Get.put(CategoryListController());
    Get.put(ProductListController());
    Get.put(NewProductListController());
    Get.put(SpecialProductListController());
    Get.put(ProductListControl());
    Get.put(ProductDetailsController());
    Get.put(AddToCartController());
    Get.put(CartItemController());
  }
}
