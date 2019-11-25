import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:flutter_youtube/flutter_youtube.dart';
import 'package:fluttertube/blocs/favorite_bloc.dart';
import 'package:fluttertube/models/video.dart';

import '../api.dart';

class VideoTile extends StatelessWidget {
  final Video video;
  const VideoTile({Key key, this.video}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _blocFav = BlocProvider.of<FavoriteBloc>(context);
    return GestureDetector(
      onTap: () {
        FlutterYoutube.playYoutubeVideoById(
          apiKey: API_KEY,
          videoId: video.id,
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            AspectRatio(
              aspectRatio: 16 / 9,
              child: Image.network(
                video.thumb,
                fit: BoxFit.cover,
              ),
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
                        child: Text(
                          video.title,
                          style: TextStyle(fontSize: 16),
                          maxLines: 2,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: Text(
                          video.channel,
                          style: TextStyle(fontSize: 14),
                        ),
                      ),
                    ],
                  ),
                ),
                StreamBuilder<Map<String, Video>>(
                  stream: _blocFav.outFav,
                  initialData: {},
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (!snapshot.hasData) {
                      return CircularProgressIndicator();
                    }
                    return IconButton(
                      icon: Icon(snapshot.data.containsKey(video.id)
                          ? Icons.star
                          : Icons.star_border),
                      onPressed: () {
                        _blocFav.toggleFavorite(video);
                      },
                    );
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
