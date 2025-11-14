import 'package:flutter/material.dart';

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

    return Image.asset(
      'assets/triplylogowhite.png',
      height: size,
      fit: BoxFit.contain,
    );
  }
}
