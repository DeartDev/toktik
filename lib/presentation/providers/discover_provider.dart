import 'package:flutter/material.dart';
import 'package:toktik/domain/entities/video_post.dart';

class DiscoverProvider extends ChangeNotifier{

  bool inicialLoading = true;

  List<VideoPost> videos = [];

  Future<void> loadNextPage() async {

    //todo: implementar la carga de videos

    notifyListeners();

  }



}