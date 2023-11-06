import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../utils/app_color.dart';
import '../../utils/app_enum.dart';
import '../../utils/app_size.dart';

class FaqSlider extends StatefulWidget {
  final Size size;
  final ScreenLayout layout;
  const FaqSlider({
    super.key,
    required this.size,
    required this.layout,
  });

  @override
  State<FaqSlider> createState() => _FaqSliderState();
}

class _FaqSliderState extends State<FaqSlider> {
  final CarouselController sliderController = CarouselController();
  final ValueNotifier<int> sliderIndex = ValueNotifier<int>(0);
  final List<int> sliderList = [1, 2, 3, 4, 5, 6, 7, 8];

  @override
  void dispose() {
    sliderIndex.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            ValueListenableBuilder(
              valueListenable: sliderIndex,
              builder: (context, index, child) => Row(
                children: [
                  for (int i = 0; i < sliderList.length; i++)
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      width:
                          AppSize.getSize(widget.size.width, 12, widget.layout),
                      height:
                          AppSize.getSize(widget.size.width, 12, widget.layout),
                      margin: EdgeInsets.only(
                          right: AppSize.getSize(
                              widget.size.width, 15, widget.layout)),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        border: Border.all(color: AppColor.primary),
                        color: i == index ? AppColor.primary : null,
                      ),
                    ),
                ],
              ),
            ),
            Expanded(child: Container()),
            GestureDetector(
              onTap: () {
                sliderController.previousPage();
                sliderIndex.value = sliderIndex.value--;
              },
              child: Container(
                width: AppSize.getSize(widget.size.width, 36, widget.layout),
                height: AppSize.getSize(widget.size.width, 36, widget.layout),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: AppColor.white,
                  boxShadow: [
                    BoxShadow(
                      color: AppColor.primary.withOpacity(0.05),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Center(
                    child: Icon(
                  Icons.arrow_back_ios_rounded,
                  color: AppColor.primary,
                  size: AppSize.getSize(widget.size.width, 22, widget.layout),
                )),
              ),
            ),
            SizedBox(
              width: AppSize.getSize(widget.size.width, 15, widget.layout),
            ),
            GestureDetector(
              onTap: () {
                sliderController.nextPage();
                sliderIndex.value = sliderIndex.value++;
              },
              child: Container(
                width: AppSize.getSize(widget.size.width, 36, widget.layout),
                height: AppSize.getSize(widget.size.width, 36, widget.layout),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: AppColor.white,
                  boxShadow: [
                    BoxShadow(
                      color: AppColor.primary.withOpacity(0.05),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Center(
                    child: Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: AppColor.primary,
                  size: AppSize.getSize(widget.size.width, 22, widget.layout),
                )),
              ),
            ),
          ],
        ),
        const SizedBox(height: 30),
        SizedBox(
          width: double.infinity,
          height: AppSize.getSize(widget.size.width, 600, widget.layout),
          child: CarouselSlider(
            carouselController: sliderController,
            items: sliderList
                .map(
                  (url) => Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColor.white,
                      boxShadow: [
                        BoxShadow(
                          color: AppColor.primary.withOpacity(0.05),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "質問がありますか?",
                            style: TextStyle(
                              fontSize: AppSize.getSize(
                                widget.size.width,
                                25,
                                widget.layout,
                              ),
                              color: AppColor.primary,
                            ),
                          ),
                          Text(
                            "すべてのよくある質問を見る>",
                            style: TextStyle(
                              fontSize: AppSize.getSize(
                                widget.size.width,
                                25,
                                widget.layout,
                              ),
                              color: AppColor.blue,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
                .toList(),
            options: CarouselOptions(
              autoPlay: false,
              height: double.infinity,
              viewportFraction: 1.0,
              enlargeCenterPage: true,
              enlargeFactor: 0.1,
              onPageChanged: (index, reason) {
                sliderIndex.value = index;
              },
            ),
          ),
        ),
      ],
    );
  }
}
