import 'package:flutter/material.dart';
import 'package:portfolio_admin_panel/core/constants/palette.dart';
import 'package:portfolio_admin_panel/core/constants/sizes.dart';
import 'package:portfolio_admin_panel/responsive_layout.dart';

class DrawerPage extends StatefulWidget {

  @override
  State<DrawerPage> createState() => _DrawerPageState();
}

class ButtonsInfo {
  String title;
  IconData icon;
  ButtonsInfo({required this.title, required this.icon,});
}
int _currentIndex = 0;
List<ButtonsInfo> _buttonNames = [
  ButtonsInfo(title: "Home", icon: Icons.home),
  ButtonsInfo(title: "Setting", icon: Icons.settings),
  ButtonsInfo(title: "Contacts", icon: Icons.contact_phone_rounded),
];

class _DrawerPageState extends State<DrawerPage> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AppSizes.kPadding),
          child: Column(
            children: [
              ListTile(
                title: const Text(
                  "Admin Menu",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                trailing: ResponsiveLayout.isComputer(context) ? null : IconButton(onPressed: (){
                  Navigator.pop(context);
                }, icon: const Icon(Icons.close, color: Colors.white,)),
              ),
              ...List.generate(_buttonNames.length, (index) => Column(
                children: [
                  Container(
                    decoration: index == _currentIndex ? BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: LinearGradient(colors: [
                        AppColors.redDark.withOpacity(0.9),
                        AppColors.orangeDark.withOpacity(0.9),
                      ])
                    ) : null,
                    child: ListTile(
                      title: Text(
                          _buttonNames[index].title,
                        style: const TextStyle(
                          color: Colors.white
                        ),
                      ),
                      leading: Padding(
                        padding: const EdgeInsets.all(AppSizes.kPadding),
                        child: Icon(_buttonNames[index].icon, color: Colors.white,),
                      ),
                      onTap: (){
                        setState(() {
                          _currentIndex = index;
                        });
                      },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)
                      ),
                    ),
                  ),
                  const Divider(
                    color: Colors.white,
                    thickness: 0.1,
                  )
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }
}
