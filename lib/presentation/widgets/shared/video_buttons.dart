import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:toktik/config/helpers/human_formats.dart';
import 'package:toktik/domain/entities/video_post.dart';

/// Widget que muestra los botones de interacción de un video
/// 
/// Incluye botones para likes y visualizaciones con sus respectivos contadores
class VideoButtons extends StatelessWidget {
  /// Video del cual se mostrarán las estadísticas
  final VideoPost video;

  const VideoButtons({super.key, required this.video});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Botón de likes con icono de corazón
        _CustomIconButtom(
          value: video.likes,
          iconData: Icons.favorite,
          iconColor: Colors.red,
        ),
        
        const SizedBox(height: 20),
        // Botón de visualizaciones con icono de ojo
        _CustomIconButtom(
          value: video.views,
          iconData: Icons.remove_red_eye,  
        ),

        const SizedBox(height: 20),
        // Botón de reproducción con icono de play
        SpinPerfect(
          infinite: true,
          duration: const Duration(seconds: 5),
          child: const _CustomIconButtom(
            value: 0, 
            iconData: Icons.play_circle_outlined,
            ),
        ),
      ],
    );
  }
}

/// Widget privado que representa un botón de icono con contador
/// 
/// Muestra un icono con su valor numérico debajo
class _CustomIconButtom extends StatelessWidget {
  /// Valor numérico a mostrar debajo del icono
  final int value;
  
  /// Icono a mostrar
  final IconData iconData;
  
  /// Color del icono (blanco por defecto)
  final Color? color;

  /// Constructor que establece el color por defecto a blanco si no se especifica
  const _CustomIconButtom({
    required this.value, 
    required this.iconData, 
    Color? iconColor
  }): color = iconColor ?? Colors.white;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Botón de icono interactivo
        IconButton(
            onPressed: () {}, 
            icon: Icon(iconData, color: color, size: 30)
        ),
        
        if(value > 0)
        // Contador de valor
        Text(HumanFormats.humanReadableNumber(value.toDouble())),
      ],
    );
  }
}
