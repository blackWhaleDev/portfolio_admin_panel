import 'package:flutter/material.dart';
import 'package:portfolio_admin_panel/core/constants/palette.dart';
import 'package:portfolio_admin_panel/core/constants/sizes.dart';
import 'package:portfolio_admin_panel/responsive_layout.dart';

List<String> _buttonNames = ["Overview", "Revenue", "Sales"];
int _currentSelectedButton = 0;

class AppBarWidget extends StatefulWidget {
  @override
  State<AppBarWidget> createState() => _AppBarWidgetState();
}

class _AppBarWidgetState extends State<AppBarWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.purpleLight,
      child: Row(
        children: [
          if (ResponsiveLayout.isComputer(context))
            Container(
              margin: const EdgeInsets.all(AppSizes.kPadding),
              height: double.infinity,
              decoration: const BoxDecoration(boxShadow: [
                BoxShadow(
                    color: Colors.black45,
                    offset: Offset(0, 0),
                    spreadRadius: 1,
                    blurRadius: 10),
              ], shape: BoxShape.circle),
              child: CircleAvatar(
                backgroundColor: Colors.pink,
                radius: 30,
                child: Image.asset("images/mapp.png"),
              ),
            )
          else
            IconButton(
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                iconSize: 30,
                color: Colors.white,
                icon: const Icon(Icons.menu)),
          const SizedBox(
            width: AppSizes.kPadding,
          ),
          const Spacer(),
          if (ResponsiveLayout.isComputer(context))
            ...List.generate(
                _buttonNames.length,
                (index) => TextButton(
                    onPressed: () {
                      setState(() {
                        _currentSelectedButton = index;
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(AppSizes.kPadding * 2),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            _buttonNames[index],
                            style: TextStyle(
                                color: _currentSelectedButton == index
                                    ? Colors.white
                                    : Colors.white70),
                          ),
                          Container(
                            margin:
                                const EdgeInsets.all(AppSizes.kPadding / 2),
                            width: 60,
                            height: 2,
                            decoration: BoxDecoration(
                                gradient: _currentSelectedButton == index
                                    ? const LinearGradient(colors: [
                                        AppColors.redDark,
                                        AppColors.orangeDark
                                      ])
                                    : null),
                          )
                        ],
                      ),
                    )))
          else
            Padding(
              padding: const EdgeInsets.all(AppSizes.kPadding * 2),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    _buttonNames[_currentSelectedButton],
                    style: const TextStyle(color: Colors.white),
                  ),
                  Container(
                    margin: const EdgeInsets.all(AppSizes.kPadding / 2),
                    width: 60,
                    height: 2,
                    decoration: const BoxDecoration(
                        gradient: LinearGradient(
                            colors: [AppColors.redDark, AppColors.orangeDark])),
                  )
                ],
              ),
            ),
          const Spacer(),
          IconButton(
              color: Colors.white,
              iconSize: 30,
              onPressed: () {},
              icon: const Icon(Icons.search)),
          Stack(
            children: [
              IconButton(
                  color: Colors.white,
                  iconSize: 30,
                  onPressed: () {},
                  icon: const Icon(Icons.notifications_none_outlined)),
              const Positioned(
                  left: 6,
                  top: 6,
                  child: CircleAvatar(
                    backgroundColor: Colors.pink,
                    radius: 8,
                    child: Text(
                      "3",
                      style: TextStyle(fontSize: 10, color: Colors.white),
                    ),
                  ))
            ],
          ),
          if (!ResponsiveLayout.isPhone(context))
            Container(
              margin: const EdgeInsets.all(AppSizes.kPadding),
              height: double.infinity,
              decoration: const BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black45,
                        offset: Offset(0, 0),
                        spreadRadius: 1,
                        blurRadius: 10),
                  ],
                  shape: BoxShape.circle,
              ),
              child: CircleAvatar(
                backgroundColor: AppColors.orangeDark,
                radius: 30,
                child: Image.asset("images/profile.png"),
              ),
            )
        ],
      ),
    );
  }
}
