import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:portfolio_admin_panel/core/constants/palette.dart';
import 'package:portfolio_admin_panel/responsive_layout.dart';
import 'package:portfolio_admin_panel/widgets/app_bar/app_bar_widget.dart';
import 'package:portfolio_admin_panel/widgets/drawer/drawer_page.dart';

class Master extends StatefulWidget {
  final Widget? body;
  final Widget? bottomNavigation;
  const Master({super.key, this.body, this.bottomNavigation});

  @override
  State<Master> createState() => _MasterState();
}

class _MasterState extends State<Master> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size(double.infinity, 100),
          child: (ResponsiveLayout.isTinyLimit(context) ||
              ResponsiveLayout.isTinyHeightLimit(context)
              ? Container()
              : AppBarWidget())),
      body: widget.body,
      drawer: DrawerPage(),
      bottomNavigationBar: widget.bottomNavigation,
    );
  }
}
