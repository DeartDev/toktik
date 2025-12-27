import 'package:flutter/material.dart';
import 'package:toktik/domain/entities/video_post.dart';
import 'package:toktik/presentation/widgets/shared/video/fullscreen_player.dart';
import 'package:toktik/presentation/widgets/shared/video_buttons.dart';

/// Widget que muestra una lista de videos en scroll vertical
///
/// Utiliza PageView.builder para crear un scroll suave entre videos
/// de manera similar a la interfaz de TikTok
class VideoScrollableView extends StatelessWidget {
  const VideoScrollableView({super.key, required this.videos});

  /// Lista de videos a mostrar en el scroll
  final List<VideoPost> videos;

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      // Scroll vertical para navegar entre videos
      scrollDirection: Axis.vertical,

      // Física de rebote para mejor experiencia de usuario
      physics: const BouncingScrollPhysics(),

      // Número total de videos disponibles
      itemCount: videos.length,

      // Constructor de cada página/video
      itemBuilder: (context, index) {
        final VideoPost videoPost = videos[index];

        return Stack(
          children: [
            SizedBox.expand(
              child: FullScreenPlayer(
                caption: videoPost.caption,
                videoUrl: videoPost.videoUrl,
              ),
            ),
            // Botones de interacción posicionados en la parte inferior derecha
            Positioned(
                bottom: 40, right: 20, child: VideoButtons(video: videoPost)),
          ],
        );
      },
    );
  }
}
