import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YoutubePlayerWidget extends StatefulWidget {
  const YoutubePlayerWidget({Key? key, required this.id}) : super(key: key);

  final String id;

  @override
  State<YoutubePlayerWidget> createState() => _YoutubePlayerWidgetState();
}

class _YoutubePlayerWidgetState extends State<YoutubePlayerWidget> {

  late YoutubePlayerController _controller;

  void runYoutubePlayer(){
    _controller = YoutubePlayerController(
        initialVideoId: widget.id,
      flags: YoutubePlayerFlags(
        enableCaption: false,
        isLive: false,
        autoPlay: false,

      ),
    );
  }

  @override
  void initState() {
    runYoutubePlayer();
    super.initState();
  }

  @override
  void deactivate() {
    _controller.pause();
    super.deactivate();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return YoutubePlayerBuilder(
      onExitFullScreen: (){
        SystemChrome.setPreferredOrientations(DeviceOrientation.values);
      },
      player: YoutubePlayer(
        controller: _controller,
      ),
      builder: (context, player){
        return Container(
          child: player
        );
      },
    );
  }
}
