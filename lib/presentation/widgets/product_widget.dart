import 'package:flutter/material.dart';

import '../../utils/app_color.dart';
import '../../utils/app_enum.dart';
import '../../utils/app_size.dart';

class ProductWidget extends StatefulWidget {
  final Size size;
  final ScreenLayout layout;
  final String name;
  final String image;
  final double widgetHeight;
  const ProductWidget({
    super.key,
    required this.size,
    required this.layout,
    required this.name,
    required this.image,
    required this.widgetHeight,
  });

  @override
  State<ProductWidget> createState() => _ProductWidgetState();
}

class _ProductWidgetState extends State<ProductWidget> {
  final ValueNotifier<bool> isHover = ValueNotifier<bool>(false);

  @override
  void dispose() {
    isHover.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: AppSize.getSize(
        widget.size.width,
        widget.widgetHeight,
        widget.layout,
      ),
      child: Center(
        child: ValueListenableBuilder<bool>(
          valueListenable: isHover,
          builder: (context, hover, child) => InkWell(
            onHover: (bool hover) {
              isHover.value = hover;
            },
            splashColor: AppColor.background,
            highlightColor: AppColor.background,
            hoverColor: AppColor.background,
            onTap: () {},
            child: AnimatedContainer(
              width: double.infinity,
              height: double.infinity,
              margin: EdgeInsets.all(hover
                  ? AppSize.getSize(
                      widget.size.width,
                      15,
                      widget.layout,
                    )
                  : 0),
              padding: EdgeInsets.symmetric(
                horizontal: AppSize.getSize(
                  widget.size.width,
                  20,
                  widget.layout,
                ),
              ),
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInOut,
              decoration: BoxDecoration(
                color: AppColor.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: AppColor.primary.withOpacity(0.2),
                ),
                boxShadow: [
                  BoxShadow(
                    color: AppColor.primary.withOpacity(0.05),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: AppSize.getSize(
                      widget.size.width,
                      15,
                      widget.layout,
                    ),
                  ),
                  Text(
                    widget.name,
                    style: TextStyle(
                      fontSize: AppSize.getSize(
                        widget.size.width,
                        18,
                        widget.layout,
                      ),
                      color: AppColor.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: AppSize.getSize(
                      widget.size.width,
                      15,
                      widget.layout,
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(AppSize.getSize(
                        widget.size.width,
                        15,
                        widget.layout,
                      )),
                      child: Image.asset(
                        widget.image,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: AppSize.getSize(
                      widget.size.width,
                      15,
                      widget.layout,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
