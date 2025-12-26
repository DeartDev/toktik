import 'package:toktik/domain/entities/video_post.dart';

/// Modelo de infraestructura para videos locales
/// 
/// Esta clase actúa como adaptador entre los datos locales (JSON)
/// y la entidad de dominio VideoPost
class LocalVideoModel {
  /// Nombre o título del video
  final String name;
  
  /// Ruta local del archivo de video
  final String videoUrl;
  
  /// Cantidad de likes del video
  final int likes;
  
  /// Cantidad de visualizaciones del video
  final int views;

  /// Constructor del modelo local de video
  LocalVideoModel({
    required this.name,
    required this.videoUrl,
    this.likes = 0,
    this.views = 0
  });

  /// Factory constructor para crear una instancia desde JSON
  /// 
  /// Convierte un Map<String, dynamic> en un LocalVideoModel
  /// Proporciona valores por defecto para campos opcionales
  factory LocalVideoModel.fromJson(Map<String, dynamic> json) => LocalVideoModel(
      name: json['name'] ?? 'No name',
      videoUrl: json['videoUrl'],
      likes: json['likes'] ?? 0,
      views: json['views'] ?? 0,
    );

  /// Convierte el modelo local a una entidad de dominio VideoPost
  /// 
  /// Este método permite la transformación de la capa de infraestructura
  /// a la capa de dominio
  VideoPost toVideoPostEntity() => VideoPost(
    caption: name,
    videoUrl: videoUrl,
    likes: likes,
    views: views
  );

}