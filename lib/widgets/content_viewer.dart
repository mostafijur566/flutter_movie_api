import 'package:flutter/material.dart';
import 'package:flutter_movie_api/widgets/small_text_widget.dart';
import 'package:flutter_movie_api/widgets/youtube_player_widget.dart';

class ContentViewer extends StatelessWidget {
  ContentViewer({Key? key, required this.videos}) : super(key: key);

  final List<dynamic> videos;
  String id = '';
  String name = '';

  @override
  Widget build(BuildContext context) {
    for (int i = 0; i < videos.length; i++) {
      if (videos[i].name == 'Official Trailer') {
        id = videos[i].key;
        name = videos[i].name;
        break;
      } else {
        id = videos[0].key;
        name = videos[0].name;
      }
    }

    return id.isEmpty
        ? Container()
        : Column(
      crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SmallTextWidget(
                text: name,
                fontSize: 22,
              ),
              SizedBox(
                height: 10,
              ),
              YoutubePlayerWidget(id: id)
            ],
          );
  }
}
