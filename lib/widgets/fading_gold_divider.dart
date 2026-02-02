import 'package:flutter/material.dart';
import 'package:tifinagh_fonts_viewer/core/theme.dart';

class FadingGoldDivider extends StatelessWidget {
  final double verticalMargin;
  final double horizontalMargin;

  const FadingGoldDivider({
    super.key,
    this.verticalMargin = 16,
    this.horizontalMargin = 16,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1,
      width: double.infinity,
      margin: EdgeInsets.symmetric(
        vertical: verticalMargin,
        horizontal: horizontalMargin,
      ),
      decoration: const BoxDecoration(gradient: AppColors.goldFadeGradient),
    );
  }
}
