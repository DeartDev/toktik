/// Entidad de dominio que representa un video post
/// 
/// Esta clase define la estructura de datos de un video dentro de la aplicación,
/// incluyendo su información de interacción (likes, vistas) y contenido (caption, URL)
class VideoPost {
  /// Texto descriptivo o título del video
  final String caption;
  
  /// URL o ruta del archivo de video
  final String videoUrl;
  
  /// Cantidad de likes que ha recibido el video
  final int likes;
  
  /// Cantidad de visualizaciones del video
  final int views;

  /// Constructor de VideoPost
  /// 
  /// [caption] y [videoUrl] son requeridos
  /// [likes] y [views] son opcionales y por defecto tienen valor 0
  VideoPost({
    required this.caption,
    required this.videoUrl,
    this.likes = 0,
    this.views = 0,
  });
}