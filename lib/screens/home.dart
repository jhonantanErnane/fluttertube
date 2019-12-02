import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:fluttertube/delegates/data_search.dart';
import 'package:fluttertube/enums/loading_enum.dart';
import 'package:fluttertube/screens/favorites.dart';
import 'package:fluttertube/store/favorite_store.dart';
import 'package:fluttertube/store/theme_store.dart';
import 'package:fluttertube/store/video_store.dart';
import 'package:fluttertube/tiles/video_tile.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  Home({Key key}) : super(key: key);
  final VideoStore _videoStore = VideoStore();

  @override
  Widget build(BuildContext context) {
    final _favoriteStore = Provider.of<FavoriteStore>(context);
    final _themeStore = Provider.of<ThemeStore>(context);

    return Scaffold(
      appBar: AppBar(
        title: GestureDetector(
          onTap: () {
            print('click');
            _themeStore.changeTheme();
          },
          child: Image.asset(
            'images/yt_logo_rgb_dark.png',
            height: 25,
          ),
        ),
        elevation: 0,
        actions: <Widget>[
          Align(
            alignment: Alignment.center,
            child: Observer(
              builder: (context) {
                return Text(
                  '${_favoriteStore.numberOfFav}',
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
                _videoStore.onSearch(result);
              }
            },
          ),
        ],
      ),
      body: Observer(builder: (context) {
        switch (_videoStore.loadingState) {
          case LoadingState.loading:
            return Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(Colors.red),
              ),
            );
            break;
          case LoadingState.error:
            return Center(
              child: Text('Error getting the videos'),
            );
            break;
          case LoadingState.done:
            return ListView.builder(
                itemCount: _videoStore.videos.length + 1,
                itemBuilder: (BuildContext context, int index) {
                  if (_videoStore.videos == null ||
                      _videoStore.videos.length == 0) {
                    return Container();
                  } else if (index < _videoStore.videos.length) {
                    return VideoTile(
                      video: _videoStore.videos[index],
                    );
                  } else if (index > 1) {
                    _videoStore.onSearch(null);
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
                });
            break;
          case LoadingState.none:
          default:
            return Container();
            break;
        }
      }),
    );
  }
}
