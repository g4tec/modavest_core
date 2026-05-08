import 'dart:io';

import 'package:appinio_video_player_plus/appinio_video_player_plus.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

class ModavestVideoPlayer extends StatefulWidget {
  final String videoUrl;
  const ModavestVideoPlayer({super.key, required this.videoUrl});

  @override
  State<ModavestVideoPlayer> createState() => _ModavestVideoPlayerState();
}

class _ModavestVideoPlayerState extends State<ModavestVideoPlayer> {
  CachedVideoPlayerPlus? videoController;
  CustomVideoPlayerController? _customVideoPlayerController;
  ValueNotifier<bool> muteNotifier = ValueNotifier<bool>(false);

  @override
  void initState() {
    _initializeVideo();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    videoController?.dispose();
  }

  Future<void> _initializeVideo() async {
    // final response = await http.get(Uri.parse(widget.videoUrl));
    // final videoData = response.bodyBytes;
    // final tempDir = await getTemporaryDirectory();
    // final videoFile = File('${tempDir.path}/video.mp4');
    // await videoFile.writeAsBytes(videoData);
    videoController =
        CachedVideoPlayerPlus.networkUrl(Uri.parse(widget.videoUrl))
          ..initialize().then((_) {
            setState(() {});
            videoController?.controller.setVolume(0);
          });
    _customVideoPlayerController = CustomVideoPlayerController(
      context: context,
      videoPlayerController: videoController!,
    );
  }

  @override
  Widget build(BuildContext context) {
    return videoController?.controller.value.isInitialized == true
        ? Stack(
            children: [
              AspectRatio(
                aspectRatio: videoController!.controller.value.aspectRatio,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 300,
                  child: CustomVideoPlayer(
                    customVideoPlayerController: _customVideoPlayerController!,
                  ),
                ),
              ),
              Positioned(
                top: 0,
                right: 0,
                child: IconButton(
                  onPressed: () {
                    videoController?.controller
                        .setVolume(muteNotifier.value ? 0 : 1);
                    muteNotifier.value = !muteNotifier.value;
                  },
                  icon: AnimatedBuilder(
                    animation: muteNotifier,
                    builder: ((context, child) {
                      return Icon(
                        muteNotifier.value
                            ? Icons.volume_up
                            : Icons.volume_mute,
                        color: Colors.white,
                      );
                    }),
                  ),
                ),
              )
            ],
          )
        : const Center(child: CircularProgressIndicator());
  }
}
