// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:toktik/presentation/widgets/shared/video/video_background.dart';
import 'package:video_player/video_player.dart';

/// Widget que reproduce un video en pantalla completa
/// 
/// Maneja la reproducción de videos con controles de pausa/play
/// mediante gestos táctiles. Incluye caption y gradiente de fondo.
class FullScreenPlayer extends StatefulWidget {
  /// URL o ruta del video a reproducir
  final String videoUrl;
  
  /// Texto descriptivo o título del video
  final String caption;

  const FullScreenPlayer({
    super.key,
    required
    this.videoUrl,
    required this.caption
  });

  @override
  State<FullScreenPlayer> createState() => _FullScreenPlayerState();
}

/// Estado privado del reproductor de video
/// 
/// Maneja el ciclo de vida del VideoPlayerController
/// y la reproducción del video
class _FullScreenPlayerState extends State<FullScreenPlayer> {
  /// Controlador del reproductor de video
  late VideoPlayerController controller;

  @override
  void initState() {
    super.initState();

    // Inicializa el controlador con el video desde assets
    // Configura volumen en 0, loop infinito y reproduce automáticamente
    controller = VideoPlayerController.asset( widget.videoUrl )
      ..setVolume(0)
      ..setLooping(true)
      ..play();

  }

  @override
  void dispose() {
    // Libera los recursos del controlador cuando el widget se destruye
    controller.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {

    return FutureBuilder(
      future: controller.initialize(),
      builder: (context, snapshot) {
        // Muestra un indicador de carga mientras el video se inicializa
        if ( snapshot.connectionState != ConnectionState.done ){
          return const Center( child: CircularProgressIndicator( strokeWidth: 2 ));
        }

        // Una vez inicializado, muestra el reproductor con controles
        return GestureDetector(
          onTap: () {
            // Alterna entre pausa y reproducción al tocar la pantalla
            if ( controller.value.isPlaying ) {
              controller.pause();
              return;
            }
            controller.play();
            
          },
          child: AspectRatio(
            aspectRatio: controller.value.aspectRatio,
            child: Stack(
              children: [
        
                // Reproductor de video
                VideoPlayer(controller),
        
                // Gradiente oscuro en la parte inferior
                VideoBackground(
                  stops: const [0.9,1.0],
                ),
        
                // Caption del video posicionado en la parte inferior
                Positioned(
                  bottom: 50,
                  left: 20,
                  child: _VideoCaption( caption: widget.caption )
                ),
        
        
              ],
            ),
          ),
        );

      },
    );
  }
}


/// Widget privado que muestra el caption del video
/// 
/// Renderiza el texto descriptivo del video con un estilo
/// apropiado y limita el texto a un máximo de 2 líneas
class _VideoCaption extends StatelessWidget {
  /// Texto del caption a mostrar
  final String caption;


  const _VideoCaption({super.key, required this.caption });

  @override
  Widget build(BuildContext context) {
    // Obtiene el tamaño de la pantalla para dimensionar el widget
    final size = MediaQuery.of(context).size;
    // Obtiene el estilo de texto grande del tema actual
    final titleStyle = Theme.of(context).textTheme.titleLarge;

    return SizedBox(
      // El caption ocupa el 60% del ancho de la pantalla
      width: size.width * 0.6,
      child: Text( caption, maxLines: 2, style: titleStyle ),
    );
  }
}