import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:fluttertube/blocs/favorite_bloc.dart';
import 'package:fluttertube/blocs/videos_bloc.dart';
import 'package:fluttertube/delegates/data_search.dart';
import 'package:fluttertube/models/video.dart';
import 'package:fluttertube/screens/favorites.dart';
import 'package:fluttertube/tiles/video_tile.dart';

class Home extends StatelessWidget {
  const Home({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _favBloc = BlocProvider.of<FavoriteBloc>(context);
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
            child: StreamBuilder<Map<String, Video>>(
              stream: _favBloc.outFav,
              builder: (BuildContext context,
                  AsyncSnapshot<Map<String, Video>> snapshot) {
                if (!snapshot.hasData) {
                  return Container();
                }
                return Text(
                  '${snapshot.data.length}',
                  textAlign: TextAlign.center,
                );
              },
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
                BlocProvider.of<VideosBloc>(context).inSearch.add(result);
              }
            },
          ),
        ],
      ),
      body: StreamBuilder(
        stream: BlocProvider.of<VideosBloc>(context).outVideos,
        initialData: [],
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (!snapshot.hasData) {
            return Container();
          }
          return ListView.builder(
            itemCount: snapshot.data.length + 1,
            itemBuilder: (BuildContext context, int index) {
              if (index < snapshot.data.length) {
                return VideoTile(
                  video: snapshot.data[index],
                );
              } else if (index > 1) {
                BlocProvider.of<VideosBloc>(context).inSearch.add(null);
                return Container(
                  height: 40,
                  width: 40,
                  alignment: Alignment.center,
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation(Colors.red),
                  ),
                );
              } else {
                return Container();
              }
            },
          );
        },
      ),
    );
  }
}
