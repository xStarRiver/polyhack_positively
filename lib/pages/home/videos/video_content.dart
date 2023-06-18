import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoContent extends StatefulWidget {
  final String asset;
  const VideoContent({Key? key, required this.asset}) : super(key: key);

  @override
  State<VideoContent> createState() => _VideoContentState();
}

class _VideoContentState extends State<VideoContent> {
  late VideoPlayerController _videoController;

  @override
  void initState() {
    _videoController = VideoPlayerController.asset(widget.asset)
      ..initialize().then((value) {
        setState(() {
          _videoController.play();
          _videoController.setLooping(true);
        });
      });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          if (_videoController.value.isPlaying) {
            _videoController.pause();
          } else {
            _videoController.play();
          }
        },
        child: VideoPlayer(_videoController));
  }

  @override
  void dispose() {
    _videoController.dispose();
    super.dispose();
  }
}
