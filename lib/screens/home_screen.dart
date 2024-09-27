import 'package:flutter/material.dart';
import 'package:tutorial/themes/colors.dart';
import 'package:tutorial/themes/text_styles.dart';

const _TABS_LIST = ['Home', 'Settings', 'Profile'];

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(vsync: this, length: _TABS_LIST.length);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(backgroundColor: white, title: const Text('Tutorial - Tabbar')),
      body: Container(width: size.width, height: size.height, child: _screenView(context)),
    );
  }

  Widget _screenView(BuildContext context) {
    return Column(
      children: [
        Material(
          color: white,
          elevation: 0.5,
          child: TabBar(
            controller: tabController,
            unselectedLabelColor: dark,
            labelColor: primary,
            unselectedLabelStyle: TextStyles.text16_500.copyWith(color: dark),
            labelStyle: TextStyles.text16_600.copyWith(color: primary),
            indicatorSize: TabBarIndicatorSize.tab,
            physics: const NeverScrollableScrollPhysics(),
            tabs: List.generate(_TABS_LIST.length, (index) => Tab(text: _TABS_LIST[index])).toList(),
          ),
        ),
        Expanded(
          child: TabBarView(
            controller: tabController,
            clipBehavior: Clip.antiAlias,
            physics: const BouncingScrollPhysics(),
            children: [_homepage(context), _settingsPage(context), _profilePage(context)],
          ),
        ),
      ],
    );
  }

  Widget _homepage(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(Icons.home, size: 52, color: primary),
        Text('Home', style: TextStyles.text18_500.copyWith(color: primary)),
        const SizedBox(height: 100),
      ],
    );
  }

  Widget _settingsPage(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(Icons.settings, size: 52, color: primary),
        Text('Settings', style: TextStyles.text18_500.copyWith(color: primary)),
        const SizedBox(height: 100),
      ],
    );
  }

  Widget _profilePage(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(Icons.supervised_user_circle, size: 52, color: primary),
        Text('Profile', style: TextStyles.text18_500.copyWith(color: primary)),
        const SizedBox(height: 100),
      ],
    );
  }
}
