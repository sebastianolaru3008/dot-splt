import 'package:flutter/material.dart';
import 'package:split/src/utils/assets/image_finder.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late final int _currentTabIndex;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _currentTabIndex = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: ImageFinder.infoIcon, label: "Create"),
          BottomNavigationBarItem(icon: ImageFinder.infoIcon, label: "Join")
        ],
        currentIndex: _currentTabIndex,
      ),
    );
  }
}
