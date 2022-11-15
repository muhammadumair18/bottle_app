import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class ItemVideoView extends StatefulWidget {
  String videoUrl;

  @override
  State<ItemVideoView> createState() => _ItemVideoViewState();

  ItemVideoView({
    required this.videoUrl,
  });
}

class _ItemVideoViewState extends State<ItemVideoView> {
  late VideoPlayerController _controller;
  bool pauseVisibility=false;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = VideoPlayerController.network(
        widget.videoUrl )
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueGrey,
      // height: Get.height,
      // width: Get.width,
      child: _controller.value.isInitialized
          ? Center(
        child: AspectRatio(
            aspectRatio: _controller.value.aspectRatio,
            child: GestureDetector(
                onTap: () {
                  if (_controller.value.isPlaying) {
                    setState(() {
                      _controller.pause();
                      pauseVisibility = true;
                    });
                  } else {
                    setState(() {
                      _controller.play();
                      pauseVisibility = false;
                    });
                  }
                  print(
                      'Play/Pause/Play/Pause/Play/Pause/Play/Pause/Play/Pause/Play/Pause/Play/Pause/');
                },
                child: Stack(
                  children: [
                    VideoPlayer(_controller),
                    Visibility(
                        visible: pauseVisibility,
                        child: Center(
                            child: Icon(
                              Icons.pause,
                              color: Colors.red,
                              size: 70,
                            )))
                  ],
                ))),
      )
          : Center(child: CircularProgressIndicator(color: Colors.red,),),

    );
  }
}
