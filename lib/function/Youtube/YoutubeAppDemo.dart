

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:testfun_project/Config.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class YoutubeAppDemo extends StatefulWidget {
  @override
  _YoutubeAppDemoState createState() => _YoutubeAppDemoState();
}

class _YoutubeAppDemoState extends State<YoutubeAppDemo> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      params: const YoutubePlayerParams(
        showControls: false,
        mute: false,
        showFullscreenButton: false,
        loop: false,
      ),
    )
      ..onInit = () {
        // _controller.loadVideo("https://www.youtube.com/shorts/y6DkNPEA488");
        // _controller.loadVideo("https://www.youtube.com/watch?v=c3ThTZz1DBw");
        _controller.loadVideo("https://www.youtube.com/watch?v=y6DkNPEA488");
      }
      ..onFullscreenChange = (isFullScreen) {
        print('${isFullScreen ? 'Entered' : 'Exited'} Fullscreen.');
      };
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayerScaffold(
      controller: _controller,
      builder: (context, player) {
        return Scaffold(
          // appBar: AppBar(
          //   title: const Text('Youtube Player IFrame Demo'),
          //   actions: const [VideoPlaylistIconButton()],
          // ),
          body: LayoutBuilder(
            builder: (context, constraints) {

              return Container(
                width: full_w, height: full_h-40,
                child: Stack(
                  children: [
                    Container(
                      width: full_w, height: full_h-40,
                      child: player,
                    ),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.close();
    super.dispose();
  }
}

///
class VideoPlaylistIconButton extends StatelessWidget {
  ///
  const VideoPlaylistIconButton({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.ytController;

    return IconButton(
      onPressed: () async {
        controller.pauseVideo();
        controller.playVideo();
        Navigator.of(context).pop(null);
      },
      icon: const Icon(Icons.playlist_play_sharp),
    );
  }
}
