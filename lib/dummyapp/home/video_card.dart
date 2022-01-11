import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoCard extends StatefulWidget {
  const VideoCard({Key? key}) : super(key: key);

  @override
  _VideoCardState createState() => _VideoCardState();
}

class _VideoCardState extends State<VideoCard> {
  late VideoPlayerController _videoController;
  late Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    super.initState();
    _videoController = VideoPlayerController.asset('assets/my/funny.mp4');
    _initializeVideoPlayerFuture = _videoController.initialize();
    _videoController.setLooping(true);
    _videoController.setVolume(1.0);
    super.initState();
  }

  @override
  void dispose() {
    _videoController.dispose();
    super.dispose();
  }

  bool play = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          play = false;
          _videoController.pause();

          // if (_videoController.value.isPlaying) {
          //   _videoController.pause();
          // } else {
          //   _videoController.play();
          // }
        });
      },
      child: Stack(
        children: [
          Container(
            height: 350,
            decoration: const BoxDecoration(
              color: Colors.orange,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(80.0),
                bottomLeft: Radius.circular(80.0),
              ),
              boxShadow: [
                BoxShadow(
                  color: Color(0xFFaba9a9),
                  offset: Offset(0.0, 4.0), //(x,y)
                  blurRadius: 5.0,
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(80),
                  topRight: Radius.circular(80)),
              child: FutureBuilder(
                future: _initializeVideoPlayerFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return AspectRatio(
                      aspectRatio: _videoController.value.aspectRatio,
                      child: VideoPlayer(_videoController),
                    );
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
            ),
          ),
          SizedBox(
            height: 350,
            child: Center(
              child: IconButton(
                onPressed: () {
                  setState(() {
                    play = false;
                    _videoController.play();
                  });
                },
                icon: play
                    ? const Icon(
                        Icons.ac_unit,
                        size: 50,
                        color: Colors.white,
                      )
                    : const Icon(
                        Icons.play_circle_outline,
                        size: 50,
                        color: Colors.white,
                      ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(14.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Travel",
                  style: TextStyle(
                    color: Colors.grey[300],
                    fontWeight: FontWeight.w900,
                    fontSize: 25,
                  ),
                ),
                Text(
                  "50 Questions",
                  style: TextStyle(
                    color: Colors.grey[300],
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
