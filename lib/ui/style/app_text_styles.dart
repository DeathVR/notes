import 'package:flutter/material.dart';
import 'package:notes/ui/style/app_colors.dart';

abstract class AppTextStyles {
  static const TextStyle contentTitleStyle = TextStyle(
    fontSize: 16,
    height: 19 / 16,
    color: AppColors.primary,
    fontWeight: FontWeight.w500,
  );
  static const TextStyle contentTextStyle = TextStyle(
    fontSize: 14,
    height: 16 / 14,
    color: AppColors.primary,
  );
  static const OutlineInputBorder valueInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(4)),
    borderSide: BorderSide(
      color: Color(0xff79747E),
    ),
  );
  static const TextStyle modelTitle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w700,
    color: AppColors.primary,
    height: 19 / 16,
  );
}
