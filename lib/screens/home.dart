import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:fluttertube/delegates/data_search.dart';
import 'package:fluttertube/models/video.dart';
import 'package:fluttertube/screens/favorites.dart';
import 'package:fluttertube/store/video_store.dart';
import 'package:fluttertube/tiles/video_tile.dart';

class Home extends StatelessWidget {
  Home({Key key}) : super(key: key);
  final VideoStore _videoStore = VideoStore();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          'images/yt_logo_rgb_dark.png',
          height: 25,
        ),
        elevation: 0,
        actions: <Widget>[
          Align(
            alignment: Alignment.center,
            // TODO: Numero de favoritos
            child: Text(
              '3',
              textAlign: TextAlign.center,
            ),
          ),
          IconButton(
            icon: Icon(Icons.star),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => Favorites()));
            },
          ),
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () async {
              String result =
                  await showSearch(context: context, delegate: DataSearch());
              if (result != null) {
                _videoStore.onSearch(result);
              }
            },
          ),
        ],
      ),

      // TODO: Renderização da lista
      body: Observer(builder: (context) {
        return ListView.builder(
            itemCount: _videoStore.videos.length,
            itemBuilder: (BuildContext context, int index) {
              if (_videoStore.videos == null ||
                  _videoStore.videos.length == 0) {
                return Container();
              } else {
                return VideoTile(
                  video: _videoStore.videos[index],
                );
              }
            });

        //   return Container(
        //     height: 40,
        //     width: 40,
        //     alignment: Alignment.center,
        //     child: CircularProgressIndicator(
        //       valueColor: AlwaysStoppedAnimation(Colors.red),
        //     ),
        //   );
      }),
    );
  }
}
