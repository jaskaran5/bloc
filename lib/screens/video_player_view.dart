import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerView extends StatefulWidget {
  const VideoPlayerView(this.url, {super.key});
  final String url;
  @override
  State<VideoPlayerView> createState() => _VideoPlayerViewState();
}

class _VideoPlayerViewState extends State<VideoPlayerView> {
  VideoPlayerController? videoPlayerController;

  @override
  void initState() {
    super.initState();
    initializeVideoPlayerController();
  }

  initializeVideoPlayerController() async {
    videoPlayerController = VideoPlayerController.networkUrl(
        Uri.parse(widget.url),
        videoPlayerOptions:
            VideoPlayerOptions(webOptions: VideoPlayerOptions().webOptions))
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text('Video player'),
          centerTitle: true,
        ),
        body: videoPlayerController == null
            ? const Center(child: CircularProgressIndicator())
            : AspectRatio(
                aspectRatio: 1.0,
                child: VideoPlayer(videoPlayerController!),
              ),
      );
}
