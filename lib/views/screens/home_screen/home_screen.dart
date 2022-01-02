import 'package:competenci/configs/app_constants.dart';
import 'package:competenci/views/screens/home_screen/tabs/competenci_tab/competenci_tab.dart';
import 'package:competenci/views/screens/home_screen/tabs/home_tab/home_tab.dart';
import 'package:competenci/views/screens/home_screen/tabs/messages_tab/messages_tab.dart';
import 'package:competenci/views/screens/home_screen/tabs/profile_tab/profile_tab.dart';
import 'package:competenci/views/screens/home_screen/tabs/schedule_tab/schedule_tab.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class HomeScreen extends StatefulWidget {
  final String avatar;
  final String profileName;

  const HomeScreen({
    Key? key,
    required this.avatar,
    required this.profileName,
  }) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late PersistentTabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController(initialIndex: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kCulturedWhite,
      body: SafeArea(
        child: PersistentTabView(
          context,
          controller: _controller,
          screens: _buildScreens(),
          items: _navBarsItems(),
          navBarStyle: NavBarStyle.style15,
          popAllScreensOnTapOfSelectedTab: true,
          navBarHeight: 80.0,
          stateManagement: true,
          popActionScreens: PopActionScreensType.all,
          itemAnimationProperties: const ItemAnimationProperties(
            // Navigation Bar's items animation properties.
            duration: Duration(milliseconds: 200),
            curve: Curves.ease,
          ),
          screenTransitionAnimation: const ScreenTransitionAnimation(
            // Screen transition animation on change of selected tab.
            animateTabTransition: true,
            curve: Curves.ease,
            duration: Duration(milliseconds: 200),
          ),
        ),
      ),
    );
  }

  List<Widget> _buildScreens() {
    return const [
      HomeTabView(),
      ScheduleTabView(),
      CompetenciTabView(),
      MessagesTabView(),
      ProfileTabView(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const ImageIcon(
          AssetImage('assets/icons/home_icon.png'),
        ),
        title: ("Home"),
        textStyle: Theme.of(context).textTheme.button,
      ),
      PersistentBottomNavBarItem(
        icon: const ImageIcon(
          AssetImage(
            'assets/icons/schedule_icon.png',
          ),
        ),
        title: ("Schedule"),
        textStyle: Theme.of(context).textTheme.button,
      ),
      PersistentBottomNavBarItem(
        icon: const ImageIcon(
          AssetImage(
            'assets/images/logo.png',
          ),
          color: Colors.white,
          size: 48.0,
        ),
      ),
      PersistentBottomNavBarItem(
        icon: const ImageIcon(
          AssetImage(
            'assets/icons/messages_icon.png',
          ),
        ),
        title: ("Messages"),
        textStyle: Theme.of(context).textTheme.button,
      ),
      PersistentBottomNavBarItem(
        icon: const ImageIcon(
          AssetImage(
            'assets/icons/user_icon.png',
          ),
        ),
        title: ("Profile"),
        textStyle: Theme.of(context).textTheme.button,
      ),
    ];
  }
}
