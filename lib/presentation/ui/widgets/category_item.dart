import 'package:crafty_bay/presentation/ui/screens/product_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../data/model/cateGoryListModel.dart';
import '../utility/app_colors.dart';

class Category extends StatelessWidget {
  const Category({super.key, required this.category});

  final CategoryList category;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(ProductListScreen(
          category: category.categoryName ?? '',
          CategoryId: category.id,
        ));
      },
      child: Column(
        children: [
          Card(
              elevation: 0,
              color: AppColors.primaryColor.withOpacity(.1),
              child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: SizedBox(
                      height: 40,
                      width: 40,
                      child: Image(
                          image: NetworkImage(
                        category.categoryImg ?? '',
                      ))))),
          Text(
            category.categoryName ?? '',
            style: const TextStyle(
                color: AppColors.primaryColor,
                fontSize: 16,
                fontWeight: FontWeight.w500),
          )
        ],
      ),
    );
  }
}
