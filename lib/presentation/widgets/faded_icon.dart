import 'package:flutter/material.dart';

import '../../utils/app_color.dart';
import '../../utils/app_enum.dart';
import '../../utils/app_size.dart';

class FadedIcon extends StatefulWidget {
  final Size size;
  final IconData icon;
  final ScreenLayout layout;
  const FadedIcon({
    super.key,
    required this.size,
    required this.icon,
    required this.layout,
  });

  @override
  State<FadedIcon> createState() => _FadedIconState();
}

class _FadedIconState extends State<FadedIcon> {
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
        builder: (context, hover, child) => AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          child: Icon(
            widget.icon,
            size: AppSize.getSize(widget.size.width, 25, widget.layout),
            color: hover ? AppColor.white : AppColor.white.withOpacity(0.5),
          ),
        ),
      ),
    );
  }
}
