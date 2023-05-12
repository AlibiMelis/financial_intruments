import 'package:financial_instruments/core/global/app_color.dart';
import 'package:financial_instruments/core/global/app_text_style.dart';
import 'package:flutter/material.dart';

class SeeAllButton extends StatelessWidget {
  const SeeAllButton({super.key, this.onTap});

  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: Colors.transparent,
        padding: const EdgeInsets.all(8),
        child: Row(
          children: const [
            Text('See all', style: AppTextStyle.seeAllButtonStyle),
            Icon(Icons.arrow_right_alt, color: AppColor.linkButton),
          ],
        ),
      ),
    );
  }
}
