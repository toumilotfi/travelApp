import 'package:chewie/chewie.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:video_player/video_player.dart';

final videoZonePlayerController = VideoPlayerController.network(
    'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4');

class VideoZone extends StatefulWidget {
  const VideoZone({
    Key? key,
  }) : super(key: key);

  Future<void> controllerInitializer() async {
    await videoZonePlayerController.initialize();
  }

  @override
  State<VideoZone> createState() => _VideoZoneState();
}

final chewieController = ChewieController(
  videoPlayerController: videoZonePlayerController,
  looping: true,
  autoInitialize: true,
  aspectRatio: 9 / 16,
  allowMuting: true,
  hideControlsTimer: Duration(seconds: 0),
  showControls: false,
  showControlsOnInitialize: false,
);

class _VideoZoneState extends State<VideoZone> {
  @override
  Future<void> controllerInitializer() async {
    await videoZonePlayerController.initialize();
  }

  final playerWidget = Chewie(
    controller: chewieController,
  );

  Widget build(BuildContext context) {
    bool VideoStatus = false;
    void toggleVideoStatus() {
      chewieController.isPlaying
          ? chewieController.pause()
          : chewieController.play();
    }

    return Container(
      color: Colors.black12,
      child: FutureBuilder(
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Stack(children: [
              VideoPlayer(videoZonePlayerController),
              Positioned(
                  bottom: 0.05.sh,
                  right: 0.05.sh,
                  child: GestureDetector(
                    onTap: () {
                      toggleVideoStatus();

                      VideoStatus = !VideoStatus;
                    },
                    child: CircleAvatar(
                      backgroundColor: Colors.red,
                      radius: 25.r,
                      child: Center(
                        child: FaIcon(
                          FontAwesomeIcons.play,
                          size: 0.022.sh,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  )),
              Positioned(
                  bottom: 0.05.sh,
                  left: 0.04.sh,
                  child: GestureDetector(
                    onTap: toggleVideoStatus,
                    child: CircleAvatar(
                      backgroundColor: Colors.transparent,
                      radius: 25.r,
                      child: Center(
                        child: FaIcon(
                          FontAwesomeIcons.arrowDownLong,
                          size: 0.035.sh,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  )),
              Positioned(
                  top: 0.07.sh,
                  left: 0.05.sh,
                  child: GestureDetector(
                    onTap: toggleVideoStatus,
                    child: Container(
                      width: 0.05.sh,
                      height: 0.05.sh,
                      decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.4),
                          borderRadius: BorderRadius.circular(10.r)),
                      child: Center(
                        child: FaIcon(
                          FontAwesomeIcons.arrowLeft,
                          size: 0.022.sh,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ))
            ]);
          } else {
            return Container(
              color: Colors.black12,
            );
          }
        },
      ),
    );
  }
}
