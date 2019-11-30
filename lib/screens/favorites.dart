import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_youtube/flutter_youtube.dart';
import 'package:fluttertube/api.dart';
import 'package:fluttertube/models/video.dart';
import 'package:fluttertube/store/favorite_store.dart';
import 'package:provider/provider.dart';

class Favorites extends StatelessWidget {
  const Favorites({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Favoritos'),
          centerTitle: true,
        ),
        body: Observer(builder: (_) {
          final _favoriteStore = Provider.of<FavoriteStore>(context);
          if (_favoriteStore.favorites.length == 0) {
            return Center(child: Text('Nenhum video adicionado aos favoritos'));
          }
          return ListView.builder(
            itemCount: _favoriteStore.favorites.length,
            itemBuilder: (BuildContext context, int index) {
              Video _video = _favoriteStore.favorites[index];
              return InkWell(
                child: Row(
                  children: <Widget>[
                    Container(
                      width: 100,
                      height: 50,
                      child: Image.network(_video.thumb),
                    ),
                    Expanded(
                      child: Text(
                        _video.title,
                        maxLines: 2,
                      ),
                    )
                  ],
                ),
                onTap: () {
                  FlutterYoutube.playYoutubeVideoById(
                      apiKey: API_KEY, videoId: _video.id);
                },
                onLongPress: () {
                  _favoriteStore.toggleFavorite(_video);
                },
              );
            },
          );
        }));
  }
}
