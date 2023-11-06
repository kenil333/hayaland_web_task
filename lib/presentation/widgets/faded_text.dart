import 'package:flutter/material.dart';

import '../../utils/app_color.dart';
import '../../utils/app_enum.dart';
import '../../utils/app_size.dart';

class FadedText extends StatefulWidget {
  final Size size;
  final String title;
  final ScreenLayout layout;
  const FadedText({
    super.key,
    required this.size,
    required this.title,
    required this.layout,
  });

  @override
  State<FadedText> createState() => _FadedTextState();
}

class _FadedTextState extends State<FadedText> {
  final ValueNotifier<bool> isHover = ValueNotifier<bool>(false);

  @override
  void dispose() {
    isHover.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onHover: (bool hover) {
        isHover.value = hover;
      },
      onTap: () {},
      child: ValueListenableBuilder<bool>(
        valueListenable: isHover,
        builder: (context, hover, child) => AnimatedDefaultTextStyle(
          style: TextStyle(
            fontSize: AppSize.getSize(widget.size.width, 16, widget.layout),
            color: hover ? AppColor.white : AppColor.white.withOpacity(0.5),
          ),
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          child: Text(widget.title),
        ),
      ),
    );
  }
}
