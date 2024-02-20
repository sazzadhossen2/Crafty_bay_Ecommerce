import 'package:carousel_slider/carousel_slider.dart';

import 'package:flutter/material.dart';

import '../../../../data/model/BannerListModel.dart';
import '../../utility/app_colors.dart';

class BannarCarouselWidget extends StatelessWidget {
  BannarCarouselWidget({super.key, this.hight, required this.bannerlist});

  final double? hight;
  List<BannerItem> bannerlist;
  final ValueNotifier<int> _currentindex = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: hight ?? 180,
            onPageChanged: (index, reason) {
              _currentindex.value = index;
            },
            viewportFraction: 1,
            autoPlay: true,
          ),
          items: bannerlist.map((banner) {
            return Builder(
              builder: (BuildContext context) {
                return Stack(children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: AppColors.primaryColor,
                        image: DecorationImage(
                            image: NetworkImage(banner.image ?? ''),
                            fit: BoxFit.cover)),
                  ),
                  SizedBox(
                    width: 230,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Card(
                              child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              banner.title ?? '',
                              style: const TextStyle(

                                  fontWeight: FontWeight.w500),
                            ),
                          )),
                          Text(banner.shortDes ?? '',style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.black,fontSize: 12
                          ),),

                        ],
                      ),
                    ),
                  ),
                ]);
              },
            );
          }).toList(),
        ),
        const SizedBox(
          height: 6,
        ),
        ValueListenableBuilder(
          builder: (BuildContext context, value, Widget? child) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (int i = 0; i < bannerlist.length; i++)
                  Container(
                    height: 14,
                    width: 14,
                    margin: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                        color:
                            i == value ? AppColors.primaryColor : Colors.grey,
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(
                          color: i == value
                              ? AppColors.primaryColor
                              : Colors.white,
                        )),
                  ),
              ],
            );
          },
          valueListenable: _currentindex,
        ),
      ],
    );
  }
}
