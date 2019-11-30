import 'dart:convert';

import 'package:fluttertube/models/video.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'favorite_store.g.dart';

class FavoriteStore = _FavoriteStore with _$FavoriteStore;

abstract class _FavoriteStore with Store {
  // _FavoriteStore() {
  //   _init();
  // }

  // @observable
  // Map<String, Video> favorites = {};
  @observable
  ObservableList<Video> favorites = ObservableList<Video>();

  @computed
  int get numberOfFav => favorites.length; // '${favorites.length}';

  // @observable
  // int numberOfFav = 0; // '${favorites.length}';

  @action
  void toggleFavorite(Video v) {
    if (favorites.contains(v)) {
      favorites.remove(v);
    } else {
      favorites.add(v);
    }
    // await _saveFav();
  }

  Future _init() async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.getKeys().contains('favorites')) {
      favorites = json.decode(prefs.getString('favorites')).map((k, v) {
        return MapEntry(k, Video.fromJson(v));
      }).cast<String, Video>();
    } else {}
    // });
  }

  Future _saveFav() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('favorites', json.encode(favorites));
    // });
  }
}
