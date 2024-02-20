import 'package:crafty_bay/presentation/state_holders/cart_item_controller.dart';
import 'package:crafty_bay/presentation/state_holders/main_button_nav_controll.dart';
import 'package:crafty_bay/presentation/ui/utility/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/cart/cart_product_screen.dart';

class CartsScreen extends StatefulWidget {
  const CartsScreen({super.key});

  @override
  State<CartsScreen> createState() => _CartsScreenState();
}

class _CartsScreenState extends State<CartsScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Get.find<CartItemController>().getCartList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (_) {
        Get.find<MainButtonNavControll>().backtohome();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Cart'),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () {
              Get.find<MainButtonNavControll>().backtohome();
            },
          ),
        ),
        body: GetBuilder<CartItemController>(builder: (cartList) {
          if (cartList.inProgress == true) {
            return const Center(child: CircularProgressIndicator());
          }
          return Column(
            children: [
              Expanded(
                  child: ListView.separated(
                      itemBuilder: (context, index) {
                        return CardProductItems(
                          cartItemList:
                              cartList.cartListModel.cartItems![index],
                        );
                      },
                      separatorBuilder: (_, __) {
                        return const SizedBox(
                          height: 8,
                        );
                      },
                      itemCount:
                          cartList.cartListModel.cartItems?.length ?? 0

                  )),
              totalPriceAndCheckSection(cartList.totalPrice)
              //totalPriceAndCheckSection();
            ],
          );
        }),
      ),
    );
  }

  Container totalPriceAndCheckSection(double totalPrice) {
    return Container(
      decoration: BoxDecoration(
          color: AppColors.primaryColor.withOpacity(0.15),
          borderRadius: const BorderRadius.only(
              topRight: Radius.circular(16), topLeft: Radius.circular(16))),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Total Price',
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.black45,
                      fontWeight: FontWeight.w600),
                ),
                Text(
                  '\$$totalPrice',
                  style: TextStyle(
                      color: AppColors.primaryColor,
                      fontSize: 18,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
            SizedBox(
                width: 100,
                child: ElevatedButton(
                    onPressed: () {}, child: const Text("Cheek Out")))
          ],
        ),
      ),
    );
  }
}
