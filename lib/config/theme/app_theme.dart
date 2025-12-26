import 'package:flutter/material.dart';

/// Clase que define el tema visual de la aplicación
/// 
/// Centraliza la configuración del tema para mantener
/// consistencia visual en toda la aplicación
class AppTheme { 

  /// Retorna el tema configurado para la aplicación
  /// 
  /// Actualmente utiliza un tema oscuro (dark mode)
  /// para mejorar la experiencia visual similar a TikTok
  ThemeData getTheme() => ThemeData(
    brightness: Brightness.dark,
  );

}