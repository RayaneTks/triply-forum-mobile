import 'package:flutter/material.dart';

class AppColors {
  static const Color primaryGreen = Color(0xFF006241);
  static const Color accentGreen = Color(0xFF35C497);
  static const Color lightGreen = Color(0xFF50D4AA);
  static const Color beige = Color(0xFFF5E6D3);
  static const Color darkBeige = Color(0xFFD4C4B0);
  static const Color lightBeige = Color(0xFFFAF2E9);

  static const Color textDark = Color(0xFF1A1A1A);
  static const Color textLight = Color(0xFFFFFFFF);
  static const Color textSecondary = Color(0xFF666666);

  // --- FONDS DE PAGE ---

  static const Color backgroundDarkGreen = Color(0xFF002A1C);

  static const Color backgroundLight = Color(0xFFFAFAFA);
  static const Color backgroundWhite = Color(0xFFFFFFFF);

  // Option 2: Un gris neutre, très clair et moderne
  static const Color backgroundNeutral = Color(0xFFF0F2F5);

  // Option 3: Une touche très subtile de chaleur (très "lounge")
  static const Color backgroundWarm = Color(0xFFF7F5F2);

  // --- COULEURS DE STATUT ---
  static const Color success = Color(0xFF4CAF50);
  static const Color warning = Color(0xFFFF9800);
  static const Color error = Color(0xFFE53935);

  // --- GRADIENTS (conservés pour d'autres usages) ---
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