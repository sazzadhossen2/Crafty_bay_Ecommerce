import 'package:crafty_bay/data/model/CartListModel.dart';
import 'package:flutter/material.dart';
import 'package:item_count_number_button/item_count_number_button.dart';

import '../../utility/app_colors.dart';

class CardProductItems extends StatefulWidget {
  const CardProductItems({
    super.key,
    required this.cartItemList,
  });

  final CartItemList cartItemList;

  @override
  State<CardProductItems> createState() => _CardProductItemsState();
}

class _CardProductItemsState extends State<CardProductItems> {
  ValueNotifier<int> noOfItem = ValueNotifier(1);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      child: Row(
        children: [
          Image.network(
            widget.cartItemList.product?.image ?? '',
            width: 100,
            fit: BoxFit.cover,
          ),
          const SizedBox(
            width: 8,
          ),
          Expanded(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.cartItemList.product?.title ?? '',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Row(
                          children: [
                            Text('Color: ${widget.cartItemList.color ?? ''}'),
                            SizedBox(
                              width: 8,
                            ),
                            Text('Size: ${widget.cartItemList.size ?? ''}'),
                          ],
                        ),
                      ],
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.delete_forever),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '\$${widget.cartItemList.price ?? ''}',
                      style: TextStyle(
                          color: AppColors.primaryColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
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
                        })
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
