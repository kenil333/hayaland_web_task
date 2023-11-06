import 'package:flutter/material.dart';

import '../../utils/app_color.dart';
import '../../utils/app_enum.dart';
import '../../utils/app_size.dart';
import '../widgets/buy_back_section.dart';
import '../widgets/custom_bottom_appbar.dart';
import '../widgets/custom_top_appbar.dart';
import '../widgets/faq_slider.dart';
import '../widgets/mobile_app_bar.dart';
import '../widgets/top_view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background,
      body: LayoutBuilder(
        builder: (context, constraint) {
          final Size screenSize = Size(
            constraint.maxWidth,
            constraint.maxHeight,
          );
          ScreenLayout layout = ScreenLayout.desktop;
          if (constraint.maxWidth > 1200) {
            layout = ScreenLayout.desktop;
          } else if (constraint.maxWidth > 800 && constraint.maxWidth <= 1200) {
            layout = ScreenLayout.tablet;
          } else {
            layout = ScreenLayout.mobile;
          }
          return CustomScrollView(
            slivers: [
              if (layout != ScreenLayout.mobile)
                SliverAppBar(
                  backgroundColor: Colors.white,
                  expandedHeight: 80,
                  elevation: 0,
                  flexibleSpace: CustomTopAppBar(
                    size: screenSize,
                    layout: layout,
                  ),
                ),
              if (layout != ScreenLayout.mobile)
                SliverAppBar(
                  backgroundColor: Colors.black,
                  pinned: true,
                  elevation: 0,
                  bottom: CustomBottomAppBar(
                    size: screenSize,
                    layout: layout,
                  ),
                ),
              if (layout == ScreenLayout.mobile)
                SliverAppBar(
                  backgroundColor: Colors.white,
                  pinned: true,
                  elevation: 0,
                  bottom: MobileAppBar(
                    size: screenSize,
                    layout: layout,
                  ),
                ),
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(
                        horizontal:
                            screenSize.width * AppSize.getCommonPedding(layout),
                      ),
                      child: Column(
                        children: [
                          SizedBox(
                              height: AppSize.getSize(
                                  screenSize.width, 20, layout)),
                          TopView(size: screenSize, layout: layout),
                          SizedBox(
                            height:
                                AppSize.getSize(screenSize.width, 40, layout),
                          ),
                          BuyBackSection(size: screenSize, layout: layout),
                          SizedBox(
                            height:
                                AppSize.getSize(screenSize.width, 80, layout),
                          ),
                          FaqSlider(size: screenSize, layout: layout),
                          SizedBox(
                            height:
                                AppSize.getSize(screenSize.width, 80, layout),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
