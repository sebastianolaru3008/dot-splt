import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:split/src/theme/colors.dart';
import 'package:split/src/theme/typography.dart';
import 'package:split/src/utils/assets/image_finder.dart';

class CustomTopAppBar {
  static AppBar buildAppBar(
      {required BuildContext context, required String title, VoidCallback? onBackButtonPress, Widget? actionButton}) {
    return AppBar(
      elevation: 0.0,
      toolbarHeight: 48.0,
      centerTitle: true,
      title: Text(title),
      backgroundColor: Colors.transparent,
      titleTextStyle: CustomTypography.h6().copyWith(color: CustomColor.blue3()),
      systemOverlayStyle: const SystemUiOverlayStyle(
        systemNavigationBarColor: Color(0xFF000000),
        statusBarColor: Colors.transparent,
        systemNavigationBarIconBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
      ),
      leading: (onBackButtonPress != null)
          ? IconButton(
              onPressed: onBackButtonPress,
              icon: ImageFinder.leftArrowIcon(),
            )
          : null,
      actions: [
        if (actionButton != null) ...[actionButton]
      ],
    );
  }
}
