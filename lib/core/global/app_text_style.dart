import 'package:financial_instruments/core/global/app_color.dart';
import 'package:flutter/material.dart';

class AppTextStyle {
  static const TextStyle pageHeader = TextStyle(
    color: AppColor.pageHeaderText,
    fontSize: 32,
    fontWeight: FontWeight.bold,
  );
  static const TextStyle sectionHeader = TextStyle(
    color: AppColor.pageHeaderText,
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );
  static const TextStyle seeAllButtonStyle = TextStyle(
    color: AppColor.linkButton,
    fontSize: 14,
  );
  static const TextStyle profitPercentage = TextStyle(
    color: AppColor.profit,
    fontWeight: FontWeight.bold,
  );
  static const TextStyle lossPercentage = TextStyle(
    color: AppColor.loss,
    fontWeight: FontWeight.bold,
  );
  static const TextStyle absGrowth = TextStyle(
    color: AppColor.secondaryText,
    fontWeight: FontWeight.w600,
  );
  static const TextStyle ticker = TextStyle(
    fontWeight: FontWeight.w900,
  );
}
