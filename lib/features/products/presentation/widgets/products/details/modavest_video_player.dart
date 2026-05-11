import 'dart:io';

// import 'package:appinio_video_player_plus/appinio_video_player_plus.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:video_player/video_player.dart';

class ModavestVideoPlayer extends StatefulWidget {
  final String videoUrl;
  const ModavestVideoPlayer({super.key, required this.videoUrl});

  @override
  State<ModavestVideoPlayer> createState() => _ModavestVideoPlayerState();
}

class _ModavestVideoPlayerState extends State<ModavestVideoPlayer> {
  VideoPlayerController? _controller;
  ValueNotifier<bool> muteNotifier = ValueNotifier<bool>(false);

  @override
  void initState() {
    super.initState();
    _initializeVideo();
  }

  @override
  void dispose() {
    _controller?.dispose();
    muteNotifier.dispose();
    super.dispose();
  }

  Future<void> _initializeVideo() async {
    final response = await http.get(Uri.parse(widget.videoUrl));
    final videoData = response.bodyBytes;
    final tempDir = await getTemporaryDirectory();
    final videoFile = File('${tempDir.path}/video.mp4');
    await videoFile.writeAsBytes(videoData);
    _controller = VideoPlayerController.file(videoFile);
    await _controller!.initialize();
    await _controller!.setVolume(0);
    await _controller!.play();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final controller = _controller;

    if (controller == null || !controller.value.isInitialized) {
      return const Center(child: CircularProgressIndicator());
    }

    return Stack(
      children: [
        AspectRatio(
          aspectRatio: controller.value.aspectRatio,
          child: VideoPlayer(controller),
        ),
        Positioned(
          top: 0,
          right: 0,
          child: IconButton(
            onPressed: () {
              final muted = muteNotifier.value;
              controller.setVolume(muted ? 0 : 1);
              muteNotifier.value = !muted;
            },
            icon: AnimatedBuilder(
              animation: muteNotifier,
              builder: (context, child) {
                return Icon(
                  muteNotifier.value ? Icons.volume_up : Icons.volume_mute,
                  color: Colors.white,
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
