import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:flutter_youtube/flutter_youtube.dart';
import 'package:fluttertube/blocs/favorite_bloc.dart';
import 'package:fluttertube/models/video.dart';
import 'package:fluttertube/api.dart';

class Favorites extends StatelessWidget {
  const Favorites({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _favBloc = BlocProvider.of<FavoriteBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Favoritos'),
        centerTitle: true,
      ),
      body: StreamBuilder<Map<String, Video>>(
        stream: _favBloc.outFav,
        initialData: {},
        builder:
            (BuildContext context, AsyncSnapshot<Map<String, Video>> snapshot) {
          return ListView(
            children: snapshot.data.values.map((v) {
              return InkWell(
                child: Row(
                  children: <Widget>[
                    Container(
                      width: 100,
                      height: 50,
                      child: Image.network(v.thumb),
                    ),
                    Expanded(
                      child: Text(
                        v.title,
                        maxLines: 2,
                      ),
                    )
                  ],
                ),
                onTap: () {
                  FlutterYoutube.playYoutubeVideoById(
                      apiKey: API_KEY, videoId: v.id);
                },
                onLongPress: () {
                  _favBloc.toggleFavorite(v);
                },
              );
            }).toList(),
          );
        },
      ),
    );
  }
}
