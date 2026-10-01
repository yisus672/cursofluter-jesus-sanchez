import 'package:flutter/material.dart';
import 'package:toktik/presentation/widgets/video/video_background.dart';
import 'package:video_player/video_player.dart';

class FullscreenPlayer extends StatefulWidget {
  final String videoUrl;
  final String caption;

  const FullscreenPlayer({
    super.key,
    required this.videoUrl,
    required this.caption,
  });

  @override
  State<FullscreenPlayer> createState() => _FullScreenPlayerState();
}

class _FullScreenPlayerState extends State<FullscreenPlayer> {
  late VideoPlayerController controller;
  late Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    super.initState();

    // 1. Instanciamos el controlador
    controller = VideoPlayerController.asset(widget.videoUrl);

    // 2. Guardamos el Future en una variable para inicializarlo UNA SOLA VEZ
    _initializeVideoPlayerFuture = controller.initialize().then((_) {
      controller.setVolume(1.0); // El volumen máximo permitido es 1.0
      controller.setLooping(true);
      controller.play();
      setState(() {}); // Asegura la actualización del primer frame
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initializeVideoPlayerFuture, // Usamos la variable creada en initState
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return const Center(
            child: CircularProgressIndicator(strokeWidth: 2),
          );
        }



        return GestureDetector(
        onTap: (){//controlar reproduccion de video
        if (controller.value.isPlaying){
        controller.pause();
        return;
          }
          controller.play();
        },
          child: AspectRatio(
            aspectRatio: controller.value.aspectRatio,
            child: Stack(
            children: [
              VideoPlayer(controller),
              //gradiente
              VideoBackground(
              stops: const[0.8,1.0],
              ),
          
              //texto
              Positioned(
              bottom: 50,
              left: 20,
              child: _VideoCaption(caption: widget.caption)
              )
          
            ],
            )
          ),
        );
      },
    );
  }
}
class _VideoCaption extends StatelessWidget {
  final String caption;
  const _VideoCaption({required this.caption});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final titleStyle = Theme.of(context).textTheme.titleLarge;

    return SizedBox(
    width: size.width * 0.6,
    child: Text(caption, maxLines: 2, style: titleStyle,),
    );
  }
}