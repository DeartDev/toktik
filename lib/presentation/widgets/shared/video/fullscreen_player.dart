import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class FullScreenPlayer extends StatefulWidget {

  final String videoUrl;
  final String caption;

  const FullScreenPlayer({super.key, required this.videoUrl, required this.caption});

  @override
  State<FullScreenPlayer> createState() => _FullScreenPlayerState();
}

class _FullScreenPlayerState extends State<FullScreenPlayer> {

  late VideoPlayerController controller;

  @override
  void initState() {
    super.initState();
    
    controller = VideoPlayerController.asset(
      widget.videoUrl,
    )..initialize().then((_) {
        setState(() {});
        controller.play();
        controller.setLooping(true);
      });
  }

  @override
  void dispose() {

    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(future: controller.initialize(), builder: (BuildContext context, AsyncSnapshot<void> snapshot) { 
      if (snapshot.connectionState == ConnectionState.done) {
        return GestureDetector(
          onTap: () {
            if (controller.value.isPlaying) {
              controller.pause();
            } else {
              controller.play();
            }
            setState(() {});
          },
          child: Stack(
            children: [
              SizedBox.expand(
                child: FittedBox(
                  fit: BoxFit.cover,
                  child: SizedBox(
                    width: controller.value.size.width,
                    height: controller.value.size.height,
                    child: VideoPlayer(controller),
                  ),
                ),
              ),
              Positioned(
                bottom: 30,
                left: 20,
                right: 20,
                child: Text(
                  widget.caption,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    shadows: [
                      Shadow(
                        offset: Offset(1, 1),
                        blurRadius: 2,
                        color: Colors.black54,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      } else {
        return const Center(child: CircularProgressIndicator());
      }
    }
    );
  }
}