import 'package:flutter/material.dart';

import '../../utils/app_color.dart';
import '../../utils/app_enum.dart';
import '../../utils/app_size.dart';

class AnimatedUnderlineText extends StatefulWidget {
  final Size size;
  final String title;
  final double underelinWidth;
  final ScreenLayout layout;
  const AnimatedUnderlineText({
    super.key,
    required this.size,
    required this.title,
    required this.underelinWidth,
    required this.layout,
  });

  @override
  State<AnimatedUnderlineText> createState() => _AnimatedUnderlineTextState();
}

class _AnimatedUnderlineTextState extends State<AnimatedUnderlineText> {
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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            widget.title,
            style: TextStyle(
              fontSize: AppSize.getSize(widget.size.width, 20, widget.layout),
              color: AppColor.primary,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 1),
          ValueListenableBuilder<bool>(
            valueListenable: isHover,
            builder: (context, hover, child) => AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              width: hover
                  ? AppSize.getSize(
                      widget.size.width,
                      widget.underelinWidth,
                      widget.layout,
                    )
                  : 0,
              height: 2,
              color: AppColor.primary,
            ),
          ),
        ],
      ),
    );
  }
}
