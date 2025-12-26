import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toktik/config/theme/app_theme.dart';
import 'package:toktik/presentation/providers/discover_provider.dart';
import 'package:toktik/presentation/screens/discover/discover_screen.dart';

/// Punto de entrada principal de la aplicación TokTik
/// Inicializa la aplicación y configura los providers necesarios
void main() => runApp(const MyApp());

/// Widget principal de la aplicación
/// Configura el tema, providers y la pantalla inicial
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Configuración de providers para el manejo de estado
    return MultiProvider(
      providers: [
        // Provider para el descubrimiento de videos
        // lazy: false asegura que se inicialice inmediatamente
        ChangeNotifierProvider(
          lazy: false,
          create: (_) => DiscoverProvider()..loadNextPage()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme().getTheme(),
        title: 'TokTik',
        home: const DiscoverScreen(),
      ),
    );
  }
}