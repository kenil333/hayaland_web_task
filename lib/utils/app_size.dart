import 'app_enum.dart';

class AppSize {
  static double getUSerWidth(ScreenLayout layout) {
    if (layout == ScreenLayout.desktop) {
      return 1920;
    } else if (layout == ScreenLayout.tablet) {
      return 1200;
    } else {
      return 800;
    }
  }

  static double getSize(
          double totalWidth, double sizePx, ScreenLayout layout) =>
      totalWidth * (sizePx / getUSerWidth(layout));

  static double getCommonPedding(ScreenLayout layout) {
    if (layout == ScreenLayout.desktop) {
      return 0.22;
    } else if (layout == ScreenLayout.tablet) {
      return 0.08;
    } else {
      return 0.04;
    }
  }
}
