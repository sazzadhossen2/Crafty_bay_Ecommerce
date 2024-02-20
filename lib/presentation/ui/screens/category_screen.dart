import 'package:crafty_bay/presentation/state_holders/category_list_controller.dart';
import 'package:crafty_bay/presentation/state_holders/main_button_nav_controll.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widgets/category_item.dart';
class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});
  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}
class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (value){
        Get.find<MainButtonNavControll>().backtohome();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Category',
            style: TextStyle(
              fontSize: 18,
            ),
          ),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () {
              Get.find<MainButtonNavControll>().backtohome();
            },
          ),
          elevation: 3,
          backgroundColor: Colors.white,
        ),
        body: GetBuilder<CategoryListController>(
          builder: (category) {
            return Visibility(
              visible: category.inprogress==false,
              replacement: const Center(child: CircularProgressIndicator()),
              child: GridView.builder(
                  gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    mainAxisSpacing: 12,
                    crossAxisSpacing: 8,
                    childAspectRatio: 0.95,
                  ),
                  itemCount:category.cateGoryListModel.categoryList?.length??0,
                  itemBuilder: (context, index) {
                    return FittedBox(child: Category(category: category.cateGoryListModel.categoryList![index],));
                  }),
            );
          }
        ),
      ),
    );
  }
}
