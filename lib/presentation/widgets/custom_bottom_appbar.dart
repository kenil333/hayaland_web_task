import 'package:flutter/material.dart';

import '../../utils/app_color.dart';
import '../../utils/app_enum.dart';
import '../../utils/app_size.dart';
import 'faded_icon.dart';
import 'faded_text.dart';

class CustomBottomAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  final Size size;
  final ScreenLayout layout;
  const CustomBottomAppBar({
    super.key,
    required this.size,
    required this.layout,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: AppColor.primary,
      padding: EdgeInsets.symmetric(
        horizontal: size.width * AppSize.getCommonPedding(layout),
      ),
      height: const Size.fromHeight(kToolbarHeight).height,
      child: Row(
        children: [
          FadedText(size: size, title: "ホーム", layout: layout),
          Expanded(child: Container()),
          FadedText(size: size, title: "ショップ", layout: layout),
          Expanded(child: Container()),
          FadedText(size: size, title: "アウトレット", layout: layout),
          Expanded(child: Container()),
          FadedText(size: size, title: "ガイド", layout: layout),
          Expanded(child: Container()),
          FadedText(size: size, title: "よくある質問", layout: layout),
          Expanded(child: Container()),
          FadedText(size: size, title: "お問い合わせ", layout: layout),
          Expanded(child: Container()),
          FadedIcon(size: size, icon: Icons.shopping_cart, layout: layout),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(0);
}
