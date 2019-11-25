import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:fluttertube/blocs/videos_bloc.dart';
import 'package:fluttertube/delegates/data_search.dart';
import 'package:fluttertube/models/video.dart';
import 'package:fluttertube/screens/favorites.dart';
import 'package:fluttertube/tiles/video_tile.dart';

class Home extends StatelessWidget {
  const Home({Key key}) : super(key: key);

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
                // TODO: Criar evento de search
                // BlocProvider.of<VideosBloc>(context).inSearch.add(result);
              }
            },
          ),
        ],
      ),

      // TODO: Renderização da lista
      body:
          //  StreamBuilder(
          // stream: BlocProvider.of<VideosBloc>(context).outVideos,
          // initialData: [],
          // builder: (BuildContext context, AsyncSnapshot snapshot) {
          //   if (!snapshot.hasData) {
          //     return Container();
          //   }
          ListView.builder(
        itemCount: 1,
        itemBuilder: (BuildContext context, int index) {
          Video _video = Video(
              channel: '423423',
              id: '142233241',
              thumb:
                  'https://lh3.googleusercontent.com/5EfQBHDb47tchiART6U6yk3yYS9qBYr6VUssB5wHE1AgavqV5E2SSuzyiNkc7UgVng',
              title: 'teste');
          // if (index < snapshot.data.length) {
          return VideoTile(
            video: _video,
          );
          // } else if (index > 1) {
          // BlocProvider.of<VideosBloc>(context).inSearch.add(null);
          //   return Container(
          //     height: 40,
          //     width: 40,
          //     alignment: Alignment.center,
          //     child: CircularProgressIndicator(
          //       valueColor: AlwaysStoppedAnimation(Colors.red),
          //     ),
          //   );
          // } else {
          //   return Container();
          // }
          // },
          // );
        },
      ),
    );
  }
}
