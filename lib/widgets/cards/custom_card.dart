import 'package:flutter/material.dart';
import 'package:portfolio_admin_panel/core/constants/palette.dart';

class CustomCard extends StatelessWidget {
  final Widget? child;
  final ShapeBorder? shape;
  const CustomCard({super.key, this.child, this.shape});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: shape ?? RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      color: AppColors.purpleLight,
      child: child,
    );
  }
}
