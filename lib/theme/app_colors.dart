import 'package:flutter/material.dart';

class AppColors {
  // Couleurs principales Triply
  static const Color primaryGreen = Color.fromARGB(255, 64, 202, 71); // Vert foncé
  static const Color accentGreen = Color.fromARGB(255, 152, 236, 100); // Vert moyen
  static const Color lightGreen = Color.fromARGB(255, 164, 229, 135); // Vert clair/mint
  static const Color beige = Color(0xFFF5E6D3); // Beige
  static const Color darkBeige = Color(0xFFD4C4B0); // Beige foncé
  
  // Couleurs de texte
  static const Color textDark = Color(0xFF1A1A1A);
  static const Color textLight = Color(0xFFFFFFFF);
  static const Color textSecondary = Color(0xFF666666);
  
  // Couleurs d'arrière-plan
  static const Color backgroundLight = Color(0xFFFAFAFA);
  static const Color backgroundWhite = Color(0xFFFFFFFF);
  
  // Couleurs d'état
  static const Color success = Color(0xFF4CAF50);
  static const Color warning = Color(0xFFFF9800);
  static const Color error = Color(0xFFE53935);
  
  // Dégradés
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

