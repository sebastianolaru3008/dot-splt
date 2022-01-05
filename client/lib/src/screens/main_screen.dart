import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:split/src/bloc/main_screen/main_screen_bloc.dart';
import 'package:split/src/bloc/main_screen/main_screen_event.dart';
import 'package:split/src/bloc/main_screen/main_screen_state.dart';
import 'package:split/src/components/bottom_navigation_bar/custom_bottom_app_bar.dart';
import 'package:split/src/components/bottom_navigation_bar/custom_bottom_app_bar_item.dart';
import 'package:split/src/screens/create_bill_screen/utils/create_bill_navigator.dart';
import 'package:split/src/screens/join_bill_screen/utils/join_bill_navigator.dart';
import 'package:split/src/utils/assets/image_finder.dart';
import 'package:split/src/utils/navigation/back_button_handler.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<MainScreenBloc>(
      create: (BuildContext context) => MainScreenBloc(),
      child: const MainScreenUI(),
    );
  }
}

class MainScreenUI extends StatefulWidget {
  const MainScreenUI({Key? key}) : super(key: key);

  @override
  State<MainScreenUI> createState() => _MainScreenUIState();
}

class _MainScreenUIState extends State<MainScreenUI>
    with SingleTickerProviderStateMixin {
  late final TabController bottomAppTabController;

  final List<Widget> _tabScreens = const [
    CreateBillNavigator(),
    JoinBillNavigator(),
  ];

  void _onTap(int? index, BuildContext context) {
    BlocProvider.of<MainScreenBloc>(context).add(
      SetBottomNavigationIndexEvent(
        currentBottomNavigationBarIndex: index ?? 0,
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    bottomAppTabController =
        TabController(length: _tabScreens.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainScreenBloc, MainScreenState>(
      builder: (BuildContext context, MainScreenState state) {
        return WillPopScope(
          onWillPop: () => BackButtonHandler.handleMainScreenBackButton(
              state.bottomNavigationBarIndex),
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: Center(
              child: TabBarView(
                controller: bottomAppTabController,
                physics: const NeverScrollableScrollPhysics(),
                children: _tabScreens,
              ),
            ),
            bottomNavigationBar: CustomBottomAppBar(
              tabController: bottomAppTabController,
              onTap: (int index) => _onTap(index, context),
              tabs: [
                CustomBottomAppBarItem(
                  icon: ImageFinder.infoIcon,
                  label: "Create",
                ),
                CustomBottomAppBarItem(
                  icon: ImageFinder.infoIcon,
                  label: "Join",
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
