import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:portfolio_admin_panel/core/constants/palette.dart';
import 'package:portfolio_admin_panel/core/layouts/master.dart';
import 'package:portfolio_admin_panel/features/dashboard/presentation/pages/panel_center/panel_center_page.dart';
import 'package:portfolio_admin_panel/features/dashboard/presentation/pages/panel_left/panel_left_page.dart';
import 'package:portfolio_admin_panel/features/dashboard/presentation/pages/panel_right/panel_right_page.dart';
import 'package:portfolio_admin_panel/widgets/drawer/drawer_page.dart';
import 'package:portfolio_admin_panel/responsive_layout.dart';


class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentIndex = 1;

  final List<Widget> _phoneIcons = [
    const Icon(Icons.add, size: 30),
    const Icon(Icons.list, size: 30),
    const Icon(Icons.compare_arrows, size: 30),
  ];
  final List<Widget> _tabletIcons = [
    const Icon(Icons.add, size: 30),
    const Icon(Icons.list, size: 30),
  ];
  final outerController = ScrollController();
  final innerController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Master(
      body: ResponsiveLayout(
        tiny: Container(),
        phone: currentIndex == 0
            ? PanelLeftPage()
            : currentIndex == 1
            ? PanelCenterPage()
            : PanelRightPage(),
        tablet: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              SizedBox(width: 300,child: PanelLeftPage()),
              SizedBox(width: 300,child: PanelCenterPage()),
              SizedBox(width: 300,child: PanelRightPage()),
            ],
          ),
        ),
        largeTablet: Row(
          children: [
            Expanded(child: PanelLeftPage()),
            Expanded(child: PanelCenterPage()),
            Expanded(child: PanelRightPage()),
          ],
        ),
        computer: Row(
          children: [
            Expanded(child: DrawerPage()),
            Expanded(child: PanelLeftPage()),
            Expanded(child: PanelCenterPage()),
            Expanded(child: PanelRightPage()),
          ],
        ),
      ),
      bottomNavigation: ResponsiveLayout.isPhone(context)
          ? CurvedNavigationBar(
        index: currentIndex,
        backgroundColor: AppColors.purpleDark,
        items: _phoneIcons,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
      )
          : const SizedBox(),
    );
  }
}
