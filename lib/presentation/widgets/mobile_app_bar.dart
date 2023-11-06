import 'package:flutter/material.dart';

import '../../utils/app_color.dart';
import '../../utils/app_enum.dart';
import '../../utils/app_image.dart';
import '../../utils/app_size.dart';

class MobileAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Size size;
  final ScreenLayout layout;
  const MobileAppBar({super.key, required this.size, required this.layout});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: AppColor.white,
      padding: EdgeInsets.symmetric(
        horizontal: size.width * AppSize.getCommonPedding(layout),
      ),
      height: const Size.fromHeight(kToolbarHeight + 15).height,
      child: Row(
        children: [
          Icon(
            Icons.menu,
            size: AppSize.getSize(size.width, 40, layout),
            color: AppColor.primary,
          ),
          Expanded(child: Container()),
          Image.asset(
            AppImage.logo,
            height: 35,
            fit: BoxFit.contain,
          ),
          Expanded(child: Container()),
          Icon(
            Icons.shopping_cart_outlined,
            size: AppSize.getSize(size.width, 40, layout),
            color: AppColor.primary,
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(15);
}
