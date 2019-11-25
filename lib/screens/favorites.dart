import 'package:flutter/material.dart';
import 'package:flutter_youtube/flutter_youtube.dart';
import 'package:fluttertube/api.dart';

class Favorites extends StatelessWidget {
  const Favorites({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final _favBloc = BlocProvider.of<FavoriteBloc>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text('Favoritos'),
          centerTitle: true,
        ),

        // TODO: Lista de Favoritos
        body: InkWell(
          child: Row(
            children: <Widget>[
              Container(
                width: 100,
                height: 50,
                child: Image.network(
                    'https://lh3.googleusercontent.com/5EfQBHDb47tchiART6U6yk3yYS9qBYr6VUssB5wHE1AgavqV5E2SSuzyiNkc7UgVng'),
              ),
              Expanded(
                child: Text(
                  'teste',
                  maxLines: 2,
                ),
              )
            ],
          ),
          onTap: () {
            // TODO: Play video
            FlutterYoutube.playYoutubeVideoById(
                apiKey: API_KEY, videoId: '22331432');
          },
          onLongPress: () {
            // TODO: Remover favoritos
          },
        )
        //  StreamBuilder<Map<String, Video>>(
        //   stream: _favBloc.outFav,
        //   initialData: {},
        //   builder:
        //       (BuildContext context, AsyncSnapshot<Map<String, Video>> snapshot) {
        //     return ListView(
        //       children: snapshot.data.values.map((v) {
        //         return InkWell(
        //           child: Row(
        //             children: <Widget>[
        //               Container(
        //                 width: 100,
        //                 height: 50,
        //                 child: Image.network(v.thumb),
        //               ),
        //               Expanded(
        //                 child: Text(
        //                   v.title,
        //                   maxLines: 2,
        //                 ),
        //               )
        //             ],
        //           ),
        //           onTap: () {
        //             FlutterYoutube.playYoutubeVideoById(
        //                 apiKey: API_KEY, videoId: v.id);
        //           },
        //           onLongPress: () {
        //             _favBloc.toggleFavorite(v);
        //           },
        //         );
        //       }).toList(),
        //     );
        //   },
        // ),
        );
  }
}
