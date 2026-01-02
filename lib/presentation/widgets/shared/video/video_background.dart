import 'package:flutter/material.dart';

/// Widget que crea un fondo con gradiente sobre el video
/// 
/// Aplica un gradiente lineal decorativo típicamente usado
/// para mejorar la legibilidad del texto sobre videos
class VideoBackground extends StatelessWidget {
  /// Lista de colores del gradiente
  /// Por defecto va de transparente a negro semi-transparente
  final List<Color> colors;
  
  /// Posiciones de los colores en el gradiente (0.0 a 1.0)
  /// Debe tener la misma longitud que la lista de colores
  final List<double> stops;

  /// Constructor que valida que colors y stops tengan la misma longitud
  const VideoBackground({
    super.key, 
    this.colors = const[
      Colors.transparent,
      Colors.black87
    ],
    this.stops = const[ 0.0, 1.0 ]
  }): assert( colors.length == stops.length, 'Stops and Colors must be same length' );

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: colors,
            stops: stops,
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter
          )
        ),
      )
    );
  }
}