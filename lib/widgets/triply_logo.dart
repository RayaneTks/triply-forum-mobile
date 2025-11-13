import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

class TriplyLogo extends StatelessWidget {
  final double? fontSize;
  final Color? textColor;

  const TriplyLogo({
    super.key,
    this.fontSize,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    final size = fontSize ?? 36.0;
    final color = textColor ?? AppColors.textDark;

    return Text(
      'TriplyForum',
      style: TextStyle(
        fontSize: size,
        fontWeight: FontWeight.bold,
        color: color,
        letterSpacing: 1.0,
      ),
    );
  }
}
