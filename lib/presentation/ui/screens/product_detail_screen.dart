import 'package:crafty_bay/data/model/ProductDetaulsModel.dart';
import 'package:crafty_bay/data/model/add_to_cart_params.dart';
import 'package:crafty_bay/presentation/state_holders/add_to_cart_controller.dart';
import 'package:crafty_bay/presentation/state_holders/auth_controller.dart';
import 'package:crafty_bay/presentation/ui/screens/Auth/verify_email_screen.dart';
import 'package:crafty_bay/presentation/ui/screens/review_screen.dart';
import 'package:crafty_bay/presentation/ui/widgets/product_details/product_image_carouse.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:item_count_number_button/item_count_number_button.dart';

import '../../state_holders/product_details_controller.dart';
import '../utility/app_colors.dart';
import '../widgets/product_details/color_selected.dart';
import '../widgets/product_details/size_selected.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key, required this.productId});

  final int productId;

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  ValueNotifier<int> noOfItem = ValueNotifier(1);

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Get.find<ProductDetailsController>().getProductDetails(widget.productId);
    });
  }

  Color? _selectedColor;
  String? _selectedSize;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Product Details',
          style: TextStyle(
            fontSize: 18,
          ),
        ),
        elevation: 3,
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: GetBuilder<ProductDetailsController>(
                init: ProductDetailsController(),
                builder: (productDetails) {
                  if (productDetails.isInprogress) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  return Column(
                    children: [
                      ProductImageCarousel(
                        producrdata: [
                          productDetails.productDetaulsModel.img1 ?? '',
                          productDetails.productDetaulsModel.img2 ?? '',
                          productDetails.productDetaulsModel.img3 ?? '',
                          productDetails.productDetaulsModel.img4 ?? '',
                        ],
                      ),
                      ProductDetailsBody(productDetails.productDetaulsModel)
                    ],
                  );
                },
              ),
            ),
          ),
          PriceAndAddCartSection(),
        ],
      ),
    );
  }

  Padding ProductDetailsBody(ProductData productData) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  productData.product!.title ?? '',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              ValueListenableBuilder(
                valueListenable: noOfItem,
                builder: (context, value, _) {
                  return ItemCount(
                    initialValue: value,
                    minValue: 1,
                    maxValue: 20,
                    decimalPlaces: 0,
                    color: AppColors.primaryColor,
                    onChanged: (v) {
                      noOfItem.value = v.toInt();
                    },
                  );
                },
              )
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          RatingAndReview(productData.product?.star ?? 0),
          const SizedBox(
            height: 16,
          ),
          const Text(
            'Color',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 16,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          ColorsSelected(
            color: productData.color
                ?.split(',')
                .map((e) => getColorFormString(e))
                .toList() ??
                [],
            onChangeColor: (selectedColors) {
              _selectedColor = selectedColors;
            },
          ),
          const SizedBox(
            height: 16,
          ),
          const Text(
            'Size',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 18,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          SizeSelected(
            sizes: productData.size?.split(',') ?? [],
            onChaneSize: (sizes) {
              _selectedSize = sizes;
            },
          ),
          const SizedBox(
            height: 16,
          ),
          const Text(
            'Description',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 16,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            productData.des ?? '',
            style: const TextStyle(fontSize: 14, color: Colors.grey),
          ),
        ],
      ),
    );
  }

  Row RatingAndReview(int rating) {
    return Row(
      children: [
        Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            const Icon(
              Icons.star,
              size: 18,
              color: Colors.amber,
            ),
            const SizedBox(
              width: 4,
            ),
            Text(
              rating.toString(),
              style: const TextStyle(fontSize: 16, color: Colors.black45),
            ),
          ],
        ),
        const SizedBox(
          width: 8,
        ),
        InkWell(
          onTap: () {
            Get.to(const ReviewScreen());
          },
          child: const Text(
            'Review',
            style: TextStyle(
              color: AppColors.primaryColor,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        const SizedBox(
          width: 8,
        ),
        Card(
          color: AppColors.primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
          child: const Padding(
            padding: EdgeInsets.all(4.0),
            child: Icon(
              Icons.favorite_border,
              size: 18,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }

  Widget PriceAndAddCartSection() {
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
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Price',
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.black45,
                      fontWeight: FontWeight.w600),
                ),
                Text(
                  '\$500',
                  style: TextStyle(
                      color: AppColors.primaryColor,
                      fontSize: 18,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
            SizedBox(
              width: 100,
              child: GetBuilder<AddToCartController>(builder: (addToCart) {
                return Visibility(
                  visible: addToCart.inProgress == false,
                  replacement: const Center(child: CircularProgressIndicator()),
                  child: ElevatedButton(
                    onPressed: () async {
                      if (_selectedSize != null && _selectedColor != null) {
                        if (Get
                            .find<Authcontroller>()
                            .isTokenNotNull) {
                          print(Authcontroller.token);
                          final strngColor = colorToString(_selectedColor!);
                          final result = await addToCart.getAddToCart(
                              widget.productId,
                              strngColor,
                              _selectedSize!,
                              noOfItem.value
                          );
                          print(result);
                          if (result) {
                            Get.showSnackbar(const GetSnackBar(
                              title: 'Add cart Success',
                              message: 'please try again',
                              isDismissible: true,
                              duration: Duration(seconds: 2),
                            ));
                          } else {
                            Get.showSnackbar(const GetSnackBar(
                              title: 'add cart faild',
                              message: 'please try again',
                              isDismissible: true,
                              duration: Duration(seconds: 2),
                            ));
                          }
                        } else {
                          Get.to(const Verifyemailscreen());
                        }
                      } else {
                        Get.showSnackbar(const GetSnackBar(
                          title: 'something wrong',
                          message: 'please try again',
                          isDismissible: true,
                          duration: Duration(seconds: 2),
                        ));
                      }
                    },
                    child: const Text("Add to Cart"),
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }

  Color getColorFormString(String color) {
    color = color.toLowerCase();
    if (color == 'red') {
      return Colors.red;
    } else if (color == 'white') {
      return Colors.white;
    } else if (color == 'green') {
      return Colors.green;
    }
    return Colors.grey;
  }

  String colorToString(Color color) {
    if (color == Colors.red) {
      return 'Read';
    } else if (color == Colors.white) {
      return 'White';
    } else if (color == Colors.green) {
      return 'Green';
    }
    return 'Grey';
  }
}
