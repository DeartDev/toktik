import 'package:flutter/material.dart';
import 'package:toktik/domain/entities/video_post.dart';
import 'package:toktik/infrastructure/models/local_video_model.dart';
import 'package:toktik/shared/data/local_video_posts.dart';

/// Provider para gestionar el estado de la pantalla de descubrimiento
/// 
/// Maneja la carga de videos y notifica a los widgets cuando hay cambios
/// en la lista de videos disponibles
class DiscoverProvider extends ChangeNotifier{

  /// Indica si se está realizando la carga inicial de videos
  bool inicialLoading = true;

  /// Lista de videos cargados y disponibles para mostrar
  List<VideoPost> videos = [];

  /// Carga la siguiente página de videos
  /// 
  /// Simula una petición asíncrona con un delay de 2 segundos,
  /// convierte los datos locales a entidades de dominio y
  /// notifica a los listeners sobre los cambios
  Future<void> loadNextPage() async {
    // Simula tiempo de carga de una petición de red
    await Future.delayed(const Duration(seconds: 2));

    // Convierte los datos JSON a entidades VideoPost
    final List<VideoPost> newVideos = videoPosts
        .map((video) => LocalVideoModel.fromJson(video).toVideoPostEntity())
        .toList();

    // Añade los nuevos videos a la lista existente
    videos.addAll(newVideos);
    
    // Marca que la carga inicial ha finalizado
    inicialLoading = false;

    // Notifica a los widgets que escuchan este provider
    notifyListeners();
  }

}