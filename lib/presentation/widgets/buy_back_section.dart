import 'package:flutter/material.dart';

import '../../utils/app_color.dart';
import '../../utils/app_enum.dart';
import '../../utils/app_image.dart';
import '../../utils/app_size.dart';
import 'product_widget.dart';

class BuyBackSection extends StatelessWidget {
  final Size size;
  final ScreenLayout layout;
  const BuyBackSection({
    super.key,
    required this.size,
    required this.layout,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Buyback",
          style: TextStyle(
            fontSize: AppSize.getSize(size.width, 45, layout),
            color: AppColor.primary,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          "あなたのデバイス、新しい価値へ。",
          style: TextStyle(
            fontSize: AppSize.getSize(size.width, 45, layout),
            color: AppColor.primary,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          "Your Device, Onto New Value.",
          style: TextStyle(
            fontSize: AppSize.getSize(size.width, 45, layout),
            color: AppColor.primary,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 40),
        Text(
          "With Apple Trade In, you can get a great value in exchange for your current device and apply it towards a purchase today. And you can do it all online (iPhone) or at any Apple Store (iPhone, Mac notebooks, iPad and Apple Watch). If your device isn't eligible for credit, we'll help you recycle it for free. It's a win-win for you and the planet.",
          style: TextStyle(
            fontSize: AppSize.getSize(size.width, 30, layout),
            color: AppColor.primary,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 40),
        SizedBox(
          width: double.infinity,
          child: Text(
            "まずは、買取価格をチェックする。",
            style: TextStyle(
              fontSize: AppSize.getSize(size.width, 35, layout),
              color: AppColor.primary,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            Expanded(
              child: ProductWidget(
                size: size,
                layout: layout,
                name: "スマートフォン",
                image: AppImage.p1,
                widgetHeight: 500,
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                children: [
                  ProductWidget(
                    size: size,
                    layout: layout,
                    name: "タブレット",
                    image: AppImage.p2,
                    widgetHeight: 245,
                  ),
                  const SizedBox(height: 10),
                  ProductWidget(
                    size: size,
                    layout: layout,
                    name: "ノートパソコン",
                    image: AppImage.p3,
                    widgetHeight: 245,
                  ),
                ],
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                children: [
                  ProductWidget(
                    size: size,
                    layout: layout,
                    name: "スマートウォッチ",
                    image: AppImage.p4,
                    widgetHeight: 245,
                  ),
                  const SizedBox(height: 10),
                  ProductWidget(
                    size: size,
                    layout: layout,
                    name: "アクセサリー",
                    image: AppImage.p5,
                    widgetHeight: 245,
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 40),
      ],
    );
  }
}
