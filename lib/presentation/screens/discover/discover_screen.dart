import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toktik/presentation/providers/discover_provider.dart';
import 'package:toktik/presentation/widgets/shared/video_scrollable_view.dart';

/// Pantalla principal de descubrimiento de videos
/// 
/// Muestra un feed de videos en formato vertical similar a TikTok.
/// Mientras los videos se cargan, muestra un indicador de carga.
class DiscoverScreen extends StatelessWidget {
  const DiscoverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Escucha los cambios en el DiscoverProvider
    final discoverProvider = context.watch<DiscoverProvider>();

    return Scaffold(
      // Muestra un loading mientras se cargan los videos iniciales
      // Una vez cargados, muestra el scroll de videos
      body: discoverProvider.inicialLoading
          ? const Center(
              child: CircularProgressIndicator(strokeWidth: 2),
            )
          : VideoScrollableView(videos: discoverProvider.videos),
    );
  }
}