
import 'package:crafty_bay/presentation/state_holders/product_list_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widgets/product_card_item.dart';
class ProductListScreen extends StatefulWidget {
 const  ProductListScreen({super.key,this.category,this.CategoryId});
 final String ?category;
 final int ? CategoryId;
  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
if(widget.CategoryId!=null){
  Get.find<ProductListControl>().productList(categoryId: widget.CategoryId!);
}
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text( widget.category ?? 'Product'),),
      body: Padding(
        padding:  const EdgeInsets.all(8.0),
        child: GetBuilder<ProductListControl>(
          builder: (productList) {
            return Visibility(
              visible: productList.inProgress==false,
              replacement: const Center(child: CircularProgressIndicator()),
              child: Visibility(
                visible: productList.productListModel.productList?.isNotEmpty??false,
                replacement: const Center(child: Text('Product Not Avilable',style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 20
                ),)),
                child: GridView.builder(
                    gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisSpacing: 8,
                      crossAxisSpacing: 4,
                      childAspectRatio: 0.90,
                    ),
                    itemCount: productList.productListModel.productList?.length??0,
                    itemBuilder: (context, index) {
                     return  FittedBox(child: ProductCardItem(productList:productList.productListModel.productList![index],));
                    }),
              ),
            );
          }
        ),
      ),
    );
  }
}
