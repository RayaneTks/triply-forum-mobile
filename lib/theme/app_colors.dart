import 'package:flutter/material.dart';

class AppColors {
  static const Color primaryGreen = Color(0xFF006241);
  static const Color accentGreen = Color(0xFF35C497);
  static const Color lightGreen = Color(0xFF50D4AA);
  static const Color beige = Color(0xFFF5E6D3);
  static const Color darkBeige = Color(0xFFD4C4B0);
  
  static const Color textDark = Color(0xFF1A1A1A);
  static const Color textLight = Color(0xFFFFFFFF);
  static const Color textSecondary = Color(0xFF666666);
  
  static const Color backgroundLight = Color(0xFFFAFAFA);
  static const Color backgroundWhite = Color(0xFFFFFFFF);
  
  static const Color success = Color(0xFF4CAF50);
  static const Color warning = Color(0xFFFF9800);
  static const Color error = Color(0xFFE53935);
  
  static const LinearGradient primaryGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [primaryGreen, accentGreen],
  );
  
  static const LinearGradient lightGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [lightGreen, Color(0xFF9FD88F)],
  );
}

