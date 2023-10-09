import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:masaref/core/utils/app_colors.dart';

class CustomListTile extends StatelessWidget {
  final String title;
  final Color textColor;
  final Widget? trailing;
  final double? imageRadius;
  final Color backgroundColor;
  const CustomListTile(
      {super.key,
      required this.title,
      this.textColor = AppColors.colorWhite,
      this.trailing,this.imageRadius,this.backgroundColor=AppColors.primaryColor});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: CircleAvatar(
        radius: imageRadius??20.r,
        backgroundColor: backgroundColor,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 16.sp,
          color: textColor,
          fontWeight: FontWeight.bold,
        ),
      ),
      trailing: trailing,
    );
  }
}
