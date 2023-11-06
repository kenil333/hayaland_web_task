import 'package:flutter/material.dart';

import '../../utils/app_color.dart';
import '../../utils/app_enum.dart';
import '../../utils/app_image.dart';
import '../../utils/app_size.dart';
import 'animated_underline_text.dart';

class CustomTopAppBar extends StatelessWidget {
  final Size size;
  final ScreenLayout layout;
  const CustomTopAppBar({
    super.key,
    required this.size,
    required this.layout,
  });

  @override
  Widget build(BuildContext context) {
    return FlexibleSpaceBar(
      background: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(
          horizontal: size.width * AppSize.getCommonPedding(layout),
        ),
        color: AppColor.white,
        child: Row(
          children: [
            Image.asset(
              AppImage.logo,
              height: 50,
              fit: BoxFit.contain,
            ),
            Expanded(child: Container()),
            AnimatedUnderlineText(
              size: size,
              title: "コーポレートサイト",
              underelinWidth: 150,
              layout: layout,
            ),
            SizedBox(width: AppSize.getSize(size.width, 75, layout)),
            AnimatedUnderlineText(
              size: size,
              title: "法人のお客様",
              underelinWidth: 100,
              layout: layout,
            ),
            SizedBox(width: AppSize.getSize(size.width, 75, layout)),
            const Icon(
              Icons.search,
              color: AppColor.primary,
              size: 38,
            ),
          ],
        ),
      ),
    );
  }
}
