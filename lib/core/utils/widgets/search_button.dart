import 'package:financial_instruments/core/global/app_color.dart';
import 'package:flutter/material.dart';

class SearchButton extends StatelessWidget {
  const SearchButton({super.key, this.onTap});

  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: const Icon(
        Icons.search,
        size: 26,
        color: AppColor.pageHeaderText,
      ),
    );
  }
}
