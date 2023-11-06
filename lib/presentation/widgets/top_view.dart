import 'package:flutter/material.dart';
import 'package:rotating_carousel/rotating_carousel.dart';

import '../../utils/app_color.dart';
import '../../utils/app_enum.dart';
import '../../utils/app_image.dart';
import '../../utils/app_size.dart';

class TopView extends StatelessWidget {
  final Size size;
  final ScreenLayout layout;
  const TopView({
    super.key,
    required this.size,
    required this.layout,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: AppSize.getSize(size.width, 550, layout),
      padding: EdgeInsets.symmetric(
        horizontal: AppSize.getSize(size.width, 25, layout),
      ),
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
      child: Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Hayaland",
                style: TextStyle(
                  fontSize: AppSize.getSize(size.width, 40, layout),
                  color: AppColor.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                "何にでも使えて、みんながうれしい。",
                style: TextStyle(
                  fontSize: AppSize.getSize(size.width, 18, layout),
                  color: AppColor.primary,
                ),
              ),
              Text(
                "さらに詳しく>購入>",
                style: TextStyle(
                  fontSize: AppSize.getSize(size.width, 18, layout),
                  color: AppColor.blue,
                ),
              ),
            ],
          ),
          SizedBox(
            width: AppSize.getSize(size.width, 20, layout),
          ),
          Expanded(
            child: RotatingCarousel(
              panels: [
                for (int i = 0; i < 5; i++)
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColor.white,
                      boxShadow: [
                        BoxShadow(
                          color: AppColor.primary.withOpacity(0.1),
                          blurRadius: 30,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Center(
                      child: Image.asset(
                        AppImage.apple,
                        width: AppSize.getSize(size.width, 80, layout),
                        fit: BoxFit.contain,
                        color: AppColor.primary.withOpacity(0.8),
                      ),
                    ),
                  ),
              ],
              height: AppSize.getSize(size.width, 200, layout),
              width: AppSize.getSize(size.width, 600, layout),
              minRatio: 0.4,
              overlapRatio: 0.1,
            ),
          ),
        ],
      ),
    );
  }
}
