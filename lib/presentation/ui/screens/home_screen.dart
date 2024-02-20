import 'package:crafty_bay/presentation/state_holders/auth_controller.dart';
import 'package:crafty_bay/presentation/state_holders/category_list_controller.dart';
import 'package:crafty_bay/presentation/state_holders/homeBannerList.dart';
import 'package:crafty_bay/presentation/state_holders/main_button_nav_controll.dart';
import 'package:crafty_bay/presentation/state_holders/new_product_controller.dart';
import 'package:crafty_bay/presentation/state_holders/special_product_controller.dart';
import 'package:crafty_bay/presentation/ui/screens/Auth/verify_email_screen.dart';
import 'package:crafty_bay/presentation/ui/screens/product_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../state_holders/popular_productList_controller.dart';
import '../utility/assets_path.dart';
import '../widgets/category_item.dart';
import '../widgets/home/circle_icone.dart';
import '../widgets/home/image_carouse.dart';
import '../widgets/home/section_title_widget.dart';
import '../widgets/product_card_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              searchTextFild,
              const SizedBox(
                height: 16,
              ),
              SizedBox(
                  height: 210,
                  child: GetBuilder<HomeBannerListController>(
                      builder: (homebanner) {
                    return Visibility(
                        visible: homebanner.inProgress == false,
                        replacement: const Center(child: CircularProgressIndicator()),
                        child: BannarCarouselWidget(
                          bannerlist:
                              homebanner.bannerListModel.bannerlist ?? [],
                        ));
                  })),
              const SizedBox(
                height: 16,
              ),
              SectionWidget(
                title: 'All Categories',
                onTapSeeAll: () {
                  Get.find<MainButtonNavControll>().changeIndex(1);
                },
              ),
              categorylist,
              const SizedBox(
                height: 16,
              ),
              SectionWidget(
                title: 'Popular',
                onTapSeeAll: () {
                  Get.to(() => const ProductListScreen());
                },
              ),
              PopularProductList,
              const SizedBox(
                height: 8,
              ),
              SectionWidget(
                title: 'Special',
                onTapSeeAll: () {},
              ),
              SpecialProductList,
              const SizedBox(
                height: 8,
              ),
              SectionWidget(
                title: 'New',
                onTapSeeAll: () {},
              ),
              newProductList,
            ],
          ),
        ),
      ),
    );
  }

  SizedBox get categorylist {
    return SizedBox(
      height: 120,
      child: GetBuilder<CategoryListController>(builder: (category) {
        return Visibility(
          visible: category.inprogress == false,
          replacement: const Center(child: CircularProgressIndicator()),
          child: ListView.separated(
            itemCount: category.cateGoryListModel.categoryList?.length ?? 0,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Category(
                category: category.cateGoryListModel.categoryList![index],
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(
                width: 8,
              );
            },
          ),
        );
      }),
    );
  }

  SizedBox get PopularProductList {
    return SizedBox(
      height: 190,
      child: GetBuilder<ProductListController>(builder: (popularProduct) {
        return Visibility(
          visible: popularProduct.inProgress == false,
          replacement: const Center(child: CircularProgressIndicator()),
          child: ListView.separated(
            itemCount: popularProduct.productListModel.productList?.length ?? 0,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return ProductCardItem(
                productList:
                    popularProduct.productListModel.productList![index],
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(
                width: 8,
              );
            },
          ),
        );
      }),
    );
  }

  SizedBox get SpecialProductList {
    return SizedBox(
      height: 190,
      child:
          GetBuilder<SpecialProductListController>(builder: (specialProduct) {
        return Visibility(
          visible: specialProduct.inProgress == false,
          replacement: const Center(child: CircularProgressIndicator()),
          child: ListView.separated(
            itemCount: specialProduct.productListModel.productList?.length ?? 0,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return ProductCardItem(
                productList:
                    specialProduct.productListModel.productList![index],
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(
                width: 8,
              );
            },
          ),
        );
      }),
    );
  }

  SizedBox get newProductList {
    return SizedBox(
      height: 190,
      child: GetBuilder<NewProductListController>(builder: (newProduct) {
        return Visibility(
          visible: newProduct.inProgress==false,
          replacement: const Center(child: CircularProgressIndicator()),
          child: ListView.separated(
            itemCount: newProduct.productListModel.productList?.length ?? 0,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return ProductCardItem(
                productList: newProduct.productListModel.productList![index],
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(
                width: 8,
              );
            },
          ),
        );
      }),
    );
  }

  TextFormField get searchTextFild {
    return TextFormField(
      decoration: InputDecoration(
        hintText: 'Search',
        filled: true,
        fillColor: Colors.grey.shade200,
        prefixIcon: const Icon(
          Icons.search,
          color: Colors.grey,
        ),
        border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(15)),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(15)),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(15)),
      ),
    );
  }

  AppBar get appbar {
    return AppBar(
      title: Image.asset(AssetsPath.logonav),
      actions: [
        CircleButton(
          ontap: () async {
            await Authcontroller.ClearData();
            Get.offAll(() => const Verifyemailscreen());
          },
          iconData: Icons.person,
        ),
        const SizedBox(
          width: 8,
        ),
        CircleButton(
          ontap: () {},
          iconData: Icons.call,
        ),
        const SizedBox(
          width: 8,
        ),
        CircleButton(
          ontap: () {},
          iconData: Icons.notifications_active,
        ),
      ],
    );
  }
}
