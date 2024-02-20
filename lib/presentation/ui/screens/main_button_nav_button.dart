import 'package:crafty_bay/presentation/state_holders/homeBannerList.dart';
import 'package:crafty_bay/presentation/state_holders/main_button_nav_controll.dart';
import 'package:crafty_bay/presentation/state_holders/new_product_controller.dart';
import 'package:crafty_bay/presentation/state_holders/special_product_controller.dart';
import 'package:crafty_bay/presentation/ui/screens/carts_screen.dart';
import 'package:crafty_bay/presentation/ui/screens/wishlist_screen.dart';


import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../state_holders/category_list_controller.dart';
import '../../state_holders/popular_productList_controller.dart';
import '../utility/app_colors.dart';
import 'category_screen.dart';
import 'home_screen.dart';

class MainButtonNavButton extends StatefulWidget {
  const MainButtonNavButton({super.key});

  @override
  State<MainButtonNavButton> createState() => _MainButtonNavButtonState();
}

class _MainButtonNavButtonState extends State<MainButtonNavButton> {
final List<Widget>_screen=[
  const HomeScreen(),
  const CategoryScreen(),
  const CartsScreen(),
  const WishlistScreen()
];
@override
  void initState() {
    // TODO: implement initState
    super.initState();
   WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
     Get.find<HomeBannerListController>().getHomeBannerList();
     Get.find<CategoryListController>().getCatrgoryList();
     Get.find<ProductListController>().popularProduct();
     Get.find<SpecialProductListController>().specialProduct();
     Get.find<NewProductListController>().newProduct();
   });
  }
  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainButtonNavControll>(builder: (controller){
      return Scaffold(
        body: _screen[controller.currentindex],
        bottomNavigationBar: BottomNavigationBar(
          unselectedItemColor: Colors.grey,
          selectedItemColor: AppColors.primaryColor,
          showUnselectedLabels: true,
          currentIndex: controller.currentindex,
          onTap: controller.changeIndex,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.dashboard), label: 'Category'),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart), label: 'Cart'),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite), label: 'Wishlist'),
          ],
        ),
      );
    });
  }
}
