import 'package:flutter/material.dart';
import 'package:split/src/theme/colors.dart';
import 'package:split/src/theme/typography.dart';

import 'custom_bottom_app_bar_item.dart';

class CustomBottomAppBar extends StatelessWidget {
  const CustomBottomAppBar(
      {Key? key,
      required this.tabs,
      required this.tabController,
      required this.onTap})
      : super(key: key);

  final List<CustomBottomAppBarItem> tabs;
  final TabController tabController;
  final ValueChanged<int> onTap;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: CustomColor.blue3(),
      child: SizedBox(
        height: 64,
        child: TabBar(
          controller: tabController,
          tabs: tabs,
          labelStyle: CustomTypography.sh3(),
          unselectedLabelStyle: CustomTypography.p3(),
          onTap: onTap,
          indicator: BoxDecoration(
            border: Border(
              top: BorderSide(
                color: CustomColor.blue4(),
                width: 3.0,
              ),
            ),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                CustomColor.blue1(),
                MediaQuery.of(context).viewPadding.bottom > 0
                    ? CustomColor.blue3(opacity: CustomOpacity.inactive)
                    : CustomColor.blue3(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
