import 'package:flutter/material.dart';
import 'package:toktik/domain/entities/video_post.dart';
import 'package:toktik/presentation/widgets/shared/viddeo_buttons.dart';
import 'package:toktik/presentation/widgets/video/fullscreen_player.dart';

class VideoScrollabelView extends StatelessWidget {
  
  final List<VideoPost> videos;
  const VideoScrollabelView({
    super.key,
    required this.videos,
  });

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
    scrollDirection: Axis.vertical,
    physics: const BouncingScrollPhysics(),
    itemCount: videos.length,
    itemBuilder: (context, index){
      final VideoPost videoPost = videos[index];


      return Stack(
      children: [
      //videos
      SizedBox.expand(
        child: FullscreenPlayer(
        
        caption: videoPost.caption,
        videoUrl: videoPost.videoUrl,

        )
      ),



//botones
      Positioned(
      bottom: 40,
      right: 20,
      child: ViddeoButtons(video: videoPost)),
      ],
      );

    },
    );
  }
}
