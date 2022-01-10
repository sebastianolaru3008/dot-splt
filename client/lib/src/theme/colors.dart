import 'package:flutter/material.dart';

abstract class CustomColor {
  static const opacityDefault = 1.0;
  static const opacityPrimary = 0.9;
  static const opacitySecondary = 0.6;
  static const opacityInactive = 0.38;

  //region Background
  Color background0({CustomOpacity opacity = CustomOpacity.full});

  Color background1({CustomOpacity opacity = CustomOpacity.full});

  Color background2({CustomOpacity opacity = CustomOpacity.full});

  Color background3({CustomOpacity opacity = CustomOpacity.full});

  //endregion

  //region Blue
  static Color corporate({CustomOpacity opacity = CustomOpacity.full}) {
    return Color.fromRGBO(17, 73, 123, opacity.value);
  }

  static Color blue3({CustomOpacity opacity = CustomOpacity.full}) {
    return Color.fromRGBO(0, 104, 180, opacity.value);
  }

  static Color blue4({CustomOpacity opacity = CustomOpacity.full}) {
    return Color.fromRGBO(77, 187, 235, opacity.value);
  }

  //endregion

  //region Status
  static Color warning({CustomOpacity opacity = CustomOpacity.full}) {
    return Color.fromRGBO(246, 170, 51, opacity.value);
  }

  static Color alarm({CustomOpacity opacity = CustomOpacity.full}) {
    return Color.fromRGBO(227, 51, 83, opacity.value);
  }

  static Color allOk({CustomOpacity opacity = CustomOpacity.full}) {
    return Color.fromRGBO(110, 180, 68, opacity.value);
  }

  //endregion

  //region White
  static Color white({CustomOpacity opacity = CustomOpacity.primary}) {
    return Color.fromRGBO(255, 255, 255, opacity.value);
  }

  //endregion

  //region Data visualization
  static Color blue1({CustomOpacity opacity = CustomOpacity.full}) {
    return Color.fromRGBO(51, 134, 195, opacity.value);
  }

  static Color blue2({CustomOpacity opacity = CustomOpacity.full}) {
    return Color.fromRGBO(51, 163, 220, opacity.value);
  }

  static Color green1({CustomOpacity opacity = CustomOpacity.full}) {
    return Color.fromRGBO(122, 191, 168, opacity.value);
  }

  static Color green2({CustomOpacity opacity = CustomOpacity.full}) {
    return Color.fromRGBO(214, 211, 87, opacity.value);
  }

  static Color sand({CustomOpacity opacity = CustomOpacity.full}) {
    return Color.fromRGBO(230, 220, 189, opacity.value);
  }

  //endregion

  //region Overlay
  static Color overlayPopup({CustomOpacity opacity = CustomOpacity.full}) {
    return Color.fromRGBO(18, 21, 22, opacity.value);
  }

  static Color overlayModal({CustomOpacity opacity = CustomOpacity.full}) {
    return Color.fromRGBO(0, 0, 0, opacity.value);
  }

  ///#F5F8F3
  static const Color greysLevel0 = Color.fromRGBO(245, 248, 254, 1.0);

  ///#BDCBDC
  static const Color greysLevel2 = Color.fromRGBO(189, 203, 220, 1.0);

  ///#7B92A8
  static const Color greysLevel3 = Color.fromRGBO(123, 146, 168, 1.0);

  ///#5E7183
  static const Color greysLevel4 = Color.fromRGBO(94, 113, 131, 1.0);

  ///#262D34
  static const Color greysLevel5 = Color.fromRGBO(38, 45, 52, 1.0);

  //endregion

  //region State
  static Color statePressed() {
    return const Color.fromRGBO(18, 21, 22, 0.2);
  }

  static Color stateHover() {
    return const Color.fromRGBO(255, 255, 255, 0.1);
  }

  static Color stateSelectedText() {
    return const Color.fromRGBO(0, 104, 180, 0.6);
  }

  //endregion

  //region blacks
  static Color black3({CustomOpacity opacity = CustomOpacity.full}) {
    return Color.fromRGBO(153, 153, 153, opacity.value);
  }

  static Color black4({CustomOpacity opacity = CustomOpacity.full}) {
    return Color.fromRGBO(51, 51, 51, opacity.value);
  }

  //endregion

  Color get icon;

  Color get iconInactive;

  MaterialColor get themeColor;
}

enum CustomOpacity { full, primary, secondary, inactive }

extension DsmOpacityValue on CustomOpacity {
  static const opacityFull = 1.0;
  static const opacityPrimary = 0.9;
  static const opacitySecondary = 0.6;
  static const opacityInactive = 0.0;

  double get value {
    switch (this) {
      case CustomOpacity.full:
        return opacityFull;
      case CustomOpacity.primary:
        return opacityPrimary;
      case CustomOpacity.secondary:
        return opacitySecondary;
      case CustomOpacity.inactive:
        return opacityInactive;
    }
  }
}
